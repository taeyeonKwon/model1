<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%

	String id= request.getParameter("id");
	String pass = request.getParameter("pass");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			conn=ds.getConnection();
			
			pstmt=conn.prepareStatement("SELECT * FROM kmember WHERE id=?");
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			

			if(rs.next()){
				if(pass.equals(rs.getString("passwd"))){
					session.setAttribute("id", id);
					
					out.println("<script>");
					out.println("location.href='boardlist.jsp'");
					out.println("</script>");
				}
			}
			out.println("<script>");
			out.println("location.href='login.jsp'");
			out.println("</script>");			
		
		}catch(Exception e){
				e.printStackTrace();
		}


%>
