<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="kwon_bean.BoardDBBean"%>
<%@page import="kwon_bean.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

<% request.setCharacterEncoding("utf-8"); %>   
 
<%!
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null || pageNum.equals("")){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	int endRow = currentPage*pageSize;
	int count = 0;
	int number = 0;
	List articleList = null;
	BoardDBBean dbPro = BoardDBBean.getInstance();
	
	count = dbPro.getArticleCount();
	System.out.println(count);
	if(count >0){
		articleList = dbPro.getArticles(startRow,endRow);
	}
	System.out.println(articleList);
	number=count-(currentPage -1) * pageSize;
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
        <meta name="keywords" content="">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Board page - Start Bootstrap Theme</title>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
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
    </head><body>
        <div class="brand">Kwon Baking School</div>
        <div class="address-bar">3481 Eunpyeong Place | Yeok Mal st., 902-10 | 123.456.7890</div>
        <div class="section">
            
            <!-- Navigation -->
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
                            <li>
                           <%
							String id="";
										
							if(session.getAttribute("id")!=null){
							id=(String)session.getAttribute("id");
							%>
							<a href="logoutPro.jsp">Sign out</a>
							<%} else{ %>
                            <!-- <button class="btn btn-default" data-target="#layerpop" data-toggle="modal">sign in</button>
                            <div class="modal fade" id="layerpop" >
							  <div class="modal-dialog">
							    <div class="modal-content">
							      header
							      <div class="modal-header">
							        닫기(x) 버튼
							        <button type="button" class="close" data-dismiss="modal">×</button>
							        header title
							        <h4 class="modal-title">Enter your username and password to log on:</h4>
							      </div>
							      body
							      <div class="modal-body">
							         
							           <div class="form-bottom">
											<form name=loginform role="form" action="loginProcess.jsp"
												method="post" class="login-form">
												<div class="form-group">
													<label class="sr-only" for="form-username"> ID</label> <input
														type="text" name="id" placeholder="ID..."
														class="form-username form-control" id="form-username">
												</div>
												<div class="form-group">
													<label class="sr-only" for="form-password"> Password</label> <input
														type="password" name="pass" placeholder="Password..."
														class="form-password form-control" id="form-password">
												</div>
												<button type="submit" class="btn btn-primary"
													href="javascript:loginform.submit()">Sign in!</button>
												</button>
												<a href="javascript:history.back(-1)">back</a>
												<a href="registForm.jsp"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
													go to Regist 
													<span class="glyphicon glyphicon-ok"
														aria-hidden="true"></span></a>
												<p>
													<br>
												</p>
											</form>
										</div>
										 <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							      </div> -->
										<%} %>
										
										<%-- <%
											String id="";
											if(session.getAttribute("id")!=null){
												id=(String)session.getAttribute("id");
												
											}else {
												out.println("<script>");
												out.println("location.href='login.jsp");
												out.println("</script>");
											}
										%> --%>
							      </div>
							      <!-- Footer -->
							     
							    </div>
							  </div>
							</div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navibar-collapse -->
                </div>
                <!-- /.container -->
            </nav>
      
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                         <!-- <form action="login.jsp" method="post">
						  <input type="submit" class="btn btn-lg btn-primary right" value="log-in">
						  </form> -->
                    </div>
                </div>
 
      
                <div class="row">
                    <div class="box">
                        <div class="col-lg-12 padding-top-10">
				            <div class="btn-group" role="group" aria-label="#">
						  <a class="btn btn-info" href="boardlist.jsp">공지사항</a>
						  <a class="btn btn-info" href="boardlist2.jsp">FAQ</a>
						  <a class="btn btn-info" href="boardlist3.jsp">QnA</a>	
						  
							</div>
							<span class="label label-default">공지사항 게시판 입니다.</span></h3>

				
                          <!-- total contents -->
                           
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <%
				if(session.getAttribute("id")!=null){
					id=(String)session.getAttribute("id");
				%>
                <div class="row">
                    <div class="box">
                        <div class="col-lg-12">
                            <div>
                                <div class="board">
                                    <div class="board_list" id="board_list">
                                      
										<table width="700" border="1" cellpadding="0" cellspacing="0">
									
										<%if(count==0) {%>
											<tr>
												<td align="center">게시판에 저장된 글이 없습니다.</td>
											</tr>
										</table>
											<%} else{ %>
                                        <table class="table table-striped table-condensed" width="100%" border="1" 
                                        cellspacing="0" summary="List of Articles">
                                            <thead>
                                                <!-- LIST HEADER -->
                                                <tr>
                                                    <th scope="col">
                                                        <span>번호</span>
                                                    </th>
                                                    <th scope="col" class="title">
                                                        <span>제목</span>
                                                    </th>
                                                    <th scope="col">
                                                        <span>글쓴이</span>
                                                    </th>
                                                    <th scope="col">
                                                        <span>날짜</span>
                                                    </th>
                                                    <th scope="col">
                                                        <span>조회 수</span>
                                                    </th>
                                                    <th scope="col">
                                                        <span>IP-Address</span>
                                                    </th>
                                                </tr>
                                                
                                                <!-- /LIST HEADER -->
                                            </thead>
										
													            
										<% for(int i=0; i<articleList.size(); i++){
											BoardDataBean article = (BoardDataBean)articleList.get(i);
											%> 
										 <tr height="30">
										<td class="num" align="center" width="50" ><%-- <%=i%>: --%><%=number--%></td>
										<td width="250">
									
										 <%
							 			if (article.getReadcount() >= 20) {
										 %> 
										<img src="<%=request.getContextPath()%>/img/hot.gif" border="0" height="16"> 
												<%	}	%>
											 <%-- <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"></a> --%>
                                             <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=article.getSubject() %></a>
                                     <%--    <td class="num"><%=number%></td> --%>
                                             <%--  <td class="subject"></a> </td> --%>
                                             <td class="writer"><%=article.getWriter() %>  </td>
                                             <td class="reg_date"><%=sdf.format(article.getReg_date())%></td>
                                             <td class="readcount"><%=article.getReadcount()%></td>
                                             <td class="ip"><%=article.getIp()%></td>
                                                <!-- /LIST -->
                                                
                                           
                                    <%}%>
									</table>
									<%} %>
									<%
										if (count > 0) {
											int pageCount = count / pageSize
													+ (count % pageSize == 0 ? 0 : 1);
											int startPage = currentPage / pageSize + 1;
											int endPage = startPage + 10;
											if (endPage > pageCount){endPage = pageCount;}
											if (startPage > 10) {
									%>
                                    
                                    </div>
                                    <div class="list_footer paddint-right">
                                        <div class="btnArea">
                                            <div class="row">
                                                <div class="col-md-1">
                                                    <a href="boardlist.jsp?pageNum=<%=startPage-10%>"> 
                                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>&nbsp;앞 페이지</a>
                                                </div>
											                                                <%
														}
															for (int i = startPage; i <= endPage; i++) {
													%>
                                                <div class="col-md-2">
                                                   <a href="boardlist.jsp?pageNum<%=i%>">[<%=i%>]</a>
                                                </div>
                                                <%
													 }
														if (endPage < pageCount) {
												%>
                                               <div class="col-md-1">
                                               <a href="baordlist.jsp?pageNum=<%=startPage+10%>">뒤 페이지&nbsp;</a>
		                                        <%
														}
													}
												
												%>
		                                          	
                                                </div>
                                               
                                             
                                                <div class="col-md-3">
                                                    <form action="writeForm.jsp" method="post">
                                                        <input type="submit" class="btn btn-lg btn-default" value="글쓰기">
                                                    </form>
                                                </div>
                                                <div class="col-md-1"> </div>
                                            </div>
                                        </div>
                                        <form method="get" onsubmit="return procFilter(this, search)" id="board_search" class="board_search">
                                            <input type="hidden" name="act" value="">
                                            <input type="hidden" name="vid" value="">
                                            <input type="hidden" name="mid" value="">
                                            <input type="hidden" name="category" value="193027">
                                            <div class="search_input">
                                                <div class="row">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" aria-label="...">
                                                        <div class="input-group-btn">
                                                            <div class="col-lg-6">
                                                                <div class="input-group">
                                                                    <div class="input-group-btn">
                                                                        <button type="button" class="btn btn-default" data-toggle="">검색</button>
                                                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">검색목록
                                                                            <span class="caret"></span>
                                                                        </button>
                                                                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                                            <li>
                                                                                <a href="#">제목+내용</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">제목</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="#">댓글</a>
                                                                            </li>
                                                                            <li class="divider"></li>
                                                                            <li>
                                                                                <a href="#">때려치고 종료하기.</a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <!-- /btn-group -->
                                                                </div>
                                                                <!-- /input-group -->
                                                            </div>
                                                            <!-- /.col-lg-6 -->
                                                        </div>
                                                        <!-- /.row -->
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!-- /.container -->
                            <footer>
                            
                             <div class="container">
						          <div class="row">
						            <div class="col-lg-12 text-center">
						              <p>Copyright © Kwon's Website 2015</p>
						            </div>
						          </div>
						        </div>
						      </footer>
                            <!-- jQuery -->
                            <script src="js/jquery.js"></script>
                            <!-- Bootstrap Core JavaScript -->
                            <script src="js/bootstrap.min.js"></script>
                            <!-- Script to Activate the Carousel -->
                            <script>
                                $('.carousel').carousel({
                                    interval: 5000 //changes the speed
                                })
                            </script>
                        </div>
                    </div>
                </div>
                <%}else{%>
                <script>
                document.write('로그인 해 주시기 바랍니다.');
                location.href="login.jsp";
                </script>
				              
                <% }%>
            </div>
        </div>
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">board page</h2>
                <hr>
            </div>
            <div class="clearfix"></div>
        </div>
</body></html>