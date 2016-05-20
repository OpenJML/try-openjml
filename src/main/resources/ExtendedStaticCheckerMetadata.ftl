{"Name":"OpenJMLESC","DisplayName":"OpenJML (ESC)","Version":"1.0","Email":"jls@cs.ucf.edu","SupportEmail":"jls@cs.ucf.edu","TermsOfUseUrl":"http://www.openjml.org","PrivacyUrl":"http://www.openjml.org","Institution":"OpenJML","InstitutionUrl":"http://www.openjml.org","InstitutionImageUrl":"http://openjml.cs.ucf.edu/images/jml-logo-small.png","MimeType":"text/plain","SupportsLanguageSyntax":true,"Title":"A JML program verification tool (Extended Static Checking)","Description":"OpenJML is a program verification tool for Java programs that allows you to check the specifications of programs annotated in the Java Modeling Language.","Question":"Does this program do what it is supposed to do?","Url":"http://www.openjml.org","DisableErrorTable":false,"Samples":[{"Name":"AddLoop","Source":"public class AddLoop{\n     //@ requires y >= 0;\n     //@ ensures \\result == x + y;\n     public static int Add (int x, int y){\n         int sum = x;\n         int n = y;\n         //@ maintaining sum == x + y - n && 0 <= n;\n         //@ decreases n;\n         while (n > 0)\n         {\n           sum = sum + 1;\n           n = n - 1;\n         }\n         return sum;\n\n     }\n\n    public static void main(String args[]){\n         System.out.println(Add(2,3));\n     }\n }\n"}]}
