package routers;

import verily.lang.*;

import java.util.HashMap;

public class Harness{

     public static final Content view(){
         return new TemplateHTMLContent("Harness.ftl", new HashMap());
     }
}
