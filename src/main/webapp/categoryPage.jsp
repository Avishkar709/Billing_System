<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="styles.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
        max-width: 1200px;
    }
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    .add-product {
        text-decoration: none;
        padding: 10px 20px;
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    .add-product:hover {
        background-color: #218838;
    }
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
    }
    .product-card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .product-card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
    }
    .product-info {
        padding: 15px;
    }
    .product-info h4 {
        margin: 0 0 10px;
    }
    .product-info p {
        margin: 0 0 10px;
        color: #777;
    }
    .product-info .price {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .add-to-cart, .delete-product {
        text-decoration: none;
        padding: 10px 15px;
        color: #fff;
        border-radius: 4px;
        display: inline-block;
        text-align: center;
        width: 90px;
    }
    .add-to-cart {
        background-color: #007bff;
    }
    .add-to-cart:hover {
        background-color: #0056b3;
    }
    .delete-product {
    	width:50px;
        background-color: 	#FF4433;
        border: none;
        cursor: pointer;
        margin-left:0px;
    }
    .delete-product:hover {
        background-color: #c82333;
    }
</style>
<body>
    <div class="container">
        <div class="header">
            <h2>Products for Selected Category</h2>
            <a href="addProduct.jsp?categoryId=<%= request.getParameter("id") %>" class="add-product">+ Add Product</a>
        </div>

        <div class="product-grid">
            <% 
            int categoryId = Integer.parseInt(request.getParameter("id"));
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
                    try (PreparedStatement ps = c.prepareStatement("SELECT * FROM products WHERE category_id = ?")) {
                        ps.setInt(1, categoryId);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            %>
                            <div class="product-card">
                                <img src="assets/<%= rs.getString("photo_url") %>" alt="<%= rs.getString("product_name") %>">
                                <div class="product-info">
                                    <h4><%= rs.getString("product_name") %></h4>
                                    <p class="description"><%= rs.getString("description") %></p>
                                    <p class="price"><%= rs.getDouble("price") %> Rs</p>
                                    <a href="addToCart.jsp?id=<%= rs.getInt("id") %>" class="add-to-cart">Add to Cart</a>
                                    <form action="deleteProduct.jsp" method="post" style="display:inline;">
                                        <input type="hidden" name="productId" value="<%= rs.getInt("id") %>">
                                        <input type="hidden" name="categoryId" value="<%= categoryId %>">
                                        <button type="submit" class="delete-product"><i class='bx bxs-trash'></i></button>
                                    </form>
                                </div>
                            </div>
                            <%
                        }
                    }
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </div>
    </div>
</body>
</html>
