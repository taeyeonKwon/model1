
 
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="kwon_bean2.QnaDBBean"%>
<%@ page import="kwon_bean2.QnaDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("utf-8"); %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
         <script type="text/javascript" src="./js/HuskyEZCreator.js" charset="utf-8"></script>
        <title>WriteFrom- Business Casual - Start Bootstrap Theme</title>
        <!-- Bootstrap
        Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
       
        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">
        <!-- Fonts -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
        queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file://
        -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
<%

	int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
   try{
	   QnaDBBean dbPro = QnaDBBean.getInstance();
      String boardId = request.getParameter("boardId");
      if(boardId==null||boardId.equals("null")||boardId.equals("")){
   	   boardId="1";
      }
      QnaDataBean article = dbPro.getArticle(num);
      boardId=article.getBoardId();
      int ref = article.getRef();      int re_step = article.getRe_step();
      int re_level = article.getRe_level();
%>





	<body>
	<div class="brand">Kwon baking school</div>
	<div class="address-bar">3481 Eunpyeong Place | Yeok Mal st.,
		902-10 | 123.456.7890</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					
					<div class="modal fade" id="login">
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- Navigation
        -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- navbar-brand is hidden on larger screens, but visible when the menu
                    is collapsed -->
                    <a class="navbar-brand" href="index.html">Business Casual</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.html">Baking Academy</a>
                        </li>
                        <li>
                            <a href="about.html">About</a>
                        </li>
                        <li>
                            <a href="blog.html">blog</a>
                        </li>
                        <li>
                            <a href="classinfo.html">Class info</a>
                        </li>
                        <li>
                            <a href="boardlist.jsp">Board</a>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <div class="container">
            <div class="row">
                <div class="box" align="center">
                    <div class="row">
                   
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>글보기 내용</h3>
                                    <p><br/></p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-key"></i>
                                </div>
                            </div>

	                            <div class="form-bottom">
	                                <form nrole="form"  class="form-horizontal">
	                               
	                                  <div class="form-group">
	                                   <table class="table table-striped" >
											<tr height="30">
												<td><div align="center" width="125">글번호</div></td>
												<td><div align="center" ><%=article.getNum() %></div></td>
												<td><div align="center" width="125">조회수</div></td>
												<td><div align="center"><%=article.getReadcount() %></div></td>
											</tr> 
												
											<tr height="30">
												<td><div align="center" width="125">작성자</div></td>
												<td><div align="center"><%=article.getWriter() %></div></td>
												<td><div align="center" width="125">글제목</div></td>
												<td><div align="center" width="375" colspan="3"><%=article.getSubject() %></div></td>
											</tr>
											
											<tr height="30">
												<td align="center" width="125">글내용</td>
												<td align="center" class="col-xs-9" width="375" colspan="3"><pre><%=article.getContent() %></pre></td>
												</tr>
											<tr height="30">
														<td colspan="4" align="right">
															<input type="button" class="btn btn-default" value="답글쓰기" Onclick="document.location.href='writeForm3.jsp?num=<%=num %>&ref=<%=ref %>&re_step=<%=re_step %>&re_level=<%=re_level %>&pageNum=<%=pageNum %>&boardId=<%=boardId%>'">
															<input type="button" class="btn btn-default" value="글수정" onclick="document.location.href='update3.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="button" class="btn btn-default" value="글삭제" onclick="document.location.href='deleteForm3.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="button" class="btn btn-default" value="글목록" onclick="document.location.href='boardlist3.jsp?num=<%=article.getNum()%>&pageNum<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
															
														</td>
													</tr>		
										</table>
										
	                                    <p><br></p>
	                                </form>
	                                
						</div>				
	                            </div>
                        </div>
                    </div>
                   
                    <div class="clearfix"></div>
                </div>
            </div>
            
        </div>
        
<%-- 	<div class="/webpro/jsp1/cssEx/CSSTableGenerator">
		<center><b>글내용 보기</b>
			<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
				<tr height="30">
					<td align="center" width="125">글번호</td>
					<td align="center" width="125"><%=article.getNum() %></td>
					<td align="center" width="125">조회수</td>
					<td align="center" width="125"><%=article.getReadcount() %></td>
				</tr>
			
				<tr height="30">
					<td align="center" width="125">작성자</td>
					<td align="center" width="125"><%=article.getWriter() %></td>
					<td align="center" width="125">작성일</td>
					<td align="center" width="125"><%=sdf.format(article.getReg_date()) %></td>
				</tr>
			
				<tr height="30">
					<td align="center" width="125">글제목</td>
					<td align="center" width="375" colspan="3"><%=article.getSubject() %></td>
				
				</tr>
				<tr height="30">
				<td align="center" width="125">글내용</td>
				<td align="center" width="375" colspan="3"><pre><%=article.getContent() %></pre></td>
			
			</tr>
					<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum<%=pageNum%>&boardId=<%=boardId%>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum<%=pageNum%>&boardId=<%=boardId%>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&pageNum<%=pageNum%>&boardId=<%=boardId%>'">&nbsp;&nbsp;&nbsp;&nbsp;
					
					<input type="button" value="글목록" onclick="document.location.href='boardlist.jsp?num=<%=article.getNum()%>&pageNum<%=pageNum%>&boardId=<%=boardId%>'">&nbsp;&nbsp;&nbsp;&nbsp;
					
			</td> --%>
	
	<%}catch(Exception e){} %>

</body>
</html>