package App;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");
	        String password = request.getParameter("pass");

	        // Check if email and password are provided
	        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
	            response.sendRedirect("login.jsp?error=Please enter email and password");
	            return;
	        }

	        // Database connection parameters
	        String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
	        String dbUser = "system";
	        String dbPassword = "system";

	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
	                String sql = "SELECT * FROM users WHERE email = ? AND pass = ?";
	                try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                    statement.setString(1, email);
	                    statement.setString(2, password);
	                    try (ResultSet resultSet = statement.executeQuery()) {
	                        if (resultSet.next()) {
	                            // Authentication successful
	                            response.sendRedirect("Home.jsp"); // Redirect to dashboard or another page
	                        } else {
	                            // Authentication failed
	                            response.sendRedirect("login.jsp?error=Invalid email or password");
	                        }
	                    }
	                }
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("login.jsp?error=Database connection error");
	        }
	    }
	}