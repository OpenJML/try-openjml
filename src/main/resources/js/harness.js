var app = angular.module('Harness', []);

app.controller('HarnessCtrl', function ($scope, $sce, $timeout) {

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


	$timeout(
	    function(){

		var responseRaw = ExtendedStaticChecker.run($scope.program).response;
		var response    = JSON.parse(responseRaw);
		$scope.response = JSON.stringify(response, null, '\t');

		$scope.escCheck = tmp;


		// find the markdown result
		var markdownContent = response.Outputs.filter(function(o){ return o.MimeType==="text/x-web-markdown";})[0].Value;
		$scope.output = $sce.trustAsHtml(markdown.toHTML(markdownContent).replace(/code>/g, "pre>"));
		
	    }, 1000);
    };


    $scope.rac = function(){

	var tmp = $scope.racCheck;
	$scope.racCheck = "Checking... Please wait.";


	$timeout( 
	    function(){

		var responseRaw = RuntimeAssertionChecker.run($scope.program).response;
		var response    = JSON.parse(responseRaw);
		$scope.response = JSON.stringify(response, null, '\t');

		$scope.racCheck = tmp;

		
		// find the markdown result
		var markdownContent = response.Outputs.filter(function(o){ return o.MimeType==="text/x-web-markdown";})[0].Value;
		$scope.output = $sce.trustAsHtml(markdown.toHTML(markdownContent).replace(/code>/g, "pre>"));
		
		
	    }, 1000);
    };



});
