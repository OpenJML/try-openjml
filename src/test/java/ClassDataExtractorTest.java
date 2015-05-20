/**
 * Created by jls on 5/13/2015.
 */

import lang.ClassDataExtractor;
import lang.InvalidClassfileException;
import org.junit.Test;
import util.StubLoader;
import verily.lang.*;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


public class ClassDataExtractorTest {

    @Test
    public void testExtractClass1() throws IOException, InvalidClassfileException {
        ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("Test1.java"));
        assertEquals("Test1", e.getName());
    }

    @Test
    public void testExtractClass2() throws IOException, InvalidClassfileException {
        ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("Test2.java"));
        assertEquals("Test2", e.getName());
    }

    @Test
    public void testExtractClass3() throws IOException, InvalidClassfileException {
        ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("Test3.java"));
        assertEquals("Test3", e.getName());
    }

    @Test(expected=InvalidClassfileException.class)
    public void testExtractClass4() throws IOException, InvalidClassfileException {
        ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("Test4.java"));
        assertEquals("Test4", e.getName());
    }

    @Test(expected=InvalidClassfileException.class)
    public void testExtractClass5() throws IOException, InvalidClassfileException {
        ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("Test5.java"));
        assertEquals("Test5", e.getName());
    }

    //
    // this test relies on a huge amount of class files we took from OpenJDK to ensure that valid looking classes will correctly extract
    //
    @Test
    public void testSuite() throws IOException, InvalidClassfileException {
        DirectoryStream<Path> directoryStream = Files.newDirectoryStream(Paths.get("src/test/stubs/suite"));
            for (Path path : directoryStream) {
                String src = path.getFileName().toString();
                System.out.println(
                        "Checking File: " + src
                );
                ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("suite/" + src));
                assertEquals(src.split("\\.")[0], e.getName());

            }

    }
}