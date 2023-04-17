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
                
                 <h2>Person</h2>

                 
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
                        <h2>Account</h2>
                        <form method="post" action="Person.jsp">
                            <div class="search">
                                    <label>
                                       <input type="text" name="id1" placeholder="Search id . . .">
                                       <ion-icon name="search-outline"></ion-icon>
                                   </label>
                            </div>
                        </form>
                         <a href="AddAccount.jsp" class="btn2">Add Account</a>
                    </div>
                 
                    
                    <%
                        String id1 = request.getParameter("id1");    
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/logindb?useSSL=false", "root", "ka9876543210");
                        Statement s = c.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String Sqlid = "Select * from user";
                        if(id1 != null){
                             Sqlid = "Select * from user where id='"+Integer.parseInt(id1)+"'";
                        };
                        ResultSet r = s.executeQuery(Sqlid);
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Account ID</td>
                                <td>Username</td>
                                <td>Password</td>
                                <td>Delete</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r.next()) {
                    %>
                            <form method="post" action="Session/Delete_Account.jsp">
                                <tr>
                                    <td><input hidden type="text" name="id" value="<%=r.getString("id")%>"><%=r.getString("id")%></td>
                                    <td><%=r.getString("uname")%></td>
                                    <td><%=r.getString("password")%></td>
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
                        
                    <div class="padding"></div>
                    
                    <div class="cardHeader">
                        <h2>Profile</h2>
                        <form method="post" action="Person.jsp">
                            <div class="search">
                                    <label>
                                       <input type="text" name="id2" placeholder="Search id . . .">
                                       <ion-icon name="search-outline"></ion-icon>
                                   </label>
                            </div>
                        </form>
                         <a href="AddProfile.jsp" class="btn2">Add Profile</a>
                    </div>
                 
                    
                    <%
                        String id2 = request.getParameter("id2");    
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false", "root", "ka9876543210");
                        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        String Sqlid2 = "Select * from profile";
                        if(id2 != null){
                             Sqlid2 = "Select * from profile where id='"+Integer.parseInt(id2)+"'";
                        };
                        ResultSet r2 = s2.executeQuery(Sqlid2);
                    %>
                    <table>
                        <thead>
                            <tr>
                                <td>Profile ID</td>
                                <td>First Name</td>
                                <td>Last Name</td>
                                <td>Title</td>
                                <td>Email</td>
                                <td>Tel</td>
                                <td>Role</td>
                                <td>Aumpher</td>
                                <td>Province</td>
                                <td>Graduate</td>
                                <td>Delete</td>
                            </tr>
                        </thead>
                        <tbody>
                    <%
                        while (r2.next()) {
                    %>
                    
                                <form method="post" action="Session/Delete_Profile.jsp">
                                    <tr>
                                        <td><input hidden type="text" name="id2" value="<%=r2.getString("id")%>"><%=r2.getString("id")%></td>
                                        <td><%=r2.getString("fname")%></td>
                                        <td><%=r2.getString("lname")%></td>
                                        <%
                                            Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false", "root", "ka9876543210");
                                            Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid3 = "Select * from firstname where id='"+Integer.parseInt(r2.getString("id_title"))+"'";
                                            ResultSet r3 = s3.executeQuery(Sqlid3);
                                            while (r3.next()) {
                                        %>
                                                 <td><%=r3.getString("name")%></td>
                                        <%
                                         }
                                       %>
                                        <td><%=r2.getString("email")%></td>
                                        <td><%=r2.getString("tel")%></td>
                                        <td><%=r2.getString("role")%></td>
                                        <%
                                            Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false", "root", "ka9876543210");
                                            Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid4 = "Select * from aumpher where id='"+Integer.parseInt(r2.getString("id_aumpher"))+"'";
                                            ResultSet r4 = s4.executeQuery(Sqlid4);
                                            while (r4.next()) {
                                        %>
                                                 <td><%=r4.getString("name")%></td>
                                        <%
                                         }
                                       %>
                                       
                                       <%
                                            Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false", "root", "ka9876543210");
                                            Statement s5 = c5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid5 = "Select * from province where id='"+Integer.parseInt(r2.getString("id_province"))+"'";
                                            ResultSet r5 = s5.executeQuery(Sqlid5);
                                            while (r5.next()) {
                                        %>
                                                 <td><%=r5.getString("name")%></td>
                                        <%
                                         }
                                       %>
                                       
                                        <%
                                            Connection c6 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false", "root", "ka9876543210");
                                            Statement s6 = c6.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            String Sqlid6 = "Select * from graduate where id='"+Integer.parseInt(r2.getString("id_graduate"))+"'";
                                            ResultSet r6 = s6.executeQuery(Sqlid6);
                                            while (r6.next()) {
                                        %>
                                                 <td><%=r6.getString("name")%></td>
                                        <%
                                         }
                                       %>
                                        <td><input type="submit" class="button3" value="Delete"></input></td>
                                    </tr>
                                </form>

                    <%
                      }
                        s2.close();
                        r2.close();
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

