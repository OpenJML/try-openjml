public class SqrtExample {
      public final static double eps = 0.0001;
      //@ requires x >= 0;
      //@ ensures (\result > eps && \result < x);

      public static double MYsqrt(double x) {
        return Math.sqrt(x);
      }
      
      public static void main(String args[]){
         System.out.println("The Square root is ...");
         System.out.println(MYsqrt(4.25221111111));
     }
}