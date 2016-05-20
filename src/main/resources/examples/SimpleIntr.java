public class SimpleIntr {
     //@ requires PrincipalAmt > 0;
     //@ requires NumberOfYears > 0;
     //@ requires RateOfIntr > 0;
     //@ ensures \result == (PrincipalAmt * NumberOfYears * RateOfIntr)/100;
     public static double Calc(double PrincipalAmt, double NumberOfYears, double RateOfIntr){
         return (PrincipalAmt * NumberOfYears * RateOfIntr)/100;
     }
     public static void main(String args[]){
         System.out.println("Installment in Rs. will be...");
         System.out.println(Calc(1800000.00,3.50,12.75));
        
     }
 }