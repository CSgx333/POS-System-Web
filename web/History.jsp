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
                
                 <h2>History</h2>

                 
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
                        <h2>Order History</h2>
                        <form method="post" action="History.jsp">
                            <div class="search">
                                    <label>
                                       <input type="text" name="id" placeholder="Search id . . .">
                                       <ion-icon name="search-outline"></ion-icon>
                                   </label>
                            </div>
                        </form>
                    </div>
                 
                    
                    <%
                        String id = request.getParameter("id");    
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
                        Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String Sqlid = "Select * from dailysale";
                        if(id != null){
                             Sqlid = "Select * from dailysale where d_id='"+Integer.parseInt(id)+"'";
                        };
                        ResultSet r = s.executeQuery(Sqlid);
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Order ID</td>
                                <td>Name</td>
                                <td>Unit</td>
                                <td>Price</td>
                                <td>Amount</td>
                                <td>Discount</td>
                                <td>Total Price</td>
                                <td>Date Sale</td>
                                <td>ID Emp</td>
                                <td>Emp Name</td>
                                <td>Delete</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r.next()) {
                    %>
                            <form method="post" action="Session/Delete_History.jsp">
                                <tr>
                                    <td><input hidden type="text" name="d_id" value="<%=r.getString("d_id")%>"><%=r.getString("d_id")%></td>
                                    <td><%=r.getString("p_name")%></td>
                                    <td><span class="status pending"><%=r.getString("id_unit")%></span></td>
                                    <td><%=r.getString("price")%></td>
                                    <td><%=r.getString("amount")%></td>
                                    <td><%=r.getString("discount")%></td>
                                    <td><%=r.getString("total_price")%></td>
                                    <td><%=r.getString("date_sale")%></td>
                                    <td><%=r.getString("id_emp")%></td>
                                    <td><%=r.getString("emp_name")%></td>
                                    <td><input type="submit" class="button3" value="Delete"></input></td>
                                </tr>
                            </form>

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

