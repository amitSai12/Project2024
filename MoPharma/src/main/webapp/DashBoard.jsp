<!DOCTYPE html>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<f:view>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
<head>
    <title>Website Menu</title>
     <link rel="stylesheet" type="text/css" href="DashBoard.css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const dropdowns = document.querySelectorAll('.dropdown');

        dropdowns.forEach(dropdown => {
            dropdown.addEventListener('mouseover', function() {
                this.querySelector('.dropdown-content').style.display = 'block';
            });

            dropdown.addEventListener('mouseout', function() {
                this.querySelector('.dropdown-content').style.display = 'none';
            });
        });
    });

    const themeToggle = document.getElementById('theme-toggle');
    themeToggle.addEventListener('click', () => {
      document.body.classList.toggle('dark-theme');
    });
        
    </script>
</head>
<body>
    <div class="menu-container">
        <div class="social-icons">
           <!--  <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fas fa-basketball-ball"></i></a> -->
        </div>
        <div class="logo">
            <h1>Mo PHARMA</h1>
            <p>Biju Gurantee, Sankha Gurantee</p>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search...">
            <button><i class="fa fa-search"></i></button>
        </div>
        <nav class="main-nav">
            <ul>
                <li class="active"><a href="#">Home</a></li>
                <li class="dropdown">
                    <a href="#">Page <i class="fa"> &#xf107;</i></a>
                    <ul class="dropdown-content">
                        <li><a href="#">Subpage 1</a></li>
                        <li><a href="#">Subpage 2</a></li>
                        <li><a href="#">Subpage 3</a></li>
                    </ul>
                </li>
                <li><a href="#">Work</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </div>
    
    <h:commandButton value=""></h:commandButton>
   
</body>
</html>
</f:view>
