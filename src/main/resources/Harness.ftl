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
       
       <script src="/js/harness.js"></script>
       <script src="/js/bootstrap.min.js"></script>
       <script src="/js/markdown.min.js"></script>
       <script src="/codepress/codepress.js" type="text/javascript"></script>
       




           <div class="row">
                 <div class="span6">

                     <div class="page-header">
                         <h1><img src="/images/JmlLogo.jpg" alt="Logo" class="row" height="80" width="80">  TryOpenJML</h1>

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
                         <td><h3 id="chap0">Overview</h3></td>

                       </tr>
                       <tr>
                         <td>
                         <p>The <i>Java Modeling Language (JML)</i> is a behavioral interface specification language which is used to specify the behavior of Java modules. Behavioral interface specification languages give code-level annotations such as pre-/post-conditions, invariants, and assertions to a program that allows the programmer to express various behaviors for program modules.</p>

                         <p>A <i>module</i> is a Java class or interface. Java Modeling Language combines the design by contract approach of Eiffel and the model-based specification approach of the Larch family of interface specification languages, with some elements of the refinement calculus.
                         </p>
                         <h3 id="chap1">1 : Assertions</h3>
                         <p>
                          Behaviors of a Java module are specified by adding assertions to Java source code; in particular, one can add preconditions and postconditions to methods and invariants to classes and interfaces. These assertions are added as individual JML comments in your Java file, between /*@  and @*/, or after //@ to the end of a line. <i><u>Note</u> that there cannot be any white-space between the start of the Java comment and the first at-sign (@), as /* @ or // @ is a Java comment that is not processed by JML.</i>
                        </p>

                        <h3 id="chap2">2 : Using TryOpenJML</h3>
                          <p>Enter your code in the text box, click and run RAC or ESC. For trying the examples given above, copy them into the code runner and click on RAC Check or ESC Check to run.</p>

                         <h3 id="chap3">3 : Writing your first pre-condition</h3>
                         <p>
                         Preconditions define assumptions a method may have about the state in which it is called; the client must establish the method’s precondition; conversely, the method’s code may assume its precondition. In the given program "<i>requires</i>" preceeds each precondition; the preconditions assume that variables PrincipalAmt, NumberOfYears, and RateOfIntr are all greater than zero.
                         </p>

                       <textarea id="simpleIntr" class="codepress java readonly-on" rows="17" cols="80">
//simpleIntr.java
     public class simpleIntr {
     //@ requires PrincipalAmt > 0;
     //@ requires NumberOfYears > 0;
     //@ requires 0 < RateOfIntr < 1;
     //@ ensures \result = (PrincipalAmt * NumberOfYears * RateOfIntr)/100;
     public static double Calc
     (double PrincipalAmt, double NumberOfYears, double RateOfIntr)
     {
     return (PrincipalAmt * NumberOfYears * RateOfIntr)/100;
     }
     public static void main(String args[]){
         System.out.println("Installment will be...");
         System.out.println(Calc(1800000.00,3.50,12.75));
     }
 }
                       </textarea>

                        <h3 id="chap4">4 : Writing your first post-condition</h3>
                         <p>
                          Postconditions define guarantees a method gives to its clients; the client may assume its postcondition; conversely, the method must guarantee its post-condition in all possible executions. As shown in the example, <i>ensure</i> verifies if the value returned by the method will be equal to the simple interest formula.
                         </p>
                         <h3 id="chap5">5 : Working of JML annotations</h3>
                         <p>
                          Each character passed as an argument to the function <i>changeCase(char c)</i> below is checked to satisfy the conditions given in the <i>requires</i> clause and the result which is returned is should be acceptable by the <i>ensure</i> conditions mentioned before the function. The keyword <i>also</i> signifies that a specification following the keyword is in addition to the specification prior to it.

                          
                         </p>
<textarea id="changeCase" class="codepress java readonly-on" rows="30" cols="80">
//changeCaseExample.java
public class changeCaseExample {

