{
  "Name": "OpenJML (RAC)",
  "DisplayName": "OpenJML (RAC)",
  "Version": "1.0",
  "Email": "jls@cs.ucf.edu",
  "SupportEmail": "jls@cs.ucf.edu",
  "TermsOfUseUrl": "http://try.openjml.org",
  "PrivacyUrl": "http://try.openjml.org",
  "Institution": "OpenJML",
  "InstitutionUrl": "http://try.openjml.org",
  "InstitutionImageUrl": "http://rise4fun.com/images/logo_msr_small.png",
  "MimeType": "text/plain",
  "SupportsLanguageSyntax": true,
  "Title": "A JML program verification tool (Runtime Assertion Checking)",
  "Description": "An example of remote tool that simplies returns the original text.",
  "Question": "Where are you, echo?",
  "Url": "http://try.openjml.org",
  "VideoUrl": "http://try.openjml.org",
  "DisableErrorTable": false,
  "Samples": [{
      "Name": "SquareRoot",
      "Source": "public class SqrtExample {
      public final static double eps = 0.0001;
      //@ requires x >= 0.0;
      //@ ensures approximatelyEqualTo(x, \result * \result, eps);
      public static double sqrt(double x) {
        return Math.sqrt(x);
      }
    }
    "
  },
  {
    "Name": "PersonJava",
    "Source": "package org.jmlspecs.samples.jmltutorial;
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
    "
  },
        {
    "Name": "CaseChange",
    "Source": "//package openjml3.demo;
    public class CaseChangeExample {

      //@   requires c >= ‘A’ && c <= ‘Z’;
      //@   ensures \result >= ‘a’ && \result <= ‘z’;
      //@ also
      //@ requires c >= ‘a’ && c <= ‘z’;
      //@ ensures \result >= ‘A’ && \result <= ‘Z’; 
      //@ also
      //@ requires !( c >= ‘A’ && c <= ‘Z’) && !( c >= ‘a’ && c <= ‘z’);
      //@ ensures \result == c;

    public char caseChange(char c) {
        char result = ‘ ’;
        if( c > ‘z’){
          result = c;
    } else if (c > ‘z’) {
      result = (char)(c – ‘a’ + ‘A’);
    } else if (c >= ‘Z’) {
      result = ‘c’;
    } else if(c >= ‘A’) {
      result = (char)(c – ‘A’ + ‘a’);
    } else {
      result = c;
    }
    return result;
    }
    }

    "
  }
],
"Tutorials": [{
  "Name": "guide",
  "Source": "# This is the markdown syntax test.\r\n\r\nA paragraph...\r\n\r\n    first\r\n\r\nThe tutorial also supports TeX maths through mathjax: \r\n\\[\\begin{aligned} \\dot{x} & = \\sigma(y-x) \\\\ \\dot{y} & = \\rho x - y - xz \\\\ \\dot{z} & = -\\beta z + xy \\end{aligned} \\]\r\n",
  "Samples": [{
    "Name": "first",
    "Source": "hello you"
  }]
}]
}