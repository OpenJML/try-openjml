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
       <script src="/js/harness.js"></script>
       <script src="/js/bootstrap.min.js"></script>
       <script src="/js/markdown.min.js"></script>
       <script type="text/javascript"></script>

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
                         <td><h2>About OpenJML</h2></td>

                       </tr>
                       <tr>
                        <td>


                        <p>
                        To perform static checking of the JML specifications you will need an SMT solver
                        to determine logical satisfiability. See the installation instructions and the list
                        of provers above and select one or more to install on your system.
                        </p>
                        <p>
                        To run the static checker, use a command-line like the following, substituting
                        the path to the (in this case Z3) executable in your system. If you are using
                        yices, substitute "yices2" for "z3_4_3".
                        </p>
                        <div style="background-color:lightblue">
                       <code>

                        java -jar <i>$INSTALL</i>/openjml.jar -esc -prover z3_4_3 -exec <em>path-to-executable</em> -no-purityCheck B.java

                        </code>
                        </div>
                        <p>
                        For example, place the following text in the file <code>B.java</code> and execute the command above.
                        </p>
                        <div style="background-color:lightblue">
                         <code>
                        public class B {

                          static int j,k;

                          //@ requires i >= 0;
                          //@ modifies j;
                          //@ ensures j == i;
                          public static void setj(int i) {
                            k = i;
                          }

                          //@ ensures j == 1;
                          public static void main(String[] args) {
                            setj(3);
                          }

                        }
                        </code>
                        </div>


                        <p>
                        The following output is produced:
                        </p>
                        <div style="background-color:lightblue">
                         <code>
                        B.java:9: warning: The prover cannot establish an assertion (Assignable) in method setj
                            k = i;
                              ^
                        B.java:6: warning: Associated declaration
                          //@ modifies j;
                              ^
                        B.java:13: warning: The prover cannot establish an assertion (Postcondition) in method main
                          public static void main(String[] args) {
                                             ^
                        B.java:12: warning: Associated declaration
                          //@ ensures j == 1;
                              ^
                        4 warnings
                        </code>
                        </div>
                        <ul>
                        <li>The first two messages point out that the specification of the method <code>setj</code> states that the field <code>j</code> (and nothing else) is modified by the method, but the method actually modifies <code>k</code>.
                        </li>
                        <li>The second pair of messages points out that the call of <code>setj</code> in method <code>main</code> does not satisfy the postcondition; the "Associated declaration" warning that follows indicates the violated postcondition.
                        </li>
                        </ul>

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
                         <textarea data-ng-model="program" class="input-block-level" rows="20" cols="75" style="font-family:Consolas,Monaco,Lucida Console,Liberation Mono,DejaVu Sans Mono,Bitstream Vera Sans Mono,Courier New, monospace;">
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




       </body>
       </html>
