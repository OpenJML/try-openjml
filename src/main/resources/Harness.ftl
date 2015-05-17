<@verilyLayouts.simple>
    <@verilyUtils.enableAjaxInterface/>

    <script src="/js/angular.min.js"></script>
    <script src="/js/harness.js"></script>
    <script src="/js/markdown.min.js"></script>

    <script type="text/javascript">
    </script>


    <div class="row">
        <div class="span9">

            <div class="page-header">
                <h1>OpenJML Harness Test Page</h1>
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
