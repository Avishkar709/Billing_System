<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category List</title>
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
        width: 80%;
        max-width: 900px;
    }

   a {
    text-decoration:none;
    margin-top:10px;
        margin-bottom: 20px;
        font-size: 24px;
        text-align: left;
        color:black;
    font-weight:bolder;
    }
    

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }

    .add-category {
        text-decoration: none;
        padding: 10px 20px;
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    .add-category:hover {
        background-color: #218838;
    }

    .search-box {
        display: flex;
        align-items: center;
    }

    .search-box label {
        margin-right: 5px;
        font-weight: bold;
    }

    .search-box input {
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 10px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }
    
    .edit, .delete {
    text-decoration:none;
    padding: 5px 10px;
    border: none;
    background: none;
    cursor: pointer;
}

.edit:hover {
    background-color: #138496;
    border-radius: 5px;
}

.delete:hover {
    background-color: #c82333;
    border-radius: 5px;
}
    

    .entries {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .page-buttons {
        display: flex;
        align-items: center;
        margin-left: 730px;
    }

    button.previous,
    button.next,
    button.page-number {
        padding: 5px 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 5px;
    }

    button.page-number.active {
        background-color: #007bff;
        color: #fff;
    }

    button.page-number:hover,
    button.previous:hover,
    button.next:hover {
        background-color: #0056b3;
        color: #fff;
    }
</style>
<body>
    <div class="container">
        <a href="Home.jsp" class="Category-list">Category List</a>
        <div class="header">
            <a href="addCategory.jsp" class="add-category">+ Add Category</a>
            <div class="search-box">
                <label for="search">Search:</label>
                <input type="text" id="search">
            </div>
        </div>

        <table id="categoryTable">
            <tr>
                <th>No.</th>
                <th>Category Name</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <% 
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
                    try (PreparedStatement ps = c.prepareStatement("SELECT * FROM categories2")) {
                        ResultSet rs = ps.executeQuery();
                        int count = 1;
                        while (rs.next()) {
                            %>
                            <tr>
                                <td><%= count++ %></td>
                                <td><%= rs.getString("category_name") %></td>
                                <td><%= rs.getString("status") %></td>
                                <td>
                                    <a href="editCategory.jsp?id=<%= rs.getInt("id") %>" class="edit">✏️ </a>
                                    <a href="deleteCategory.jsp?id=<%= rs.getInt("id") %>" class="delete">🗑️</a>
                                </td>
                            </tr>
                            <%
                        }
                    }
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </table>
    </div>
</body>
</html>