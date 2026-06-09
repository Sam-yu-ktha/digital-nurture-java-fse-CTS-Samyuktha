class Student {

    String name;
    int age;

    void display() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
    }
}

public class Exercise17_ClassAndObjectCreation {

    public static void main(String[] args) {

        Student s1 = new Student();

        s1.name = "Samyuktha";
        s1.age = 20;

        s1.display();
    }
}
