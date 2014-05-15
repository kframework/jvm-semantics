public class InnerClass {

    public static void main(String [ ] args) {
        A myA = new A();
        myA.a1 = 111;
        myA.setA2();
    }

    private static class A {
        public int a1 = 0;
        private int a2 = 1;

        public A() {

        }

        public void setA2() {
            this.a2 = 2;
        }
    }
}
