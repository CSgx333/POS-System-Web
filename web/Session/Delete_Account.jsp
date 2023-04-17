<%-- 
    Document   : logout
    Created on : 13-May-2016, 10:25:48
    Author     : ComSCIv3400
--%>
<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<% 
        String id = request.getParameter("id");    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/logindb?useSSL=false", "root", "ka9876543210");
        Statement s = c.createStatement();
        String sql="DELETE FROM user WHERE id="+Integer.parseInt(id); 
        s.execute(sql); 
%>
<script>
         setTimeout(function() {
             swal({
                title: "Delete successfully.",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/Person.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>