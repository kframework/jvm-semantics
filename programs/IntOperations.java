public class IntOperations {

    public static void main(String [ ] args) {
        int i = 5;
        int j = 0;
        if (i < 10)
            j = i * 2;
        for (i = 0; i < 8; i+=2)
            j += 1;
        int k = i + j;
        int l = 6;
        j = l / j - 3;
        int m = l & 10;
        int n = 223423 << 5234 << 23 << 32;
    }
}
