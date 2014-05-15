public class FloatOperations {

    public static void main(String [ ] args) {
        float i = 5f;
        float j = 20.5f;
        if (i < 10)
            j = i * 2;
        for (i = 0; i < 8; i+=2)
            j += 1.3f;
        float k = i + j;
        float l = 6.7f;
        j = l / j - 3;
    }
}
