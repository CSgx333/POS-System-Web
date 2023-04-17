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
        String cur_id = request.getParameter("cur_id");
        String p_id = request.getParameter("p_id");
        String cur_amount = request.getParameter("cur_amount");
        String total_price = request.getParameter("total_price");
        float total_price1 = Float.parseFloat(total_price);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        
         Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
         Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
         String Sqlid4 = "Select * from stock where p_id='"+Integer.parseInt(p_id)+"'";
         ResultSet r4 = s4.executeQuery(Sqlid4);
         r4.next();
         int amount = Integer.parseInt(r4.getString("amount")) - Integer.parseInt(cur_amount);   
         
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
        c1.setAutoCommit(false);        
        String sql = "update warehouse.stock SET amount ="+ amount +
           " WHERE p_id="+Integer.parseInt(p_id);
        PreparedStatement preparedStmt = c1.prepareStatement(sql);
        preparedStmt.executeUpdate();
        c1.commit();
         
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
        String sql2 = "DELETE FROM curorder WHERE cur_id="+cur_id;
        PreparedStatement preparedStmt2 = c2.prepareStatement(sql2);
        c2.setAutoCommit(false);
        preparedStmt2.execute();
        c2.commit();
        
        Connection c3 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
        Statement s3 = c3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet r3 = s3.executeQuery("Select * from budget");
        r3.next();
        float money =  Float.parseFloat(r3.getString("money"));
        money = money + total_price1;
        String sql3 = "update sellingdb.budget SET money ="+ money + " WHERE idBudget="+ 1;
        PreparedStatement preparedStmt3= c3.prepareStatement(sql3);
        preparedStmt3.executeUpdate();
%>
<script>
         setTimeout(function() {
             swal({
                title: "Move to stock successfully.",
                type: "success"
             }, function() {
                 window.location = "http://localhost:8080/WebPOSSystem/MoveToStock.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>