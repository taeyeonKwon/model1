<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "kwon_bean2.QnaDBBean" %> 
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  QnaDBBean dbPro = QnaDBBean.getInstance();
  int check = dbPro.deleteArticle(num, passwd);
  
  if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=boardlist3.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
       <script>      
       <!--      
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
       -->
      </script>
<%
    }
 %>