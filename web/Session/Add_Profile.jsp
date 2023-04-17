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
        String id = request.getParameter("pro_id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String role = request.getParameter("role");
        
        String graduate = request.getParameter("graduate");
        String id_graduate = "1";
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "ka9876543210");
        String Sqlid3 = "Select * from graduate";
        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r3 = s3.executeQuery(Sqlid3);
        while (r3.next()) {
            if (graduate.equals(r3.getString("name"))){
                 id_graduate = r3.getString("id");
            }
        }
        
        String aumpher = request.getParameter("aumpher");
        String id_aumpher = "1";
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "ka9876543210");
        String Sqlid2 = "Select * from aumpher";
        Statement s2 = c2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r2 = s2.executeQuery(Sqlid2);
        while (r2.next()) {
            if (aumpher.equals(r2.getString("name"))){
                 id_aumpher = r2.getString("id");
            }
        }

        String title = request.getParameter("title");
        String id_title = "1";
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "ka9876543210");
        String Sqlid1 = "Select * from firstname";
        Statement s1 = c1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r1 = s1.executeQuery(Sqlid1);
        while (r1.next()) {
            if (title.equals(r1.getString("name"))){
                 id_title = r1.getString("id");
            }
        }
        
        String province = request.getParameter("province");
        String id_province = "1";
        Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "ka9876543210");
        String Sqlid4 = "Select * from province";
        Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r4 = s4.executeQuery(Sqlid4);
        while (r4.next()) {
            if (province.equals(r4.getString("name"))){
                 id_province = r4.getString("id");
            }
        }
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/personel?useSSL=false","root", "ka9876543210");
        String sql="Insert into profile(id,fname,lname,email,tel,role,id_aumpher,id_graduate,id_title,id_province) values('"+id
                +"','"+fname+"','"+lname+"','"+email+"','"+tel+"','"+role+"','"+id_aumpher+"','"+id_graduate+"','"+id_title+"','"+id_province+"')";
        Statement s = c.createStatement();
        s.execute(sql);
%>
<script>
         setTimeout(function() {
             swal({
                title: "Save successfully.",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/AddProfile.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>