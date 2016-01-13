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
        width: 100%;
        margin-left: 0px;
        margin-right: 0px;
        padding-left: 0px;
        padding-right: 0px;
        /* The html and body elements cannot have any padding or margin. */


    }
        }

        /* Wrapper for page content to push down footer */
        #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        width: 1400px;

        }
        #left_col {
               float:left;
               width:55%;
            }
        #right_col {
               float:right;
               width:45%;
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
    <style>
        #editor {
                height: 300px;

            }
    </style>

    <link rel="shortcut icon" href="/ico/favicon.png">

</head>

<body>


<!-- Part 1: Wrap all page content here -->
<div id="wrap">

    <!-- Begin page content -->
    <div class="container">
  <!--  <@verilyUtils.enableAjaxInterface/> -->

       <script src="/js/angular.min.js"></script>
       <script src="/js/prettify.js"></script>
       <script src="/js/harness.js"></script>
       <script src="/js/bootstrap.min.js"></script>
       <script src="/js/markdown.min.js"></script>





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
						<div style="overflow: auto; width: 580px; height: 550px;">
            <table style="width:550px">
                       <tr>
                         <td><h3 id="intro">Introduction</h3></td>

                       </tr>
                       <tr>
                         <td>


                         <p>
                         The <i>Java Modeling Language</i> (JML) is a behavioral interface specification language that can be used to specify the behavior of Java modules. It combines the design by contract approach of Eiffel and the model-based specification approach of the Larch family of interface specification languages, with some elements of the refinement calculus.
                         </p>
                         <p>These behaviors of Java module are specified by adding assertions to Java source code, eg pre conditions, post conditions and invariants. These assertions are added as comments in your Java ﬁle, between <i>/*@ . . . @*/</i>, or after <i>//@</i>.
                         </p>
                         <h3 id="tut1">Tutorial 1: Pre-condition and Post-condition</h3>
                         <p>
                          Pre- and post-conditions deﬁne a contract between a class and its clients; the client must ensure precondition and may assume post-condition and the method may assume precondition and must ensure post-condition.
                         </p>
                         <p>
                          Eg, This example requires x to be greater than zero and ensures the result is approximately equal to square root of x.
                        </p>

<p>
<pre class="prettyprint linenums:1">
public class SqrtExample {
public final static double eps = 0.0001;
//@ requires x >= 0.0;
//@ ensures JMLDouble.approximatelyEqualTo(x, \result *
\result, eps);
public static double sqrt(double x) {
return Math.sqrt(x);
}
}
</pre>
<button name="sample1" id="sample1" class="btn btn-large" type="button" onclick="CopyMe(sample1);">Try it!</button>
</p>
                         <h3 id="tut2">Tutorial 2: Invariants</h3>
                         <p>
                          An invariant is a property that should hold in all client-visible states. It must be true when control is not inside the object's methods. That is, an invariant must hold at the end of each constructor's execution, and at the beginning and end of all methods.
                         </p>
                         <p>
                          Invariants are implicitly included in all pre- and post-conditions and they must also be preserved if exception is thrown.
                         </p>

<p>
<pre class="prettyprint linenums:1">
package org.jmlspecs.samples.jmltutorial;
//@ refine "Person.java";
public class Person {
private /*@ spec_public non_null @*/
String name;
private /*@ spec_public @*/
int weight;
/*@ public invariant !name.equals("") @ && weight >= 0; @*/
//@ also
//@ ensures \result != null;
public String toString();
//@ also
//@ ensures \result == weight;
public /*@ pure @*/ int getWeight();
/*@ also
@ requires kgs >= 0;
@ requires weight + kgs >= 0;
@ ensures weight == \old(weight + kgs);
@*/
public void addKgs(int kgs);
/*@ also
@ requires n != null && !n.equals("");
@ ensures n.equals(name)
@ && weight == 0; @*/
public Person(String n);
}
</pre>
<button name="sample2" id="sample2" class="btn btn-large" type="button" onclick="CopyMe2(sample2);">Try it!</button>
</p>
                        <p>
                          In the above example the name of a person should not be NULL and weight of the person should be non-negative.
                        </p>
                        <h3 id="tut3">Tutorial 3: Runtime Assertion Checking (RAC)</h3>
                         <p>
                          Runtime Assertion Checking translates JML assertions into runtime checks: during execution, all assertions are tested and any violation of an assertion produces an Error.
                         </p>
                         <p>
                          Eg, it will test that if debit throws an exception, the balance hasn't changed, and all invariants still hold.
                         </p>
<p>
<pre class="prettyprint linenums:1">
/*@ ...
signals (Exception)
balance == nold(balance);
@*/
public int debit(int amount) f ... g
</pre>
</p>
                      <h3 id="tut4">Tutorial 4: Extended Static Checking (ESC)</h3>
                         <p>
                          Extended Static Checking tries to prove correctness of speciﬁcations, at compile-time. This approach used in ESC/Java is called extended static checking, which is a collective name referring to a range of techniques for statically checking the correctness of various program constraints
                         </p>
                         <h3>Using TryOpenJML</h3>
                         <p>
                          Enter your code, click and run RAC or ESC. For trying the examples given above, click on <i>'Try it'</i> press Spacebar and click on RAC or ESC to run.
                         </p>
                       </tr>
                       <tr>
                         <td> </td>

                       </tr>
                     </table>

            </div>

<nav>
                              <ul class="pager">
                                <li><a href="#intro">Intro</a></li>
                                <li><a href="#tut1">Tutorial 1</a></li>
                                <li><a href="#tut2">Tutorial 2</a></li>
                                <li><a href="#tut3">Tutorial 3</a></li>
                                <li><a href="#tut4">Tutorial 4</a></li>


                              </ul>
                              <p><h4>For those who don't need a tutorial</h4></p>
                              <ul class="pager">
                                <li><a href="/TutMethod.ftl">Fullscreen Editor</a></li>



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


                <textarea name="editor" id="editor" data-ng-model="program" rows="20" cols="70" style="font-family:monospace;"></textarea>



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

 <script src="//code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
<script type="text/javascript">
function CopyMe() {

  var button = document.getElementById(sample1);

  var xmlhttp;
  if (window.XMLHttpRequest)
  {
    // code for IE7+, Firefox, Chrome, Opera, Safari
     xmlhttp = new XMLHttpRequest();
  }
  else
  {
    // code for IE6, IE5
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  if (xmlhttp != null)
  {

    xmlhttp.open("GET","/codes/sample1.txt",false); // the false makes this synchronous!
    xmlhttp.send();
    var text = xmlhttp.responseText;

    document.getElementById('editor').value = text;
    document.getElementById('editor').focus();

  }
}

function CopyMe2() {

  var button = document.getElementById(sample1);

  var xmlhttp;
  if (window.XMLHttpRequest)
  {
    // code for IE7+, Firefox, Chrome, Opera, Safari
     xmlhttp = new XMLHttpRequest();
  }
  else
  {
    // code for IE6, IE5
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  if (xmlhttp != null)
  {

    xmlhttp.open("GET","/codes/sample2.txt",false); // the false makes this synchronous!
    xmlhttp.send();
    var text = xmlhttp.responseText;

    document.getElementById('editor').value = text;
    document.getElementById('editor').focus();

  }
}


</script>

</body>


</html>
