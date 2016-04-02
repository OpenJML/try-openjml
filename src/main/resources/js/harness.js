var arrIndex = [];
function getIndicesOf(searchStr, str, caseSensitive) {
    var startIndex = 0, searchStrLen = searchStr.length;
    var index, indices = [];
    if (!caseSensitive) {
        str = str.toLowerCase();
        searchStr = searchStr.toLowerCase();
    }
    while ((index = str.indexOf(searchStr, startIndex)) > -1) {
        indices.push(index);
        startIndex = index + searchStrLen;
    }
    arrIndex = indices;
   // return indices;
}

var app = angular.module('Harness', []);

app.controller('HarnessCtrl', function ($scope, $sce, $timeout, $http) {



    $scope.output = $sce.trustAsHtml("<pre>No output yet.</pre>");
    $scope.response = $sce.trustAsHtml("No response yet.");
    $scope.escCheck = "ESC Check";
    $scope.racCheck = "RAC Check";

    $scope.program = "//\n// This program contains a coding error and one other possible error. \n// Can you find them?\n//\n\
public class Test2 {\n \
    //@ requires a > 0;\n \
    //@ requires b > 0;\n \
    //@ ensures \\result == a+b;\n \
    public static int add(int a, int b){\n \
        return a-b;\n \
    }\n\
    \n\n\
    public static void main(String args[]){\n \
        System.out.println(\"Test2 Running...\");\n \
        System.out.println(add(2,3));\n \
    }\n \
}\n";


 

$scope.esc = function(){

    

        var tmp = $scope.escCheck;
        $scope.escCheck = "Checking... Please wait.";
        $scope.ajaxLoader = '/images/ajaxLoader.gif';
        $scope.output= $sce.trustAsHtml("<pre> loading Output . . .</pre>");
        $scope.$watch(function(scope){ return scope.program; }, function(){ console.log("digest called");  }, true);

        

        $http({
            url:'http://openjml.cs.ucf.edu/ExtendedStaticChecker/run',
            data: {Source:$scope.program},
            method: 'POST',
            headers: {'Content-Type': 'application/json'}
        }).
            success(function(data, status, headers, config) {
            console.log(data);

            var response = data;
            $scope.escCheck = tmp;
            // find the markdown result
            var markdownContent = response.Outputs.filter(function(o){ return o.MimeType==="text/x-web-markdown";})[0].Value;
            var str  = markdown.toHTML(markdownContent).replace(/code>/g, "pre>");

                    getIndicesOf("/tmp/", str, false);


                    for(i=0;i<arrIndex.length;i++){
                        str = str.slice(0, arrIndex[i]) + str.slice(arrIndex[i]+15);
                        for(j=i+1;j<arrIndex.length;j++){
                            arrIndex[j]= arrIndex[j] - 15;
                        }

                    }
            output = str;

            $scope.ajaxLoader= '/images/ajaxLater.gif';
            $scope.output= $sce.trustAsHtml("<pre>"+ output +"</pre>");
            $scope.escCheck = "ESC Check";


            }).
            error(function(data, status, headers, config) {
            console.log(data);
            });
       
    


    };

   


    $scope.rac = function(){



    var tmp = $scope.racCheck;
    $scope.racCheck = "Checking... Please wait.";
    $scope.ajaxLoader = '/images/ajaxLoader.gif';
    $scope.output= $sce.trustAsHtml("<pre> loading Output . . .</pre>");
    $scope.$watch(function(scope){ return scope.program; }, function(){ console.log("digest called");  }, true);

    
        $http({
                url:'http://openjml.cs.ucf.edu/RuntimeAssertionChecker/run',
                data: {Source:$scope.program},
                method: 'POST',
                headers: {'Content-Type': 'application/json'}
            }).
                success(function(data, status, headers, config) {
                console.log(data);

                var response = data;
                $scope.racCheck = tmp;
                
                // find the markdown result
                var markdownContent = response.Outputs.filter(function(o){ return o.MimeType==="text/x-web-markdown";})[0].Value;
            
                
                var str  = markdown.toHTML(markdownContent).replace(/code>/g, "pre>");

                getIndicesOf("/tmp/", str, false);


                for(i=0;i<arrIndex.length;i++){
                    str = str.slice(0, arrIndex[i]) + str.slice(arrIndex[i]+15);
                    for(j=i+1;j<arrIndex.length;j++){
                        arrIndex[j]= arrIndex[j] - 15;
                    }

                }
                var output = str;

                $scope.ajaxLoader= '/images/ajaxLater.gif';
                $scope.output= $sce.trustAsHtml("<pre>"+ output +"</pre>");
                
                $scope.racCheck = "RAC Check";


                }).
                error(function(data, status, headers, config) {
                console.log(data);
                });


    };


});

