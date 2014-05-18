public class HelloJNI {
    static {
        System.loadLibrary("hellojni");
    }

    private static native String getMessage();

    public static void main(String[] args) {
        System.out.println(getMessage());
    }
}

