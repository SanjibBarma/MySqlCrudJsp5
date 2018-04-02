<%-- 
    Document   : index
    Created on : Mar 16, 2018, 5:26:54 PM
    Author     : User
--%>

<%--
<%@ page import="com.Connect.DBConnect"%>
<%@ page import="com.Connect.Main"%>
--%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="insert.jsp" method="POST" onsubmit="redirect(this);" style="padding: 50px;" >
            <table border="0">
                <tbody>
                    <tr>
                        <td>Name: </td>
                        <td><input type="text" name="name" value="" required/></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="email" value="" required /></td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td><input type="password" name="password" value="" required /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" name="submit" value="Submit" />
        </form>

        <%
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "jsp_data";
            String userid = "root";
            String password = "";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            Blob image = null;
            byte[ ] imgData = null ;
        %>


        <table border="1">
            <h3>Data Receiving from Database...</h3>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <td>Action</td>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                        statement = connection.createStatement();
                        String sql = "select * from register";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>
                <tr>
                    <td><%=resultSet.getString("name")%></td>
                    <td><%=resultSet.getString("email")%></td>
                    <td><%=resultSet.getString("password")%></td>
                    <td><a href="update.jsp?id=<%=resultSet.getString("id")%>">Update</a> || 
                        <a href="delete.jsp?id=<%=resultSet.getString("id")%>">Delete</a>
                    </td>

                </tr>
                <%
                        }
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
            
            
        <table border="1">
            <h3>Data Receiving For Uploaded File...</h3>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                        statement = connection.createStatement();
                        String sql = "select * from contacts";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {
                %>
                <tr>
                    <td><%=resultSet.getString("first_name")%></td>
                    <td><%=resultSet.getString("last_name")%></td>
                    <td><% image = resultSet.getBlob(1);
imgData = image.getBytes(1,(int)image.length()); %></td>
                    </td>

                </tr>
                <%
                        }
                        connection.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

            <a href="login.jsp">LogIn here</a>
            <a href="Upload.jsp">Upload</a>
    </body>
</html>
