<%-- 
    Document   : logout
    Created on : 13-May-2016, 10:25:48
    Author     : ComSCIv3400
--%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<% 
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String d_id = request.getParameter("d_id");
        String p_id = request.getParameter("p_id");
        String p_name = request.getParameter("p_name");
        String id_unit = request.getParameter("id_unit");
        String price = request.getParameter("price");
        String d_amount = request.getParameter("amount");
        String discount = request.getParameter("discount");
        String total_price = request.getParameter("total_price"); 
        String date_sale = "2023-01-01 00:00:00";
        String emp_name = request.getParameter("username");
        String id_emp = request.getParameter("userid");
        float total_price1 = Float.parseFloat(total_price);
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection c5 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false","root", "ka9876543210");
        String sql5="Insert into dailysale(p_id,p_name,id_unit,price,amount,total_price,discount,date_sale,id_emp,emp_name) values('"+p_id
                +"','"+p_name+"','"+id_unit+"','"+price+"','"+d_amount+"','"+total_price+"','"+discount+"','"+date_sale+"','"+id_emp+"','"+emp_name+"')";
        Statement s5 = c5.createStatement();
        s5.execute(sql5);
        
         Connection c4 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
         Statement s4 = c4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
         String Sqlid4 = "Select * from stock where p_id='"+Integer.parseInt(p_id)+"'";
         ResultSet r4 = s4.executeQuery(Sqlid4);
         r4.next();
         int amount = Integer.parseInt(r4.getString("amount")) - Integer.parseInt(d_amount);   
         
        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/warehouse?useSSL=false", "root", "ka9876543210");
        c1.setAutoCommit(false);        
        String sql = "update warehouse.stock SET amount ="+ amount +
           " WHERE p_id="+Integer.parseInt(p_id);
        PreparedStatement preparedStmt = c1.prepareStatement(sql);
        preparedStmt.executeUpdate();
        c1.commit();
         
        Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/sellingdb?useSSL=false", "root", "ka9876543210");
        String sql2 = "DELETE FROM savesale WHERE d_id="+d_id;
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
                 window.location = "http://localhost:8080/WebPOSSystem/MainSelling.jsp";
             });
         }, 100);
</script>

<script src="assets/js/alert.js"></script>