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

                         <p>A module is a Java class or interface. Java Modeling Language combines the design by contract approach of Eiffel and the model-based specification approach of the Larch family of interface specification languages, with some elements of the refinement calculus.
                         </p>

                         <p>
                          Behaviors of a Java module are specified by adding assertions to Java source code; in particular, one can add preconditions and postconditions to methods and invariants to classes and interfaces. These assertions are added as individual JML comments in your Java file, between /*@  and @*/, or after //@ to the end of a line.
                        </p>

                          <p>Enter your code in the text box, click and run RAC or ESC. For trying the examples given above, copy them into the code runner and click on RAC or ESC to run.</p>

                         <h3 id="chap1">1 : Writing your first pre-condition</h3>
                         <p>
                         Preconditions define a contract between a method and its clients; the client must establish the method’s precondition; conversely, the method’s code may assume its precondition. In the given program "<i>requires</i>" is a precondition which assumes variables PrincipalAmt, NumberOfYears, and RateOfIntr should be greater than zero.
                         </p>

                       <textarea id="simpleIntr" class="codepress java readonly-on" rows="17" cols="80">
//simpleIntr.java
   public class simpleIntr {
   //@ requires PrincipalAmt > 0;
   //@ requires NumberOfYears > 0;
   //@ requires RateOfIntr > 0;
   //@ ensures \result == (PrincipalAmt * NumberOfYears * RateOfIntr)/100;
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

                        <h3 id="chap2">2 : Writing your first post-condition</h3>
                         <p>
                          Postconditions define a contract between a method and its clients; the client may assume its postcondition; conversely, the method’s must ensure it’s post-condition. As shown in the example, <i>ensure</i> verifies if the value returned by the method will be equal to the simple interest formula.
                         </p>
                         <h3 id="chap3">3 : Working of JML annotations</h3>
                         <p>
                          Each character passed as an argument to the function <i>changeCase(char c)</i> is verified by the conditions given in <i>requires</i> clause and the result which is returned is should be acceptable by the <i>ensure</i> conditions mentioned before the function.

                          Go ahead and use the code given below to play around, make some changes and see how it affects the output.
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
                      <h3 id="chap4">4 : Model and Ghost fields</h3>
                         <p>
                          The '<i>Model</i>' modifier introduces a <i>specification-only</i> feature. For fields, it means that a field should only be represented by a concrete field. Ghost and model are mutually exclusive modifiers. Ghost fields will be covered in the later part of this section. There some points to be noted about model fields, are given below,
                         <ul>
                         <li>A model field should not be declared to be final. If at all a final model field is required in the program then one should always use a final ghost field instead.</li>
                         <li>For an interface, a model is always declared to be static.</li>
                         </ul>
                         </p>
                         <p>
                          The '<i>Ghost</i>' modifier introduces a <i>specification-only</i> field that is maintained by particular set statements. Ghost and model are mutually exclusive modifiers.When a ghost field is declared in an interface, it is not final by default. If you want the field to be default it needs to be mentioned explicitly.
                         </p>
                         <h3 id="chap5">5 : Modifiers and Assignable clauses</h3>
                         <p>
                         Modifiers in JML are similar to that in Java; it is just that they are recognized as keywords in annotation comments. The ordering of modifiers goes as follows:
                         </p>
                         <ul>
                         <li>java-annotations</li>
                         <li>public private protected spec_public spec_protected</li>
                         <li>abstract static</li>
                         <li>model ghost pure</li>
                         <li>final</li>
                         <li>synchronized</li>
                         <li>instance</li>
                         <li>transient</li>
                         <li>volatile</li>
                         <li>native strictfp</li>
                         <li>monitored uninitialized</li>
                         <li>helper</li>
                         <li>spec_java_math spec_safe_math spec_bigint_math</li>
                         <li>code_java_math code_safe_math code_bigint_math</li>
                         <li>non_null nullable nullable_by_default</li>
                         <li>code extract</li>
                         <li>peer rep readonly</li>
                         </ul>
                        <p>
                         In the example given below, the specification provided for the variable <i>array</i> in will be satisfied as a postcondition unless the function C is called. Now after function C is called, the postcondition would be satisfied. For conditions as such, assignable clauses like <i>modifies</i> are used.
                         </p>
                        <textarea id="A" class="codepress java readonly-on" rows="15" cols="80">
//A.java
public class A{
     int array[];     
     //ensures array.length >=5;
     public void B(){ 
         array = new int[7]; 
         C();
     }
     //ensures true;
     public void C(){ 
         array = new int[3];
     }
}
                        </textarea>
                        <h3 id="chap6">6 : Invariants</h3>
                        <p>Invariants are the properties that have to operate in all visible states. The understanding of visible states is of utmost importance when dealing with invariants and constraints. A state is <i>visible state</i> to object <i>o</i>, if it develops in the following stages of code's execution:
                        </p>
                        <ul>
                          <li>at the beginning or end of a non-helper finalizer invocation, that is finalizing o,</li>
                          <li>at the start of a non-helper non-static non-finalizer method invocation with o as the receiver.</li>
                          <li>at the end of a non-helper non-static non-finalizer method invocation with o as the receiver</li>
                          <li>at the beginning or end of a non-helper static method invocation for a method in o's class or some superclass of o's class, or</li>
                          <li>when no constructor, destructor, non-static method invocation with o as the receiver,</li>
                          <li>or static method invocation for a method in o's class or some superclass of o's class is in progress.</li>
                        </ul>
                        <p>For example, The invariant in the given example has a <i>default (package)</i> visibility and in each state that is a visible state for an object of type <i>Invariant</i>, the object's field <i>bool</i> is not null and the array it refers to has exactly ten elements. No postcondition is required in this example, as the invariant is an implicit postcondition for the constructor.</p>
                       <textarea id="Invariant" class="codepress java readonly-on" rows="10" cols="80">
//Invariant.java
package org.jmlspecs.samples.jmlrefman; 
public abstract class Invariant {
    boolean[] bool; 
    //@ invariant bool != null && bool.length == 10;
    //@ assignable bool;
    Invariant() {
        bool = new boolean[6];
    }
}
                        </textarea>
                       </tr>

                       <tr>
                         <td> </td>

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


                <textarea id="editor" class="codepress java linenumbers-on" data-ng-model="program" rows="20" cols="68" style="font-family:monospace;"></textarea>



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
       <div id="footer">
                <div class="container">
                    <p class="muted credit">Page rendered by <a href="http://docs.goverily.org/en/latest/">Verily</a> and syntax highlighting libraries by <a href="http://codepress.sourceforge.net/">CodePress</a>.</p>
                </div>
            </div>
</script>

</body>


</html>
