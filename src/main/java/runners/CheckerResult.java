package runners;

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
            return String.format("{\"returnCode\": -2600, \"reason\"    : \"%s\", \"description\" : \"Internal failure before running OpenJML\"}", output.replaceAll("\"", "\\\""));
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

        return json.toString();
    }
}
