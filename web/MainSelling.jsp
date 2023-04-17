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
                
                 <h2>Selling</h2>

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
                        <h2>Main Selling</h2>
                        <p id="datetime"></p>
                    </div>
                 
                    
                        <form method="post" action="Session/Add_Selling.jsp">
                                    <div class="user-details">
                                        
                                            <div class="input-box">
                                                <span class="txt-details">Product ID</span>
                                                <input type="text" id="p_id" name="p_id" placeholder="รหัสสินค้า" required>
                                            </div>
                                        
                                            <div class="input-box">
                                                <span class="txt-details">Product Name</span>
                                                <%
                                                    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();;
                                                    Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                                    Statement s2 = c2.createStatement();
                                                    ResultSet r2 = s2.executeQuery("Select * from product");
                                                %>
                                                <select id="p_name" name="p_name" >
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
                                                <select id="id_unit" name="id_unit" >
                                                 <%
                                                    while (r2.next()) {
                                                %>
                                                    <option><%=r2.getString("name_unit")%></option>
                                                <%}%>
                                                </select>
                                            </div>
                                                
                                            <div class="input-box">
                                               <span class="txt-details">Price</span>
                                               <input type="text" id="price" value="0.0" name="price" placeholder="ราคา ฿" required>
                                            </div>
                                                
                                            <div class="input-box">
                                                <span class="txt-details">Amount</span>
                                                <input type="text" id="amount" value="0" name="amount" placeholder="จำนวน" required>
                                            </div>
                                                
                                            <div class="input-box">
                                                <span class="txt-details">Discount</span>
                                                <input type="text" id="discount" value="0.0" name="discount" placeholder="ส่วนลด" required>
                                            </div>
                                                
                                            <div class="input-box">
                                                <span class="txt-details">Total Price</span>
                                                <input type="text" id="total_price" value="0.0" name="total_price" placeholder="ราคารวม" required>
                                            </div>
                                                
                                    </div>  
                          <input type="button" onclick="calculate()" class="button" value="Calculate"/>&nbsp;
                          <input type="submit"  class="button2" value="Move To Order"/>
                        </form>
                        
                    <div class="padding"></div>
                        
                    <div class="cardHeader">
                        <h2>New Order Selling</h2>
                    </div>
                 
                   <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c3= DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String Sqlid3 = "Select * from savesale";
                        ResultSet r3 = s3.executeQuery(Sqlid3);
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Selling ID</td>
                                <td>Product ID</td>
                                <td>Product Name</td>
                                <td>Unit</td>
                                <td>Price</td>
                                <td>Amount</td>
                                <td>Discount</td>
                                <td>Total Price</td>
                                <td>Buy</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r3.next()) {
                    %>  
                            <form method="post" action="Session/Buy.jsp">
                                <tr>
                                    <td><input hidden type="text" name="d_id" value="<%=r3.getString("d_id")%>"><%=r3.getString("d_id")%></td>
                                    <td><input hidden type="text" name="p_id" value="<%=r3.getString("p_id")%>"><%=r3.getString("p_id")%></td>
                                    <td><input hidden type="text" name="p_name" value="<%=r3.getString("p_name")%>"><%=r3.getString("p_name")%></td>
                                    <td><input hidden type="text" name="id_unit" value="<%=r3.getString("id_unit")%>"><span class="status pending"><%=r3.getString("id_unit")%></span></td>
                                    <td><input hidden type="text" name="price" value="<%=r3.getString("price")%>"><%=r3.getString("price")%></td>
                                    <td><input hidden type="text" name="amount" value="<%=r3.getString("amount")%>"><%=r3.getString("amount")%></td>
                                    <td><input hidden type="text" name="discount" value="<%=r3.getString("discount")%>"><%=r3.getString("discount")%></td>
                                    <td><input hidden type="text" name="total_price" value="<%=r3.getString("total_price")%>"><%=r3.getString("total_price")%></td>
                                    <td><input type="submit" class="button3" value="Move"></input></td>
                                </tr>
                            </form>

                    <%
                      }
                        s3.close();
                        r3.close();
                    %>
                        </tbody>
                    </table>
                        
                </div>
            </div>
        </div>
    </div>

    <!-- =========== Scripts =========  -->
    <script src="assets/js/main.js"></script>
    <script src="assets/js/alert.js"></script>
    <script src="assets/js/calculate.js"></script>
    <script src="assets/js/DateTime.js"></script>
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>

