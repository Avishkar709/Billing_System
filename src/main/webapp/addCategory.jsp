<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
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
        hr{
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
</head>
<body>
    <div class="container">
        <h1>Add Category</h1>
        <hr>
        <form id="addCategoryForm" action="AddCategoryServlet" method="post">
            <div class="form-group">
                <label for="category-name">Category Name <span class="required">*</span></label>
                <input type="text" name="category-name" id="category-name" required>
            </div>
            <div class="form-group">
                <label for="status">Status <span class="required">*</span></label>
                <div class="status-options">
                    <input type="radio" id="active" name="status" value="Active" required>
                    <label for="active">Active</label>
                    <input type="radio" id="inactive" name="status" value="Inactive" required>
                    <label for="inactive">Inactive</label>
                </div>
            </div>
            <button type="submit" class="button">Submit</button>
        </form>
    </div>
</body>
</html>
