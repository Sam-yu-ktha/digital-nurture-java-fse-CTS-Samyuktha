import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Exercise32_JDBCInsertUpdate {

    public static void main(String[] args) {

        try {

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/testdb",
                    "root",
                    "root");

            Statement stmt = con.createStatement();

            String insertQuery =
                    "INSERT INTO student VALUES(101,'Samyuktha')";

            stmt.executeUpdate(insertQuery);

            String updateQuery =
                    "UPDATE student SET name='Sam' WHERE id=101";

            stmt.executeUpdate(updateQuery);

            System.out.println("Insert and Update Successful");

            con.close();

        } catch (Exception e) {

            System.out.println(e.getMessage());
        }
    }
}
