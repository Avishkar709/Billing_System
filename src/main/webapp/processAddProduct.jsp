<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Add Product</title>
</head>
<body>
<%
    String productName = request.getParameter("productName");
    double price = Double.parseDouble(request.getParameter("price"));
    String photoUrl = request.getParameter("photoUrl");
    String description = request.getParameter("description");
    int categoryId = Integer.parseInt(request.getParameter("categoryId"));

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
            String sql = "INSERT INTO products (product_name, price, photo_url, description, category_id) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, productName);
                ps.setDouble(2, price);
                ps.setString(3, photoUrl);
                ps.setString(4, description);
                ps.setInt(5, categoryId);
                ps.executeUpdate();
            }
        }
        response.sendRedirect("categoryPage.jsp?id=" + categoryId);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>
