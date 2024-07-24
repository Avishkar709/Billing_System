<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="3;url=getCategoriesFinal.jsp">
    <title>Updating Category...</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Updating Category...</h1>
        <% 
        int categoryId = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("categoryName");
        String status = request.getParameter("status");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
                String sql = "UPDATE categories2 SET category_name = ?, status = ? WHERE id = ?";
                try (PreparedStatement ps = c.prepareStatement(sql)) {
                    ps.setString(1, categoryName);
                    ps.setString(2, status);
                    ps.setInt(3, categoryId);
                    int rowsUpdated = ps.executeUpdate();
                    if (rowsUpdated > 0) {
                        out.println("<p>Category updated successfully.</p>");
                    } else {
                        out.println("<p>No category found with ID: " + categoryId + "</p>");
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
