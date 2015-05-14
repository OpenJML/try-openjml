package runners;


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
        args.add(String.format("cat %s | python tool_runner.py --timeout 20 -esc %s", filePath, fileName));

        String[] ar = new String[args.size()];
        return args.toArray(ar);

    }
}
