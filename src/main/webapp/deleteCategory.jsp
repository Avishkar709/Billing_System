<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=getCategoriesFinal.jsp">
    <title>Delete Category</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Deleting Category...</h1>
        <% 
        int categoryId = Integer.parseInt(request.getParameter("id"));
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
                String sql = "DELETE FROM categories2 WHERE id = ?";
                try (PreparedStatement ps = c.prepareStatement(sql)) {
                    ps.setInt(1, categoryId);
                    int rowsDeleted = ps.executeUpdate();
                    if (rowsDeleted > 0) {
                        out.println("<p>Category deleted successfully.</p>");
                    } else {
                        out.println("<p>Failed to delete category.</p>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
        %>
    </div>
</body>
</html>
