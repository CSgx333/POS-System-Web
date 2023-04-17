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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String pm_id = request.getParameter("pm_id");
        String pm_name = request.getParameter("pm_name");
        String discount = request.getParameter("discount");
        String date_time = request.getParameter("date_time");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "ka9876543210");
        String sql="Insert into promotion(pm_id,pm_name,discount,date_time) values('"+pm_id+"','"+pm_name+"','"+discount+"','"+date_time+"')";
        Statement s = c.createStatement();
        s.execute(sql);
%>
<script>
         setTimeout(function() {
             swal({
                title: "Save successfully.",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/AddPromotion.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>