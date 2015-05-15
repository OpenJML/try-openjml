package runners;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

/**
 * Created by jls on 5/13/2015.
 */
public class CheckerResult {

    private String  output;
    private boolean status;

    public CheckerResult(String output, boolean status){
        this.output = output;
        this.status = status;
    }

    public String getOutput(){
        return output;
    }

    public boolean getStatus(){
        return status;
    }

    public String toJSON() {

        if (getStatus() == false) {

            JSONObject invalid = new JSONObject();

            invalid.put("returnCode", -2600);
            invalid.put("reason", output);
            invalid.put("description", "Internal failure before running OpenJML");

            return invalid.toJSONString();
        }

        // try and find the json!
        StringBuffer json = new StringBuffer();

        boolean injson = false;
        for (String line : output.split(System.getProperty("line.separator"))) {

            if (line.startsWith("[verify-start]")) {
                injson = true;
                continue;
            }

            if (line.startsWith("[verify-end]")) {
                injson = false;
            }

            if (injson) {
                json.append(line);
            }

        }

        JSONObject obj = (JSONObject) JSONValue.parse(json.toString());

        obj.put("fullOutput", output);


        return obj.toJSONString();
    }
}
