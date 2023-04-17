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
        String sub_id = request.getParameter("sub_id");
        String p_id = request.getParameter("p_id");
        String p_name = request.getParameter("p_name");
        
        String supplier = request.getParameter("supplier");
        String id_supplier = "1";
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "ka9876543210");
        String Sqlid3 = "Select * from supplier";
        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r3 = s3.executeQuery(Sqlid3);
        while (r3.next()) {
            if (supplier.equals(r3.getString("sp_name"))){
                 id_supplier = r3.getString("sp_id");
            }
        }
        String price = request.getParameter("price");
        String amount = request.getParameter("amount");
        String total_price = request.getParameter("total_price");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false","root", "ka9876543210");
        String sql="Insert into suborder(sub_id,p_id,p_name,sp_id,price,amount,total_price) values('"+sub_id
                +"','"+p_id+"','"+p_name+"','"+id_supplier+"','"+price+"','"+amount+"','"+total_price+"')";
        Statement s = c.createStatement();
        s.execute(sql);
%>
<script>
         setTimeout(function() {
             swal({
                title: "Save successfully.",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/AddSubOrder.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>