      //@ requires c >= 'A' && c <= 'Z';
      //@ ensures \result >= 'a' && \result <= 'z';
      //@ also
      //@ requires c >= 'a' && c <= 'z';
      //@ ensures \result >= 'A' && \result <= 'Z'; 
      //@ also
      //@ requires !( c >= 'A' && c <= 'Z') && !( c >= 'a' && c <= 'z');
      //@ ensures \result == c;

    public static char caseChange(char c) {
        char result = ' ';
        if( c > 'z'){
          result = c;
    } else if (c > 'z') {
      result = (char)(c - 'a' + 'A');
    } else if (c >= 'Z') {
      result = 'c';
    } else if(c >= 'A') {
      result = (char)(c - 'A' + 'a');
    } else {
      result = c;
    }
    return result;
    }

    public static void main(String args[]){
         System.out.println("Result is...");
         System.out.println(caseChange('J'));
         System.out.println(caseChange('M'));
         System.out.println(caseChange('L'));
        
     }
</textarea>
                      <h3 id="chap6">6 : Model and Ghost fields</h3>
                      <p>
                          The <i>model</i> modifier has two meanings. The first significance of a feature declared with the <i>model</i> is that it is present for specification purposes only. For example, a <i>model</i> field is only used for JML specifications and cannot be utilized in the Java code present outside the specifications. In a similar manner, a method with the <i>model</i> modifier is a method which is utilized only in annotations and not in Java code. The other significance of <i>model</i> depends on the type of feature that is being declared.
                          </p>
                          <textarea id="Model" class="codepress java readonly-on" rows="7" cols="80">
//Model.java

//@ public model float b;

//@ public model boolean empty;
protected int size = 0; //@ in empty;
//@ protected represents empty = (size == 0);
                          </textarea>
                         <p>
                          The '<i>Model</i>' modifier introduces a <i>specification-only</i> feature.For fields, it means that the field is only visible on the level of specification. In the above example, the <i>represents</i> clause defines, how the value of a model field is related to the implementation. The ghost and model modifiers are mutually exclusive . Ghost fields will be covered in the later part of this section. There are some points to be noted about model fields, which are given below,
                         <ul>
                         <li>A model field should not be declared to be final. If you think that a final model field is required in the program, then you should instead use a final ghost field instead.</li>
                         <li>For an interface, a model field is static by default. Use 'instance' to declare a non-static field in an interface.</li>
                         </ul>
                         </p>
                          <p>
                          Similar to a model field, a ghost field cannot be used in the Java code that is outside of JML specifications. Unlike a model field, the value of a ghost field is determined by its initialization or the value given to it in the most recent set-statement. The 'ghost' modifier introduces a <i>specification-only</i> field that is maintained by particular set statements.</p>
                          <textarea id="Ghost" class="codepress java readonly-on" rows="10" cols="80">
//Ghost.java
/* By initialization*/
//@ ghost int i = 0;
//@ ghost int zero = 0, j, k = i+3;

/* By set-statement*/
//@ ghost boolean empty = true;
//@ set empty = (size == 0);
                          </textarea>

                          <p>In the example given below, the specification provided for the variable \textit{array} will not be satisfied as a postcondition unless the function C is called. Now after function C is called, the postcondition would be satisfied. In this case, <i>assignable</i> clause is used.</p>

                          <p>Go ahead and use the code given and try to make it work. <i>Hint: psvm(String args[])</i></p>

                          <textarea id="Arrays" class="codepress java readonly-on" rows="15" cols="80">
//Arrays.java
public class Arrays{
     int array[];     
     //@ ensures array.length >=5;
     //@ assignable array[];
     public void B(){ 
         array = new int[7]; 
         C();
     }
     //@ ensures true;
     public void C(){ 
         array = new int[3];
     }
     
}
                          </textarea>
                          
                        <h3 id="chap7">7 : Invariants</h3>

