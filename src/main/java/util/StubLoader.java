package util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Created by jls on 5/13/2015.
 */
public class StubLoader {
    public static String loadStub(String name) throws IOException {
        return new String(Files.readAllBytes(Paths.get("src/test/stubs/" + name)));
    }
}
