import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Exercise33_TransactionHandlingJDBC {

    public static void main(String[] args) {

        try {

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/testdb",
                    "root",
                    "root");

            con.setAutoCommit(false);

            Statement stmt = con.createStatement();

            stmt.executeUpdate(
                    "INSERT INTO student VALUES(102,'Arun')");

            stmt.executeUpdate(
                    "INSERT INTO student VALUES(103,'Priya')");

            con.commit();

            System.out.println("Transaction Completed");

            con.close();

        } catch (Exception e) {

            System.out.println("Transaction Failed");
        }
    }
}
