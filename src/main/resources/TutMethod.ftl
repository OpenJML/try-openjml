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


   <script src="/js/angular.min.js"></script>
       <script src="/js/prettify.js"></script>
       <script src="/js/harness.js"></script>
       <script src="/js/bootstrap.min.js"></script>
       <script src="/js/markdown.min.js"></script>
       <script language="javascript" type="text/javascript" src="/edit_area/edit_area_full.js"></script>

    <div ng-app="Harness">

      <div class="row" ng-controller="HarnessCtrl">
                   <div class="span6">
                     <div class="row">
                      <h2>Input Program</h2>
                        
                        
                <textarea name="editor" id="editor" data-ng-model="program" rows="35" cols="148" style="font-family:monospace;"></textarea> 
                      

                     
                        </div>

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



<script>
prettyPrint();
</script>
<script type="text/javascript">
       editAreaLoader.init({
        id : "textarea_1"   // textarea id
        ,syntax: "java"     // syntax to be uses for highgliting
        ,start_highlight: true    // to display with highlight mode on start-up
        ,toolbar: "__tryOpenJML__"  //toolbar display
        ,allow_toggle: false
       });

       </script>
       </body>
       </html>
