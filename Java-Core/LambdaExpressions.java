interface Message {

    void display();
}

public class Exercise27_LambdaExpressions {

    public static void main(String[] args) {

        Message msg = () -> System.out.println("Hello from Lambda Expression");

        msg.display();
    }
}
