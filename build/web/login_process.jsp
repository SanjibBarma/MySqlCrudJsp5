<%-- 
    Document   : login_process
    Created on : Mar 18, 2018, 4:15:29 AM
    Author     : User
--%>

<%@ page import ="java.sql.*" %>
<%
    String name = request.getParameter("name");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_data",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from register where name='" + name + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("name", name);
        out.println("welcome " + name);
        //out.println("<a href='logout.jsp'>Log out</a>");
        //response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
