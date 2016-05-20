public class ChangeCaseExample {

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
}