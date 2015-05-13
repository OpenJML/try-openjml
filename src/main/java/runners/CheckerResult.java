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

    public String toJSON(){
        return null;
    }
}
