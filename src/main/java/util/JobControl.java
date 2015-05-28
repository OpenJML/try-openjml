package util;

import java.util.concurrent.Semaphore;

/**
 * Created by jls on 5/28/2015.
 */
public final class JobControl {

    public static final Semaphore s;

    static {
        s = new Semaphore(Constants.MAX_JOBS);
    }


    public static void start(){
        s.acquireUninterruptibly();
    }

    public static void finish(){
        s.release();
    }

}
