<%-- 
    Document   : success
    Created on : 13-May-2016, 09:58:12
    Author     : ComSCIv3400
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
    <title>Web POSSystem</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="style2.css">
</head>

<body>
    <!-- =============== Navigation ================ -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="logo-pinterest"></ion-icon>
                        </span>
                        <span class="title">POS System</span>
                    </a>
                </li>

                <li>
                    <a href="Home.jsp">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Home</span>
                    </a>
                </li>

                <li>
                    <a href="MainSelling.jsp">
                        <span class="icon">
                            <ion-icon name="calculator-outline"></ion-icon>
                        </span>
                        <span class="title">Selling</span>
                    </a>
                </li>

                <li>
                    <a href="Product.jsp">
                        <span class="icon">
                            <ion-icon name="logo-dropbox"></ion-icon>
                        </span>
                        <span class="title">Product</span>
                    </a>
                </li>

                <li>
                    <a href="Order.jsp">
                        <span class="icon">
                            <ion-icon name="receipt-outline"></ion-icon>
                        </span>
                        <span class="title">Order</span>
                    </a>
                </li>

                <li>
                    <a href="Stock.jsp">
                        <span class="icon">
                            <ion-icon name="file-tray-stacked-outline"></ion-icon>
                        </span>
                        <span class="title">Stock</span>
                    </a>
                </li>

                <li>
                    <a href="Admin.jsp">
                        <span class="icon">
                            <ion-icon name="person-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Admin</span>
                    </a>
                </li>

                <li>
                    <a href="Session/logout.jsp">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Log Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
                
                 <h2>Product</h2>

                 
                 <div class="user">
                     <div class="text">
                        <%
                           if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                       %>
                            <h4>None</h4>
                            <small>- - -</small>
                        <%} else {
                        %>
                            <h4><%=session.getAttribute("userid")%></h4>
                            <small><%=session.getAttribute("id")%></small>
                        <%
                        }
                        %>
                     </div>
                     <a href="Admin.jsp" class="acc-img"><img src="assets/imgs/account1.jpg" width="40" height="40" alt=""></a>
                 </div>

            </div>


            <!-- ================ Order Details List ================= -->
            <div class="details">
                <div class="mainbox">
                    <div class="cardHeader">
                        <h2>Details Product</h2>
                        <form method="post" action="Product.jsp">
                            <div class="search">
                                    <label>
                                       <input type="text" name="id" placeholder="Search id . . .">
                                       <ion-icon name="search-outline"></ion-icon>
                                   </label>
                            </div>
                        </form>
                        
                        <a href="AddProduct.jsp" class="btn2">Add Product</a>
                    </div>
                 
                    
                        <%
                            String id = request.getParameter("id");    
                            if(id == null){
                                 id = "1";
                            };
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                            Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            String Sqlid = "Select * from product where p_id='"+Integer.parseInt(id)+"'";
                            ResultSet r = s.executeQuery(Sqlid);
                            r.next();
                        %>
                        <form method="post" action="Session/Delete_Product.jsp">
                          <div class="user-details">
                                <div class="input-box">
                                    <span class="txt-details">ID</span>
                                    <input type="text" id="id" name="id" value="<%=r.getString("p_id")%>" readonly="readonly"  required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Name</span>
                                    <input type="text" name="name"  value="<%=r.getString("p_name")%>" readonly="readonly" required>
                                </div>

                                <div class="input-box">
                                    <span class="txt-details">Group</span>
                                   <%
                                            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                            Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid1 = "Select * from productgroup where g_id='"+Integer.parseInt(r.getString("g_id"))+"'";
                                            ResultSet r1 = s1.executeQuery(Sqlid1);
                                            while (r1.next()) {
                                   %>
                                                 <input type="text" name="group"  value="<%=r1.getString("g_name")%>" readonly="readonly" required>
                                   <%
                                     }
                                   %>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">SubGroup</span>
                                    <%
                                            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                            Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid2 = "Select * from subgroup where s_id='"+Integer.parseInt(r.getString("s_id"))+"'";
                                            ResultSet r2 = s2.executeQuery(Sqlid2);
                                            while (r2.next()) {
                                   %>
                                                 <input type="text" name="subgroup"  value="<%=r2.getString("s_name")%>" readonly="readonly" required>
                                   <%
                                     }
                                   %>
                                 </div>
                                 <div class="input-box">
                                    <span class="txt-details">Supplier</span>
                                   <%
                                            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                            Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid3 = "Select * from supplier where sp_id='"+Integer.parseInt(r.getString("sp_id"))+"'";
                                            ResultSet r3 = s3.executeQuery(Sqlid3);
                                            while (r3.next()) {
                                   %>
                                                 <input type="text" name="supplier"  value="<%=r3.getString("sp_name")%>" readonly="readonly" required>
                                   <%
                                     }
                                   %>
                                </div>
                                 <div class="input-box">
                                    <span class="txt-details">Price</span>
                                    <input type="text" name="price"  value="<%=r.getString("price")%>" readonly="readonly" required>
                                </div>
                          </div>  
                          <input type="submit" class="button" value="Delete"></input>
                        </form>
                         <%
                        %>
                </div>
            </div>
        </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/alert.js"></script>
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>

