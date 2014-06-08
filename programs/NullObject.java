public class NullObject {

    public static int n1;
    public static int n2;

    public static void main(String [ ] args) {
        A obj = null;

        if (obj == null) {
            n1 = 1;
        }

        obj = new A();

        if (obj != null) {
            n2 = 2;
        }

        if (obj == null) {
            n1 = 3;
        }
    }
}
