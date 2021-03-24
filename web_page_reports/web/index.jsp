<%-- 
    Document   : SalestoDate
    Created on : Nov 7, 2020, 5:48:49 PM
    Author     : Tyler
--%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%  Class.forName("oracle.jdbc.driver.OracleDriver");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales to Date Report</title>
    </head>
    <body>
        <h1>JSP Page connecting to Tyler Hu's Oracle Database... </h1>
        <h2>Fetching Product Line Sales REPORT... </h2>
        
        <%  
            String url = "jdbc:oracle:thin:@129.7.240.3:1521:ORCL";
            
            Connection conn = DriverManager.getConnection(url, "HuT", "HuT#");
            
            Statement statement = conn.createStatement();
            ResultSet resultset = statement.executeQuery("SELECT * FROM ProductLineSalesREPORT");
        %>
        
        <TABLE BORDER="1" BGCOLOR="#f0f0f2" width='35%' cellspacing='1' cellpadding='1' bordercolor="black" border='0'
            <TR>
                <TH bgcolor='#9dc9eb'> <font size='3'/>Product ID</TH>
                <TH bgcolor='#9dc9eb'> <font size='3'/>Product Description</TH>
                <TH bgcolor='#9dc9eb'> <font size='3'/>Total Sales to Date</TH>
            </TR>
            
            <% while (resultset.next()) {%>
            <TR>
                <TD> <font size='3'/><center><%= resultset.getNString(1)%></center></TD>
                <TD> <font size='3'/><center><%= resultset.getNString(2)%></center></TD>
                <TD> <font size='3'/><center><%= resultset.getNString(3)%></center></TD>

            </TR>
            
            <% }%>
            
        </TABLE>
    </body>
</html>
