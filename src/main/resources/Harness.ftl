<@verilyLayouts.simple>
    <@verilyUtils.enableAjaxInterface/>

    <script src="/js/angular.min.js"></script>
    <script src="/js/harness.js"></script>
    <script src="/js/markdown.min.js"></script>

    <script type="text/javascript">
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
	    }


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
	    }



        });
    </script>


    <div class="row">
        <div class="span9">

            <div class="page-header">
                <h1>Try OpenJML Harness Test</h1>
            </div>

        </div>
    </div>

    <div ng-app="Harness">
        <div class="row" ng-controller="HarnessCtrl">
            <div class="span9">
              <div class="row">
		<h2>Input Program</h2>
                  <textarea data-ng-model="program" class="input-block-level" rows="20" style="font-family:Consolas,Monaco,Lucida Console,Liberation Mono,DejaVu Sans Mono,Bitstream Vera Sans Mono,Courier New, monospace;">
                  </textarea>

                </div>

		<div class="row" align="right">
		  <p>
    <button class="btn btn-large btn-primary" data-ng-click="rac()" type="button">{{racCheck}}</button>
    <button class="btn btn-large" type="button" data-ng-click="esc();">{{escCheck}}</button>
		  </p>
		</div>

		<div class="row">
		  <h2>Verification Output</h2>
		  <div class="well" data-ng-bind-html="output">

		  </div>
		</div>

		<div class="row">
		  <h2>Raw Output (for debugging only)</h2>
		  <div class="well">
		    <pre data-ng-bind="response"></pre>
		  </div>
		</div>
            </div>
        </div>
    </div>

</@verilyLayouts.simple>
