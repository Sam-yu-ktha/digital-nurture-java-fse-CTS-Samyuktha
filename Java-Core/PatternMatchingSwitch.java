public class Exercise30_PatternMatchingSwitch {

    public static void main(String[] args) {

        Object obj = "Java";

        String result = switch (obj) {

            case String s -> "String Value : " + s;

            case Integer i -> "Integer Value : " + i;

            default -> "Unknown Type";
        };

        System.out.println(result);
    }
}
