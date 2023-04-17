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
                    <a href="Admin.jsp">
                        <span class="icon">
                            <ion-icon name="person-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Admin</span>
                    </a>
                </li>
                               
                <li>
                    <a href="History.jsp">
                        <span class="icon">
                            <ion-icon name="document-text-outline"></ion-icon>
                        </span>
                        <span class="title">History</span>
                    </a>
                </li>
                
                <li>
                    <a href="Expense.jsp">
                        <span class="icon">
                              <ion-icon name="cash-outline"></ion-icon>
                        </span>
                        <span class="title">Expense</span>
                    </a>
                </li>

                <li>
                    <a href="Person.jsp">
                        <span class="icon">
                              <ion-icon name="people-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Person</span>
                    </a>
                </li>
                
                 <li>
                    <a href="Supplier.jsp">
                        <span class="icon">
                              <ion-icon name="cube-outline"></ion-icon>
                        </span>
                        <span class="title">Supplier</span>
                    </a>
                </li>
                
                 <li>
                    <a href="Promotion.jsp">
                        <span class="icon">
                              <ion-icon name="pricetag-outline"></ion-icon>
                        </span>
                        <span class="title">Promotion</span>
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
                
                 <h2>Admin</h2>

                 
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
                            ResultSet r = s.executeQuery("Select * from dailysale");
                            int rec=0;
                            while(r.next()){
                                rec++;
                            };
                            int count=0;
                            r.first();                     
                            count++;
                            while (r.next()){ 
                               count++;
                            };
                        %>
                        <div class="numbers"><%=count%></div>
                        <%
                        %>
                        <div class="cardName">History</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="document-text-outline"></ion-icon>
                    </div>
                </div>
                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                            Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r1 = s1.executeQuery("Select * from promotion");
                            int rec1=0;
                            while(r1.next()){
                                rec1++;
                            };
                            int count1=0;
                            r1.first();                     
                            count1++;
                            while (r1.next()){ 
                               count1++;
                            };
                        %>
                        <div class="numbers"><%=count1%></div>
                        <%
                        %>
                        <div class="cardName">Promotion</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="pricetag-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                            Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r2 = s2.executeQuery("Select * from suborder");
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
                        <div class="cardName">Order Supplier</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="cube-outline"></ion-icon>
                    </div>
                </div>

                <div class="card">
                    <div>
                         <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
                            Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet r3 = s3.executeQuery("Select * from stock");
                            rec=0;
                            while(r3.next()){
                                rec++;
                            }
                            int amount = 0;
                            r3.first();                     
                            amount = amount + Integer.parseInt(r3.getString("amount"));
                            while (r3.next()){ 
                               amount = amount + Integer.parseInt(r3.getString("amount"));
                            }
                        %>
                        <div class="numbers"><%=amount%></div>
                        <%
                        %>
                        <div class="cardName">Number of product in stock</div>
                    </div>

                    <div class="iconBx">
                        <ion-icon name="file-tray-stacked-outline"></ion-icon>
                    </div>
                </div>

          
            </div>

            <!-- ================ Order Details List ================= -->
            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Orders Supplier</h2>
                        <a href="Order.jsp" class="btn">View All</a>
                    </div>
                  <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                        Statement s4 = c4.createStatement();
                        ResultSet r4 = s4.executeQuery("Select * from suborder");
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Product ID</td>
                                <td>Name</td>
                                <td>Supplier</td>
                                <td>Price</td>
                                <td>Amount</td>
                                <td>Total Price</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r4.next()) {
                    %>
                            <tr>
                                <td><%=r4.getString("p_id")%></td>
                                <td><%=r4.getString("p_name")%></span></td>
                                <%
                                            Connection c6 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                            Statement s6 = c6.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid6 = "Select * from supplier where sp_id='"+Integer.parseInt(r4.getString("sp_id"))+"'";
                                            ResultSet r6 = s6.executeQuery(Sqlid6);
                                            while (r6.next()) {
                                %>
                                                 <td><%=r6.getString("sp_name")%></td>
                                <%
                                     }
                                %>

                                <td><%=r4.getString("price")%></td>
                                <td><%=r4.getString("amount")%></td>
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
                        <h2>Expense</h2>
                    </div>
                   <%
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                        Statement s5 = c5.createStatement();
                        ResultSet r5 = s5.executeQuery("Select * from expense");
                    %>
                    <table>
                     <%
                        while (r5.next()) {
                    %>
                        <tr>
                            <td width="60px">
                                <div class="imgBx"><img src="assets/imgs/credit-card.png" alt=""></div>
                            </td>
                            <td>
                                <h4><%=r5.getString("e_name")%> <br> <span><%=r5.getString("price")%></span></h4>
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

