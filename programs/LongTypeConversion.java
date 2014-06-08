public class LongTypeConversion {

    public static long a;
    public static int b;
    public static double c;
    public static float d;

    public static void main(String [ ] args) {
        a = 3147483647l;
        b = (int) a;
        c = a;
        d = a;
    }
}
