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
    <link rel="stylesheet" href="style.css">
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
                    <a href="Admin.jsp" >
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
                
                 <h2>Home</h2>

                 
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

            <!-- ======================= Cards ================== -->
            <div class="cardBox">
                
                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                            Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r = s.executeQuery("Select * from budget");
                            r.next();
                        %>
                        <div class="numbers"><%=r.getString("money")%></div>
                        <%
                        %>
                        <div class="cardName">Money</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="cash-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                            Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r1 = s1.executeQuery("Select * from product");
                            int rec=0;
                            while(r1.next()){
                                rec++;
                            };
                            int count=0;
                            r1.first();                     
                            count++;
                            while (r1.next()){ 
                               count++;
                            };
                        %>
                        <div class="numbers"><%=count%></div>
                        <%
                        %>
                        <div class="cardName">Product</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="logo-dropbox"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
                            Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r2 = s2.executeQuery("Select * from curorder");
                            rec=0;
                            while(r2.next()){
                                rec++;
                            };
                            float  price = 0;
                            r2.first();                     
                            price = price + Float.parseFloat(r2.getString("total_price"));
                            while (r2.next()){ 
                               price = price + Float.parseFloat(r2.getString("total_price"));
                            };
                        %>
                        <div class="numbers"><%=price%></div>
                        <%
                        %>
                        <div class="cardName">Sales</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="cart-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                            Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r3 = s3.executeQuery("Select * from expense");
                            rec=0;
                            while(r3.next()){
                                rec++;
                            }
                            price = 0;
                            r3.first();                     
                            price = price + Float.parseFloat(r3.getString("price"));
                            while (r3.next()){ 
                               price = price + Float.parseFloat(r3.getString("price"));
                            }
                        %>
                        <div class="numbers"><%=price%></div>
                        <%
                        %>
                        <div class="cardName">Comments</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="remove-circle-outline"></ion-icon>
                    </div>
                </div>

          
            </div>

            <!-- ================ Order Details List ================= -->
            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Orders</h2>
                        <a href="Order.jsp" class="btn">View All</a>
                    </div>
                  <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
                        Statement s4 = c4.createStatement();
                        ResultSet r4 = s4.executeQuery("Select * from curorder");
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Unit</td>
                                <td>Price</td>
                                <td>Amount</td>
                                <td>Discount</td>
                                <td>Total Price</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r4.next()) {
                    %>
                            <tr>
                                <td><%=r4.getString("p_name")%></td>
                                <td><span class="status pending"><%=r4.getString("id_unit")%></span></td>
                                <td><%=r4.getString("price")%></td>
                                <td><%=r4.getString("cur_amount")%></td>
                                <td><%=r4.getString("cur_discount")%></td>
                                <td><%=r4.getString("total_price")%></td>
                            </tr>
                    <%
                      }
                        s4.close();
                        r4.close();
                    %>
                        </tbody>
                    </table>
                </div>

                <!-- ================= New Customers ================ -->
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Person</h2>
                    </div>
                   <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/logindb?useSSL=false", "root", "ka9876543210");
                        Statement s5 = c5.createStatement();
                        ResultSet r5 = s5.executeQuery("Select * from user");
                    %>
                    <table>
                     <%
                        while (r5.next()) {
                    %>
                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="assets/imgs/account2.jpg" alt=""></div>
                            </td>
                            <td>
                                <h4><%=r5.getString("uname")%> <br> <span><%=r5.getString("id")%></span></h4>
                            </td>
                        </tr>
                    <%
                      }
                        s5.close();
                        r5.close();
                    %>
                    </table>
                    
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

