<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/prettify.css" rel="stylesheet">
    <style type="text/css">

        /* Sticky footer styles
        -------------------------------------------------- */

        html,
        body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
        }

        /* Wrapper for page content to push down footer */
        #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        width: 100%;
        margin: 0 auto;
        }
        #left_col {
               float:left;
               width:50%;
            }
        #right_col {
               float:right;
               width:50%;
        }
        /* Set the fixed height of the footer here */
        #push,
        #footer {
        height: 60px;
        }
        #footer {
        background-color: #f5f5f5;
        }
        #code{
        font-family:     "Courier New"
                            Courier
                            monospace;
        }
        }
        /* Lastly, apply responsive CSS fixes as necessary */
        @media (max-width: 1000px) {
        #footer {
        margin-left: -20px;
        margin-right: -20px;
        padding-left: 20px;
        padding-right: 20px;
        }



        /* Custom page CSS
        -------------------------------------------------- */
        /* Not required for template or sticky footer method. */

        .container {
        width: auto;
        max-width: 1200px;
        }
        .container .credit {
        margin: 20px 0;
        }
        }
    </style>

    <link rel="shortcut icon" href="/ico/favicon.png">
</head>

<body>


<!-- Part 1: Wrap all page content here -->
<div id="wrap">

    <!-- Begin page content -->
    <div class="container">
    <@verilyUtils.enableAjaxInterface/>

       <script src="/js/angular.min.js"></script>
       <script src="/js/prettify.js"></script>
       <script src="/js/harness.js"></script>
       <script src="/js/bootstrap.min.js"></script>
       <script src="/js/markdown.min.js"></script>
       <script language="javascript" type="text/javascript" src="/edit_area/edit_area_full.js"></script>


           <div class="row">
                 <div class="span6">

                     <div class="page-header">
                         <h1><img src="/images/JmlLogo.jpg" alt="Logo" class="row" height="80" width="80">  Try OpenJML</h1>
                     </div>


                </div>
           </div>


    <div ng-app="Harness">
		<div id="left_col">

                 <div class="row">
                     <div class="span5">
						<iframe src="/TutMethodTwo.ftl" width="550" height="700" frameborder="0">
						<p>Your browser does not support iframes.</p>
						</iframe>

                     </div>
                </div>

        </div>
       <div id="right_col">

              <div class="row" ng-controller="HarnessCtrl">
                   <div class="span6">
                     <div class="row">
       		            <h2>Input Program</h2>
                         <textarea id="textarea_1" data-ng-model="program" class="input-block-level" rows="20"
                         cols="87"></textarea>
                    <form>
                    First name:<br>
                    <input type="text" value="{{program|json}}">
                    <br>
                    </form>
                         <p ></p>
                     </div>

       		          <div class="row" >
       		            <h2>Verification Output</h2>

       		            <div class="well" data-ng-bind-html="output">

       		          </div>
       		    </div>

               <div class="row" align="right">
               		  <p>
                   <button class="btn btn-large btn-primary" data-ng-click="rac();" type="button">{{racCheck}}</button>
                   <button class="btn btn-large" type="button" data-ng-click="esc();">{{escCheck}}</button>
               		  </p>
               </div>


              </div>
           </div>

        </div>

       </div>
           </div>

           <div id="push"></div>
       </div>
       <div id="footer">
                <div class="container">
                    <p class="muted credit">Page rendered by <a href="">Verily</a>.</p>
                </div>
            </div>


<script>
prettyPrint();
</script>
<script type="text/javascript">
       editAreaLoader.init({
       	id : "textarea_1"		// textarea id
       	,syntax: "java"			// syntax to be uses for highgliting
       	,start_highlight: true		// to display with highlight mode on start-up
       	,toolbar: "__tryOpenJML__"  //toolbar display
       	,allow_toggle: false
       });

       </script>
       </body>
       </html>

