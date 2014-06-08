public class IntTypeConversion {

    public static int a;
    public static long b;
    public static float c;
    public static double d;
    public static byte e;
    public static char f;
    public static short g;

    public static void main(String [ ] args) {
        a = 100000;
        b = a;
        c = a;
        d = a;
        e = (byte) a;
        f = (char) a;
        g = (short) a; 
    }
}
