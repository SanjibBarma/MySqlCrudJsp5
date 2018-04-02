<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/jsp_data";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String id = request.getParameter("id");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String pass=request.getParameter("password");
    if(id != null){
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(id);
        
        try{
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update register set id=?,name=?,email=?,password=? where id="+id;
            ps = con.prepareStatement(sql);
            ps.setString(1,id);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, pass);
            int i = ps.executeUpdate();
            if(i > 0){
            //out.print("Record Updated Successfully");
                response.sendRedirect("index.jsp");
            }else{
                out.print("There is a problem in updating Record.");
            } 
        }catch(SQLException sql){
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>