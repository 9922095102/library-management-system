<%-- 
    Document   : admin_login
    Created on : 19 Jan, 2024, 7:50:49 PM
    Author     : abhis
--%>

    <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.ResultSet"%>
            <%@page import="java.sql.Statement"%>
                <%@page import="java.sql.Connection"%>
                    <%@page contentType="text/html" pageEncoding="UTF-8"%>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                            <title>admin login page</title>
                        </head>

                        <body>
                            <%
         String usernm=request.getParameter("n1");
         String pass=request.getParameter("n2");
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
         Statement stmt=con.createStatement();
         ResultSet rs=stmt.executeQuery("select * from admin_library where USERNAME ='"+usernm+"' and PASSWORD='"+pass+"'");
         if(rs.next())
         {
         response.sendRedirect("admin_main_page.html");
         }
         else
         {
         out.println("<h1>invalid username or password<a href='admin_login.html'>back to login page</a></h1>");
         }
        %>
                        </body>

                        </html>