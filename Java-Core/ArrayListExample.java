import java.util.ArrayList;

public class Exercise24_ArrayListExample {

    public static void main(String[] args) {

        ArrayList<String> students = new ArrayList<>();

        students.add("Samyuktha");
        students.add("Arun");
        students.add("Priya");

        System.out.println("Student List:");

        for (String name : students) {
            System.out.println(name);
        }
    }
}
