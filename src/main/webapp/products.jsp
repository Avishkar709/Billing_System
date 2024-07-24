<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
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
    a{
    text-decoration:none;
    }

    .heading {
        margin-top: 10px;
        margin-bottom: 30px;
    }

    .Category-list {
        text-decoration: none;
        font-size: 24px;
        text-align: left;
        color: black;
        font-weight: bolder;
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
</style>

<body>
    <div class="container">
        <div class="heading">
            <a href="Home.jsp" class="Category-list">Category List</a>
        </div>

        <table id="categoryTable">
            <tr>
                <th>No.</th>
                <th>Category Name</th>
                <th>Show Product Page</th>
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
                                <td>
                                    <a href="categoryPage.jsp?id=<%= rs.getInt("id") %>">Show Products</a>
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
