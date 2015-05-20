package lang;

/**
 * Created by jls on 5/20/2015.
 */
public class Token {


    public enum TokenType {
        STRING_LITERAL,
        PUBLIC,
        STATIC,
        FINAL,
        PRIVATE

    }

    private String token;
    private TokenType type;

    public Token(String token, TokenType type){
        this.token = token;
        this.type  = type;
    }

    public String getToken() {
        return token;
    }

    public TokenType getType() {
        return type;
    }


}
