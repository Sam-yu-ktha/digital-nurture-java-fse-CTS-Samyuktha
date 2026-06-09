import java.util.HashMap;

public class Exercise25_HashMapExample {

    public static void main(String[] args) {

        HashMap<Integer, String> students = new HashMap<>();

        students.put(101, "Samyuktha");
        students.put(102, "Arun");
        students.put(103, "Priya");

        for (Integer id : students.keySet()) {

            System.out.println(id + " : " + students.get(id));
        }
    }
}
