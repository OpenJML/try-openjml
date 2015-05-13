package lang;

import org.omg.CORBA.DynAnyPackage.Invalid;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by jls on 5/13/2015.
 */
public class ClassDataExtractor {

    private String source;

    public ClassDataExtractor(String source){
        this.source = source;
    }


    public String getName() throws InvalidClassfileException {

        Pattern pattern = Pattern.compile("(public|private)\\s+class\\s+([^\\s]+)");

        Matcher matcher = pattern.matcher(source);

        boolean found = false;
        while (matcher.find()) {
            return matcher.group(2);
        }

        throw new InvalidClassfileException("Cannot locate the classname for the given file.");
    }

}
