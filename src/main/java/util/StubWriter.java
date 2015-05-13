package util;

import lang.ClassDataExtractor;
import lang.InvalidClassfileException;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 * Created by jls on 5/13/2015.
 */
public class StubWriter {

    public static File writeStubExtractingClassName(String source) throws IOException, InvalidClassfileException {

        Path clazz = Files.createTempDirectory("try-openjml").resolve(new ClassDataExtractor(source).getName() + ".java");

        Files.write(clazz, source.getBytes());

        return clazz.toFile();
    }
}
