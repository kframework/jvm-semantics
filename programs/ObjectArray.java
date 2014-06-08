public class ObjectArray {

    public static int x;    

    public static void main(String [ ] args) {
        A myA = new A();

        A[] a = new A[2];
        a[0] = new A();
        a[1] = new A(); 

        x = a[0].a1;   
    }
}
