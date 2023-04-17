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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        
        String group = request.getParameter("group");
        String id_group = "1";
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "ka9876543210");
        String Sqlid1 = "Select * from productgroup";
        Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r1 = s1.executeQuery(Sqlid1);
        while (r1.next()) {
            if (group.equals(r1.getString("g_name"))){
                 id_group = r1.getString("g_id");
            }
        }
        
        String subgroup = request.getParameter("subgroup");
        String id_subgroup = "1";
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "ka9876543210");
        String Sqlid2 = "Select * from subgroup";
        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r2 = s2.executeQuery(Sqlid2);
        while (r2.next()) {
            if (subgroup.equals(r2.getString("s_name"))){
                 id_subgroup = r2.getString("s_id");
            }
        }
        
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
        String image = request.getParameter("image");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/goods?useSSL=false","root", "ka9876543210");
        String sql="Insert into product(p_id,p_name,g_id,sp_id,s_id,price,image) values('"+id+"','"+name+"','"+id_group+"','"+id_supplier+"','"+id_subgroup+"','"+price+"','"+image+"')";
        Statement s = c.createStatement();
        s.execute(sql);
%>
<script>
         setTimeout(function() {
             swal({
                title: "Save successfully.",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/AddProduct.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>