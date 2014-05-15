public class Anonymous {

    public static void main(String [ ] args) {
        F myF = new F() {
            public int getF1() {
                return 1;
            }
        };

        A myA = new A();
        myA.a1 = myF.getF1();
    }
}
