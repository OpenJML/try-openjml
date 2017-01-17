package runners;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import util.Constants;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ESCRunner extends Runner {


    public ESCRunner(String source) {
        super(source);
    }

    public String[] getArgs(String fileName, String filePath){

        List<String> args = new ArrayList<String>();

        args.add("sh");
        args.add("-c");

        //
        // use this to toggle between docker and docker mode
        //
        //args.add(String.format("cat %s | python tools/tool_runner.py --timeout 20 -esc %s", filePath.replaceAll("\\\\", "/"), fileName + ".java"));
        args.add(String.format("cat %s | docker run -i openjml/try:v1 python /tools/tool_runner.py --docker --timeout 20 -esc %s", filePath.replaceAll("\\\\", "/"), fileName + ".java"));

        String[] ar = new String[args.size()];
        return args.toArray(ar);

    }

    public static String checkerResultToRise4RunFormat(CheckerResult result){

        JSONObject o = (JSONObject) JSONValue.parse(result.toJSON());

        // rule 1
        JSONObject response = new JSONObject();

        response.put("Version", Constants.version);


        JSONArray responses = new JSONArray();



        if(result.getStatus()) {

            response.put("stdout", o.get("stdout"));
            response.put("returnCode", o.get("returnCode"));
            response.put("fullOutput", o.get("fullOutput"));
            response.put("timeout", o.get("timeout"));


            // we coulnd't finish in time
            if(((Boolean)o.get("timeout"))){
                JSONObject plain = new JSONObject();
//                JSONObject md    = new JSONObject();

                plain.put("MimeType", "text/plain");
                plain.put("Value", "OpenJML could not verify your program before the timeout elapsed. Please try again (or write a smaller program)." + Constants.VERILY_TAGLINE_TXT);

//                md.put("MimeType", "text/x-web-markdown");
//                md.put("Value", "**OpenJML could not verify your program before the timeout elapsed. Please try again (or write a smaller program).**" + Constants.VERILY_TAGLINE_MD);


                responses.add(plain);
//                responses.add(md);

                response.put("Outputs", responses);

            }
            // BEST case scenario. Return code is zero and there is no output
            else if(((Long)o.get("returnCode"))==0 && ((String)o.get("stdout")).length()==0){

                JSONObject plain = new JSONObject();
                //JSONObject md    = new JSONObject();

                plain.put("MimeType", "text/plain");
                plain.put("Value", "Your program appears to satisfy its specifications!" + Constants.VERILY_TAGLINE_TXT);

//                md.put("MimeType", "text/x-web-markdown");
//                md.put("Value", "**Your program appears to satisfy its specifications!**" + Constants.VERILY_TAGLINE_MD);

                responses.add(plain);
//                responses.add(md);

                response.put("Outputs", responses);
            }

            // next case, return code is zero, but there is output
            else {
                JSONObject plain = new JSONObject();
//                JSONObject md    = new JSONObject();

                plain.put("MimeType", "text/plain");
                plain.put("Value", o.get("stdout") + Constants.VERILY_TAGLINE_TXT);

//                md.put("MimeType", "text/x-web-markdown");
//                md.put("Value", "<pre>" + o.get("stdout") + "</pre>" + Constants.VERILY_TAGLINE_MD);

                responses.add(plain);
//                responses.add(md);

                response.put("Outputs", responses);


            }


        }else{


            o.put("Version", Constants.version);
            JSONObject plain = new JSONObject();
//            JSONObject md    = new JSONObject();

            plain.put("MimeType", "text/plain");
            plain.put("Value", "An error occurred while trying to verify your program (or there's a bug in OpenJML). Please send the program you were trying to verify to jls@cs.ucf.edu." + Constants.VERILY_TAGLINE_TXT);

//            md.put("MimeType", "text/x-web-markdown");
//            md.put("Value", "**An error occurred while trying to verify your program (or there's a bug in OpenJML). Please send the program you were trying to verify to jls@cs.ucf.edu.**" + Constants.VERILY_TAGLINE_MD);


            responses.add(plain);
//            responses.add(md);

            o.put("Outputs", responses);


            return o.toJSONString();
        }

        return response.toJSONString();
    }
}
