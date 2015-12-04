<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="registBean" class="kwon_bean.registBean" scope="page"/>
<jsp:setProperty name="registBean" property="*"/>
<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		System.out.println(registBean);
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			conn=ds.getConnection();
			
			pstmt=conn.prepareStatement("INSERT INTO registkmember VALUES(?,?,?,?,?,?)");
			pstmt.setString(1,registBean.getId());
			pstmt.setString(2,registBean.getPasswd());
			pstmt.setString(3,registBean.getName());
			pstmt.setString(4,registBean.getSex());
			pstmt.setString(5,registBean.getEmail());
			pstmt.setString(6,registBean.getMobile());
			
			
			int result=pstmt.executeUpdate();
		
		if(result!=0){
			out.println("<script>");
			out.println("location.href='./boardlist.jsp'");
			out.println("</script>");		
		}else{
		out.println("<script>");
		out.println("location.href=registForm.html");
		out.println("</script>");		
	}
		}catch (Exception e){
		e.printStackTrace();
	}
		
		
	%>