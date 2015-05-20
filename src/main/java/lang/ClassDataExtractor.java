package lang;

import org.omg.CORBA.DynAnyPackage.Invalid;

import java.util.ArrayList;
import java.util.List;
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

        Pattern pattern = Pattern.compile("^([a-z]+\\s+)*(class|interface)\\s+(\\w[a-zA-Z0-9_]*)[^;^&]*\\{", Pattern.DOTALL | Pattern.MULTILINE);

        Matcher matcher = pattern.matcher(source);

        boolean found = false;
        while (matcher.find()) {
            return matcher.group(3);
        }

        throw new InvalidClassfileException("Cannot locate the classname for the given file.");
    }

    public enum LexMode {
        IN_QUOTE,
        COMMENT,
        NORMAL
    }

    private boolean isCommentStart(int pos){
        return (pos+1 < source.length() && source.charAt(pos)=='/' && source.charAt(pos+1)=='*');
    }

    private boolean isCommentEnd(int pos){
        return (pos+1 < source.length() && source.charAt(pos)=='*' && source.charAt(pos+1)=='/');
    }

    // a very trivial lexer
    public List<Token> lex(){

        int pos=-1;
        int in = 0;
        int out= 0;

        LexMode mode = LexMode.NORMAL;

        List<Token> tokens = new ArrayList<Token>();

        for(pos=0; pos < source.length(); pos++){

            if(mode==LexMode.NORMAL) {
                if (Character.isWhitespace(source.charAt(pos))) { /* eat up whitespace */
                    continue;
                }

                if(isCommentStart(pos)){
                    mode = LexMode.COMMENT; pos+=1;
                }

            }else if(mode==LexMode.COMMENT){                      /* ignore everything while in this mode */

                if(isCommentEnd(pos)) {
                    mode = LexMode.NORMAL;
                    pos +=1;
                }

            }

        }


        return null;
    }

}