                        <p>Invariants are the properties that must hold  in all visible states. The understanding of visible states is important when dealing with invariants and constraints. A state is <i>visible state</i> for an object <i>o</i>, if it occurs in one of the following stages of code's execution:
                        </p>
                        <ul>
                        <li> at the start of a non-helper non-static non-finalizer method invocation with <i>o</i> as the receiver.</li>
                        <li> at the end of a non-helper non-static non-finalizer method invocation with <i>o</i> as the receiver,</li>
                        <li> at the beginning or end of a non-helper static method invocation for a method in <i>o</i>'s class or some superclass of <i>o</i>'s class, or</li>
                        <li> at the end of a non-helper constructor invocation that intializes <i>o</i></li>
                        <li> when no constructor, destructor, non-static method invocation with <i>o</i> as the receiver, or static method invocation for a method in <i>o</i>'s class or some superclass of <i>o</i>'s class is in progress,</li>
                        <li> at the beginning of a non-helper finalizer invocation, that is finalizing <i>o</i>.</li>
                       

                        <p>
                          For example, the invariant in the example below has a <i>default (package)</i> visibility and in each state that is a visible state for an object of type <i>Invariant</i>, the object's field <i>bool</i> is not null and the array it refers to has exactly ten elements. No postcondition is required in this example, as the invariant is an implicit postcondition for the constructor.
                        </p>
                       <textarea id="Invariant" class="codepress java readonly-on" rows="10" cols="80">
//Invariant.java
package org.jmlspecs.samples.jmlrefman; 
public abstract class Invariant {
    boolean[] bool; 
    //@ invariant bool != null && bool.length == 10;
    
    //@ assignable bool;
    Invariant() {
        bool = new boolean[10];
    }
}
                        </textarea>


                       </tr>

                       <tr>
                         <td><p><h5>For more information on any particular topic check <a href="http://www.eecs.ucf.edu/~leavens/JML/jmlrefman/jmlrefman_toc.html" target='_blank'>JML reference manual</a>.</h5></p></td>

                       </tr>
                     </table>

            </div>

<nav>
                              <ul class="pager">

                                <li><a href="#chap0">Overview</a></li>
                                <li><a href="#chap1"> 1 </a></li>
                                <li><a href="#chap2"> 2 </a></li>
                                <li><a href="#chap3"> 3 </a></li>
                                <li><a href="#chap4"> 4 </a></li>
                                <li><a href="#chap5"> 5 </a></li>
                                <li><a href="#chap6"> 6 </a></li>
                                <li><a href="#chap7"> 7 </a></li>
                                <li><a href="#chap0">Top</a></li>
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

<!--class="codepress java linenumbers-on" -->
                <textarea id="editor" data-ng-model="program" rows="20" cols="68" style="font-family:monospace;"></textarea>



                        </div>

                     </div>

       		          <div class="row" >
       		            <h2>Verification Output</h2>
                      
                      
       		            <div class="well">   

                        <div align="center"><img ng-src="{{ajaxLoader}}"/></div>
                        <div data-ng-bind-html="output"> </div>
                      </div>
                      
                     
       		    </div>

               <div>
                
               		 <a class="btn btn-large btn-primary" href="/TutMethod.ftl" >Fullscreen Editor</a>

               <div class="btn-group pull-right">
                   <button class="btn btn-large btn-primary" data-ng-click="rac();" type="button" >{{racCheck}}</button>
                   <button class="btn btn-large" type="button" data-ng-click="esc();">{{escCheck}}</button>
               	</div>	 
                
               </div>


              </div>
           </div>

        </div>

       </div>
           </div>

           <div id="push"></div>
       </div>
       <div align="center" >
       <p><h4>Help us improve TryOpenJML tutorial by filling the survey <a href="http://goo.gl/forms/zk3f4vIDCUvuTV1s1" target='_blank'>here</a>.</h4></p>
       </div>
       <div id="footer">
                <div class="container">
                    <p class="muted credit">Page rendered by <a href="http://docs.goverily.org/en/latest/">Verily</a> and syntax highlighting libraries by <a href="http://codepress.sourceforge.net/">CodePress</a>.</p>
                </div>
            </div>
</script>

</body>


</html>
