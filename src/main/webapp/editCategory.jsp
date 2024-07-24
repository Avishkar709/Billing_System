<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
    <link rel="stylesheet" href="styles.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #E4E9F7;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
    }

    h1 {
        margin-top: 0;
        margin-bottom: 10px;
        font-size: 24px;
        text-align: center;
    }

    hr {
        margin-bottom: 20px;
        width: 340px;
        margin-left: -20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .required {
        color: red;
    }

    input[type="text"] {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .status-options {
        display: flex;
        align-items: center;
    }

    .status-options label {
        margin-top: 5px;
        margin-left: 5px;
        margin-right: 15px;
    }

    .button {
        text-decoration: none;
        width: 100%;
        padding: 10px;
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    .button:hover {
        background-color: #218838;
    }
</style>
<body>
    <div class="container">
        <h1>Edit Category</h1>
        <form action="updateCategory.jsp" method="post">
            <%-- Retrieve category ID from query parameter --%>
            <% 
            int categoryId = Integer.parseInt(request.getParameter("id"));
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
                    String sql = "SELECT * FROM categories2 WHERE id = ?";
                    try (PreparedStatement ps = c.prepareStatement(sql)) {
                        ps.setInt(1, categoryId);
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            String categoryName = rs.getString("category_name");
                            String status = rs.getString("status");
                            %>
                            <input type="hidden" name="id" value="<%= categoryId %>">
                            <div class="form-group">
                                <label for="categoryName">Category Name:</label>
                                <input type="text" id="categoryName" name="categoryName" value="<%= categoryName %>" required>
                            </div>
                            <div class="form-group">
                                <label for="status">Status:</label>
                                <input type="text" id="status" name="status" value="<%= status %>" required>
                            </div>
                            <input type="submit" value="Update" class="button">
                            <%
                        } else {
                            out.println("Category not found");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            }
            %>
        </form>
    </div>
</body>
</html>
