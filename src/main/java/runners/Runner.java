package runners;

import lang.ClassDataExtractor;
import lang.InvalidClassfileException;
import util.StubWriter;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jls on 5/13/2015.
 */
public abstract class Runner {

    private String source;

    public Runner(String source)
    {
        this.source = source;
    }

    public abstract String[] getArgs(String fileName, String filePath);

    public CheckerResult run() throws IOException, InterruptedException, InvalidClassfileException {

        File stub = StubWriter.writeStubExtractingClassName(this.source);
        String fileName = new ClassDataExtractor(source).getName();

        Process p = new ProcessBuilder(getArgs(fileName, stub.getAbsolutePath())).redirectErrorStream(true).start();

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

        if (exitStatus != 0) {
            return new CheckerResult(sb.toString(), false);
        }

        return new CheckerResult(sb.toString(), true);
    }
}
