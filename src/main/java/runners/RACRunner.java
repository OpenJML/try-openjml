package runners;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jls on 5/13/2015.
 */
public class RACRunner extends Runner {


    public RACRunner(String source) {
        super(source);
    }

    public String[] getArgs(String fileName, String filePath){

        List<String> args = new ArrayList<String>();

        args.add("sh");
        args.add("-c");
        args.add(String.format("cat %s | python tool_runner.py --timeout 20 -rac %s", filePath, fileName));

        String[] ar = new String[args.size()];
        return args.toArray(ar);

    }
}
