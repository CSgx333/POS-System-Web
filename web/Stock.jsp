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
                
                 <h2>Stock</h2>

                 
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
                        <h2>All Stock</h2>
                        <form method="post" action="Stock.jsp">
                            <div class="search">
                                    <label>
                                       <input type="text" name="id" placeholder="Search id . . .">
                                       <ion-icon name="search-outline"></ion-icon>
                                   </label>
                            </div>
                        </form>
                        <div class="setButton">
                                <a href="MoveToStock.jsp" class="btn2">Move To Stock</a>
                        </div>
                    </div>
                 
                    
                    <%
                        String id = request.getParameter("id");    
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
                        Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String Sqlid = "Select * from stock";
                        if(id != null){
                             Sqlid = "Select * from stock where st_id='"+Integer.parseInt(id)+"'";
                        };
                        ResultSet r = s.executeQuery(Sqlid);
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Stock ID</td>
                                <td>Name</td>
                                <td>Unit</td>
                                <td>Supplier</td>
                                <td>Price</td>
                                <td>Amount</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r.next()) {
                    %>
                            <tr>
                                <td><%=r.getString("st_id")%></td>
                                <td><%=r.getString("p_name")%></td>
                                <td><span class="status pending"><%=r.getString("id_unit")%></span></td>
                                   <%
                                            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false", "root", "ka9876543210");
                                            Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid3 = "Select * from supplier where sp_id='"+Integer.parseInt(r.getString("sp_id"))+"'";
                                            ResultSet r3 = s3.executeQuery(Sqlid3);
                                            while (r3.next()) {
                                   %>
                                                 <td><%=r3.getString("sp_name")%></td>
                                   <%
                                     }
                                   %>
                                <td><%=r.getString("price")%></td>
                                <td><%=r.getString("amount")%></td>
                            </tr>
                    <%
                      }
                        s.close();
                        r.close();
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
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>

