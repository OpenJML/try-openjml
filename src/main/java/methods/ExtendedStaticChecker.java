package methods;

import lang.InvalidClassfileException;
import runners.CheckerResult;
import runners.ESCRunner;
import verily.lang.*;

import java.io.IOException;

public class ExtendedStaticChecker{

     public static final CheckerResult run(String Source){

         ESCRunner runner = new ESCRunner(Source);

         try {
             return runner.run();
         } catch (IOException | InterruptedException | InvalidClassfileException e) {
             return new CheckerResult(e.getMessage(), false);
         }
     }

    public static final void metadata(){}
    public static final void language(){}
}
