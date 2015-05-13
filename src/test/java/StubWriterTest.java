import lang.ClassDataExtractor;
import lang.InvalidClassfileException;
import org.junit.Test;
import util.StubLoader;
import util.StubWriter;

import java.io.File;
import java.io.IOException;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class StubWriterTest {

    @Test
    public void testWriteStub() throws InvalidClassfileException, IOException {
        File f= StubWriter.writeStubExtractingClassName(StubLoader.loadStub("Test1.java"));

        assertTrue(f.getAbsolutePath().endsWith("ESCRunner.java"));
    }
}
