<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
            try (PreparedStatement ps = c.prepareStatement("DELETE FROM products WHERE id = ?")) {
                ps.setInt(1, productId);
                ps.executeUpdate();
            }
        }
        response.sendRedirect("categoryPage.jsp?id=" + request.getParameter("categoryId"));
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
