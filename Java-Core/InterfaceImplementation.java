interface Vehicle {

    void start();
}

class Car implements Vehicle {

    public void start() {
        System.out.println("Car Started");
    }
}

public class Exercise19_InterfaceImplementation {

    public static void main(String[] args) {

        Car car = new Car();
        car.start();
    }
}
