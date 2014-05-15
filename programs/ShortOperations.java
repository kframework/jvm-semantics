public class ShortOperations {

    public static void main(String [ ] args) {
        short i = 5;
        short j = 20;
        if (i < 10)
            j = (short) (i * 2);
        for (i = 0; i < 8; i+=2)
            j += 1;
        short k = (short) (i + j);
        short l = 6;
        j = (short) (j / l - 3);
    }
}
