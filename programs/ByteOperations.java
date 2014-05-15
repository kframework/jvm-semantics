public class ByteOperations {

    public static void main(String [ ] args) {
        byte i = 5;
        byte j = 20;
        if (i < 10)
            j = (byte) (i * 2);
        for (i = 0; i < 8; i+=2)
            j = (byte) (j + 1);
        byte k = (byte) (i + j);
        byte l = 6;
        j = (byte) 200;
        j = (byte) (j / l - 3);
    }
}
