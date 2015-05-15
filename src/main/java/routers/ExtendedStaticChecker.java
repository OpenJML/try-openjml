package routers;

import runners.CheckerResult;
import runners.ESCRunner;
import verily.lang.*;

import java.util.HashMap;

public class ExtendedStaticChecker{

     public static final Content run(String Source, CheckerResult result){

         Content response = new JSONContent();

         response.setContent(ESCRunner.checkerResultToRise4RunFormat(result));

         return response;
     }

    public static final Content metadata(){
        Content response = new JSONContent();
        response.setContent(new TemplateHTMLContent("ExtendedStaticCheckerMetadata.ftl", new HashMap()).getContent());

        return response;
    }

    public static final Content language(){
        Content response = new JSONContent();
        response.setContent(new TemplateHTMLContent("Language.ftl", new HashMap()).getContent());

        return response;
    }
}
