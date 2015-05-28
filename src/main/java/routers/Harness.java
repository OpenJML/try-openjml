package routers;

import verily.lang.*;

import java.util.HashMap;

public class Harness{

     public static final Content view(){
         return new TemplateHTMLContent("Harness.ftl", new HashMap());
     }

	public static final Content tutsOne(){
         return new TemplateHTMLContent("TutMethod.ftl", new HashMap());
     }

    public static final Content tutsTwo(){
        return new TemplateHTMLContent("TutMethodTwo.ftl", new HashMap());
    }

}
