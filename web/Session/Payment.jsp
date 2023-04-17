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
        String e_id = request.getParameter("e_id");
        String price = request.getParameter("price");
        float price1 = Float.parseFloat(price);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
         
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
        String sql2 = "DELETE FROM expense WHERE e_id="+e_id;
        PreparedStatement preparedStmt2 = c2.prepareStatement(sql2);
        c2.setAutoCommit(false);
        preparedStmt2.execute();
        c2.commit();
        
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r3 = s3.executeQuery("Select * from budget");
        r3.next();
        float money =  Float.parseFloat(r3.getString("money"));
        money = money - price1;
        String sql3 = "update sellingdb.budget SET money ="+ money + " WHERE idBudget="+ 1;
        PreparedStatement preparedStmt3= c3.prepareStatement(sql3);
        preparedStmt3.executeUpdate();
%>
<script>
         setTimeout(function() {
             swal({
                title: "Payment Completed !",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/Expense.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>