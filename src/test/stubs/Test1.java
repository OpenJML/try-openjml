import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ESCRunner implements Runner {



    private static String[] getESCCommandArgs(String file)  {

        List<String> args = new ArrayList<String>();

        args.add("java");
        args.add("-jar");
        args.add("-esc");
        args.add(file);

        String[] ar = new String[args.size()];
        return args.toArray(ar);

    }


    public CheckerResult run(String file) throws IOException, InterruptedException {

        Process p = new ProcessBuilder(getESCCommandArgs(file)).redirectErrorStream(true).start();

        InputStream is = p.getInputStream();

        List<String> escOutput = new ArrayList<String>();

        BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line = null;
        while ( (line = br.readLine()) != null) {
            sb.append(line);
            sb.append(System.getProperty("line.separator"));
            escOutput.add(line);
        }

        is.close();

        int exitStatus = p.waitFor();

        if (exitStatus != 0 || (escOutput.size() > 0 && escOutput.get(escOutput.size()-1).contains("warnings"))) {
            return new CheckerResult(sb.toString(), false);
        }

        return new CheckerResult(sb.toString(), true);
    }
}