<!DOCTYPE html>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<f:view>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
<head>
    <title>Website Menu</title>
     <link rel="stylesheet" type="text/css" href="Store.css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
</head>
<body>
     <header>
        <div class="header-top">
           
        </div>
        <div class="header-middle">
         	<h1>Mo Pharma</h1>
            <input type="text" placeholder="Search for Solimo" />
            <button>Search</button>
        </div>
        <div class="header-bottom">
            <a href="#">Home & Kitchen</a>
            <!-- Add more navigation links as needed -->
        </div>
    </header>

    <div class="content">
        <aside class="sidebar">
            <h3>Delivery Day</h3>
            <ul>
                <li><input type="checkbox" /> Get It Today</li>
                <li><input type="checkbox" /> Get It by Tomorrow</li>
                <li><input type="checkbox" /> Get It in 2 Days</li>
            </ul>

            <h3>Prime Now Stores</h3>
            <ul>
                <li><input type="checkbox" /> Amazon Fresh</li>
            </ul>

            <h3>Category</h3>
            <ul>
                <li><input type="checkbox" /> Any Department</li>
                <li><input type="checkbox" /> Home & Kitchen</li>
                <li><input type="checkbox" /> Artwork</li>
                <li><input type="checkbox" /> Bath Products</li>
                <li><input type="checkbox" /> Craft Materials</li>
                <!-- Add more categories as needed -->
            </ul>
        </aside>

        <main>
            <h2>Results</h2>
            <p>Price and other details may vary based on product size and color.</p>
            <div class="product-grid">
                <div class="product">
                    <span class="badge">Amazon's Choice</span>
                    <img src="path_to_image/bottle.png" alt="Solimo Stainless Steel Bottle" />
                    <p>Amazon Brand -  Stainless Steel Insulated 24 Hours Hot or...</p>
                </div>
                <div class="product">
                    <span class="badge best-seller">Best Seller</span>
                    <img src="path_to_image/clock.png" alt="Solimo Wall Clock" />
                    <p>Amazon Brand - Solimo Abstract Wall Clock | Round | Plastic...</p>
                </div>
                <div class="product">
                    <img src="path_to_image/towel.png" alt="Solimo Cotton Turkish Towel" />
                    <p>Amazon Brand - Solimo Cotton Turkish Towel | Multicolour...</p>
                </div>
                <div class="product">
                    <img src="path_to_image/bathmat.png" alt="Solimo Bathmat" />
                    <p>Amazon Brand - Solimo Water Absorbent Non-Slip Bathmat...</p>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
</f:view>
