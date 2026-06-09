class Animal {

    void sound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {

    void bark() {
        System.out.println("Dog barks");
    }
}

public class Exercise18_InheritanceExample {

    public static void main(String[] args) {

        Dog dog = new Dog();

        dog.sound();
        dog.bark();
    }
}
