public class StaticMethodCall {

    public static void main(String [ ] args) {
        int res = 5 + m();
    }
    
    public static int m() {
        int m = 3;
        m += 2;        
        return m;
    }
}
