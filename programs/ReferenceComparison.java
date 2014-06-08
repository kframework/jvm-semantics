public class ReferenceComparison {   

    public static int x;
    public static int y;

    public static void main(String [ ] args) {
        A a1 = new A();
        A a2 = new A();

        if (a1 != a2) {
            x = 1;
        }

        a2 = a1;

        if (a1 == a2) {
            y = 2;
        }
    }
}
