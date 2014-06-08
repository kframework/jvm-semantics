public class MethodReturn {

    public static int a;
    public static long b;  
    public static float c;
    public static double d;
    public static A objA;

    public static void main(String [ ] args) {
        a = intAdd(7, 8);
        b = longSub(5, 7);
        c = floatMul(2.3f, 5.2f);
        d = doubleDiv(9.3d, 3.1d);
        objA = newA();
    }

    public static int intAdd(int a, int b) {
        return a + b;
    }

    public static long longSub(long a, long b) {
        return a - b;
    }

    public static float floatMul(float a, float b) {
        return a * b;
    }

    public static double doubleDiv(double a, double b) {
        return a / b;
    }

    public static A newA() {
        return new A();
    }
}
