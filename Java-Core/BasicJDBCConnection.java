import java.sql.Connection;
import java.sql.DriverManager;

public class Exercise31_BasicJDBCConnection {

    public static void main(String[] args) {

        try {

            String url = "jdbc:mysql://localhost:3306/testdb";
            String user = "root";
            String password = "root";

            Connection con = DriverManager.getConnection(url, user, password);

            System.out.println("Database Connected Successfully");

            con.close();

        } catch (Exception e) {

            System.out.println("Connection Failed");
        }
    }
}
