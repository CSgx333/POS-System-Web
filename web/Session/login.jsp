<%-- 
    Document   : login
    Created on : 13-May-2016, 09:47:50
    Author     : ComSCIv3400
--%>

<%@ page import ="java.sql.*" %>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/logindb?useSSL=false",
            "root", "ka9876543210");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where uname='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        session.setAttribute("id", rs.getString("id"));
        response.sendRedirect("../Home.jsp");
    } else {
%>
<script >
         setTimeout(function() {
             swal({
                title: "Invalid password Try again.",
                type: "error"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/index.html";
             });
         }, 100);
</script>
<%
  }
%>

<script src="assets/js/alert.js"></script>