public class BitwiseOperations {

    public static int a;
    public static int b;
    public static int c;
    public static long d;
    public static long e;
    public static long f;    

    public static void main(String [ ] args) {
        a = 32 << 2;
        b = 32 >> 2;
        c = -32 >>> 2;
        d = 128l << 1;
        e = 128l >> 1;
        f = -2l >>> 32;
    }
}
