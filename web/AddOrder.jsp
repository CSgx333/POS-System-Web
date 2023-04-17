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
                
                    <h2>Order</h2>

                 
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
                        <h2>Add Order</h2>
                    </div>
                 
                        <form method="post" action="Session/Add_Order.jsp">
                          <div class="user-details">
                                <div class="input-box">
                                    <span class="txt-details">Order ID</span>
                                    <input type="text" name="cur_id" value="" placeholder="รหัสใบสั่งซื้อ" required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Product ID</span>
                                    <input type="text" name="p_id" placeholder="รหัสสินค้า" required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Product Name</span>
                                    <%
                                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();;
                                        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                        Statement s2 = c2.createStatement();
                                        ResultSet r2 = s2.executeQuery("Select * from product");
                                    %>
                                    <select name="p_name" >
                                     <%
                                        while (r2.next()) {
                                    %>
                                        <option><%=r2.getString("p_name")%></option>
                                    <%}%>
                                    </select>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Unit</span>
                                    <%
                                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();;
                                        c2 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
                                        s2 = c2.createStatement();
                                        r2 = s2.executeQuery("Select * from unit");
                                    %>
                                    <select name="id_unit" >
                                     <%
                                        while (r2.next()) {
                                    %>
                                        <option><%=r2.getString("name_unit")%></option>
                                    <%}%>
                                    </select>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Supplier</span>
                                     <%
                                        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                                        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                        Statement s3 = c3.createStatement();
                                        ResultSet r3 = s3.executeQuery("Select * from supplier");
                                    %>
                                    <select name="supplier" >
                                     <%
                                        while (r3.next()) {
                                    %>
                                        <option><%=r3.getString("sp_name")%></option>
                                    <%}%>
                                    </select>
                                </div>
                                 <div class="input-box">
                                    <span class="txt-details">Price</span>
                                    <input type="text" id="price" value="0.0" name="price" placeholder="ราคา ฿" required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Amount</span>
                                    <input type="text" id="amount" value="0" name="cur_amount" placeholder="จำนวน" required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Discount</span>
                                    <input type="text" id="discount" value="0.0" name="cur_discount" placeholder="ส่วนลด" required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Total Price</span>
                                    <input type="text" id="total_price" value="0.0" name="total_price" placeholder="ราคารวม" required>
                                </div>
                                <div class="input-box">
                                    <span class="txt-details">Date Order</span>
                                    <input type="date" name="date_order" placeholder="yyyy-MM-dd">
                                </div>
                                 <div class="input-box">
                                    <span class="txt-details">Date Sent</span>
                                    <input type="date" name="date_sent" placeholder="yyyy-MM-dd">
                                </div>
                          </div>  
                          <input type="button" onclick="calculate()" class="button" value="Calculate"/>&nbsp;
                          <input type="submit" class="button2" value="Save"/>
                        </form>
                                    
                </div>
            </div>
        </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/alert.js"></script>
    <script src="assets/js/calculate.js"></script>
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>

