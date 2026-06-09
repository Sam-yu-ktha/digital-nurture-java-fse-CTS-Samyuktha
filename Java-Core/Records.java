record Student(String name, int age) {}

public class Exercise29_Records {

    public static void main(String[] args) {

        Student s1 = new Student("Samyuktha", 20);

        System.out.println("Name : " + s1.name());
        System.out.println("Age : " + s1.age());
    }
}
