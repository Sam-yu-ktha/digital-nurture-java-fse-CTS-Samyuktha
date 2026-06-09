import java.net.ServerSocket;
import java.net.Socket;

public class Exercise35_TCPClientServerChat {

    public static void main(String[] args) {

        try {

            ServerSocket server = new ServerSocket(5000);

            System.out.println("Server Waiting...");

            Socket socket = server.accept();

            System.out.println("Client Connected");

            socket.close();
            server.close();

        } catch (Exception e) {

            System.out.println("Error Occurred");
        }
    }
}
