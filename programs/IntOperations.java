public class IntOperations {

    public static int r;

    public static void main(String [ ] args) {
        int i = 5;
        int j = 0;
        if (i < 10)
            j = i * 2;
        for (i = 0; i < 8; i+=2)
            j += 1;
        int k = i + j;
        int l = 6;
        r = l / j - 3;
    }
}
