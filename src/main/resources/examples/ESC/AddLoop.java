public class AddLoop {
     //@ requires y >= 0;
     //@ ensures \result == x + y;
     public static int Add (int x, int y){
         int sum = x;
         int n = y;
         //@ maintaining sum == x + y - n && 0 <= n;
         //@ decreases n;
         while (n > 0)
         {
           sum = sum + 1;
           n = n - 1;
         }
         return sum;

     }
 }
