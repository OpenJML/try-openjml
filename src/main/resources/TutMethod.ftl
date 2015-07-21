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
                         <h1><img src="/images/JmlLogo.jpg" alt="Logo" class="row" height="80" width="80" />  Try OpenJML</h1>
                     </div>


                </div>
           </div>


    <div ng-app="Harness">

        <div id="left_col">

                 <div class="row">
                     <div class="span5">

                     <table style="width:550px">
                       <tr>
                         <td><h2>Tutorials 1: Type-checking</h2></td>

                       </tr>
                       <tr>
                         <td>


                         <p>
                         The OpenJML tool operates like a Java compiler, on a set of files.  For example, the command
                         </p>
<p>
<pre class="prettyprint linenums:1">
//
// This program contains two errors. Can you find them?
//
public class MaybeAdd {
     //@ requires a > 0;
     //@ requires b > 0;
     //@ ensures \result == a+b;
     public static int add(int a, int b){
         return a-b;
     }


    public static void main(String args[]){
         System.out.println(add(2,3));
     }
 }
</pre>
</p>
                         <p>
                         will type-check the Java and JML in the A.java file and any classes on which it depends.
                         Include the full absolute or relative path to the openjml.jar file as needed.
                         (The <code>-noPurityCheck</code> option suppresses many warnings about the use of non-pure functions, since the JDK libraries are not yet populated with appropriate pure annotations.)
                         </p><p>
                         For example, put the following text in a file named <code>A.java</code> and execute the command above.
                         </p>
<pre class="prettyprint linenums:1">
public class A {

//@ ensures \result == true;
public void m() {}

}</pre>

                         <p>
                         The following output is obtained:
                         </p>
<pre class="prettyprint linenums:1">
A.java:3: A \result expression may not be used in the specification of
 a method that returns void

//@ ensures \result == true;
                    ^
                 1 error
</pre>




                         </td>

                       </tr>
                       <tr>
                         <td>  <h2></h2> </td>

                       </tr>
                     </table>
                            <nav>
                              <ul class="pager">
                                <li><a href="view">Intro</a></li>
                                <li><a href="tutsOne">Tutorial 1</a></li>
                                <li><a href="tutsTwo">Tutorial 2</a></li>

                              </ul>
                            </nav>
                     </div>
                </div>

        </div>







       <div id="right_col">

              <div class="row" ng-controller="HarnessCtrl">
                   <div class="span6">
                     <div class="row">
       		            <h2>Input Program</h2>
                         <textarea id="textarea_1" data-ng-model="program" class="input-block-level" rows="20" cols="87">
                         </textarea>
                     </div>

       		          <div class="row" >
       		            <h2>Verification Output</h2>

       		            <div class="well" data-ng-bind-html="output">

       		          </div>
       		    </div>

               <div class="row" align="right">
               		  <p>
                   <button class="btn btn-large btn-primary" data-ng-click="rac()" type="button">{{racCheck}}</button>
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
