/**
 * Created by jls on 5/13/2015.
 */

import lang.ClassDataExtractor;
import lang.InvalidClassfileException;
import org.junit.Test;
import util.StubLoader;
import verily.lang.*;

import java.io.IOException;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


public class ClassDataExtractorTest {

    @Test
    public void testExtractClass1() throws IOException, InvalidClassfileException {
        ClassDataExtractor e = new ClassDataExtractor(StubLoader.loadStub("Test1.java"));
        assertEquals("ESCRunner", e.getName());
    }
}