<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link rel="stylesheet" href="HomeStyle.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css">
</head>

<body>
    <div class="sidebar hidden">
        <div class="header">
            <span class="title">PharmaCare.co</span>
        </div>
        <ul class="menu">
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt'></i>
                    <span class="link-text">Dashboard</span>
                </a>
                <ul class="sub-items blank">
                    <li><a class="link-text" href="#">Dashboard</a></li>
                </ul>
            </li>
            <li>
                <div class="icon-link">
                    <a href="#">
                        <i class='bx bx-collection'></i>
                        <span class="link-text">Category</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-items">
                    <% 
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        try (Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system")) {
                            try (PreparedStatement ps = c.prepareStatement("SELECT * FROM categories2")) {
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    String categoryId = rs.getString("id");
                                    String categoryName = rs.getString("category_name");
                                    %>
                                    <li><a href="#" onclick="loadCategoryPage('<%= categoryId %>'); return false;"><%= categoryName %></a></li>
                                    <%
                                }
                            }
                        }
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                    %>
                </ul>
            </li>
            <li>
                <a href="#" onclick="loadAddCategory(); return false;">
                    <i class="bi bi-plus-square"></i>
                    <span class="link-text">Add-Categories</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-history'></i>
                    <span class="link-text">History</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-cog'></i>
                    <span class="link-text">Setting</span>
                </a>
            </li>
            <li>
                <a href="login.jsp">
                    <i class='bx bx-log-out'></i>
                    <span class="link-text">Log out</span>
                </a>
            </li>
        </ul>
        <div class="user-info">
            <div class="profile-pic">
                <img src="assets/Admin-Login.jpg" alt="Profile Picture">
            </div>
            <div>
                <div class="name">Tron-Softech</div>
                <div class="role">Admin</div>
            </div>
        </div>
    </div>

    <div class="content-area">
        <div class="content-header">
            <i class='bx bx-menu menu-icon'></i>
            <span class="text">PharmaCare.co</span>
        </div>
        <!-- Iframe for loading content -->
        <iframe id="content-frame" src="about:blank" frameborder="0" style="width: 100%; height: 100%; "></iframe>
    </div>

    <script>
        function loadAddCategory() {
            document.getElementById('content-frame').src = 'getCategoriesFinal.jsp';
        }

        function loadCategoryPage(categoryId) {
            document.getElementById('content-frame').src = 'categoryPage.jsp?id=' + categoryId;
        }

        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
            arrow[i].addEventListener("click", (e) => {
                let arrowParent = e.target.parentElement.parentElement;
                arrowParent.classList.toggle("show");
            });
        }

        let sidebar = document.querySelector(".sidebar");
        let menuIcon = document.querySelector(".menu-icon");
        menuIcon.addEventListener("click", () => {
            sidebar.classList.toggle("hidden");
        });
    </script>
</body>
</html>
