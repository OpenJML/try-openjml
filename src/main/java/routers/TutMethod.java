package routers;

import verily.lang.*;

import java.util.HashMap;

public class TutMethod{

     public static final Content view(){
         return new TemplateHTMLContent("TutMethod.ftl", new HashMap());
     }
}
