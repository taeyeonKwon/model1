<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta name="keywords" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
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
    <title>Don't you need this?</title>

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
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only"> navigation</span>
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
                                    <h3>Do you want to delete it?</h3>
                                    <p><br/></p>
                                </div>
                                <div class="form-top-right">
                                   <h3>Are you sure?</h3>
                                </div>
                            </div>
							<div class="form-bottom">
	                                <form method="POST" name="delForm"  action="delPro3.jsp?pageNum=<%=pageNum%>" class="form-horizontal">
	                                  <div class="form-group">
										 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
										  <tr height="30">
										     <td align=center >
										       <b>비밀번호를 입력해 주세요.</b></td>
										  </tr>
										  <tr height="30">
										     <td align=center >비밀번호 :   
										       <input type="password" name="passwd" size="8" maxlength="12">
										      <input type="hidden" name="num" value="<%=num%>"></td>
										 </tr>
										 <tr height="30">
										    <td align=center>
										      <input type="submit" class="btn btn-default" value="글삭제" >
										      <input type="button" class="btn btn-default" value="글목록" 
										       onclick="document.location.href='boardlist3.jsp?pageNum=<%=pageNum%>'">     
										   </td>
										 </tr>  
											</table> 
											</div>
										</form>
	                                    <p><br></p>
	                            </div>
	                               </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            
        </div>
</body> 
</html> 