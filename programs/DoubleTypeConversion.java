public class DoubleTypeConversion {

    public static double a;
    public static int b;
    public static long c;
    public static float d;

    public static void main(String [ ] args) {
        a = 340282.40d;
        b = (int) a;
        c = (long) a;
        d = (float) a;
    }
}
