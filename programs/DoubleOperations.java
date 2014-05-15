public class DoubleOperations {

    public static void main(String [ ] args) {
        double i = 5d;
        double j = 20.5d;
        if (i < 10)
            j = i * 2;
        for (i = 0; i < 8; i+=2)
            j += 1.3d;
        double k = i + j;
        double l = 6.7d;
        j = l / j - 3;
    }
}
