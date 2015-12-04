<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
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
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Board form</h3>
                                    <p><br/></p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-key"></i>
                                </div>
                            </div>

	                            <div class="form-bottom">
	                                <form name="writeForm" role="form" action="writePro.jsp" method="post" class="form-horizontal">
	                               	
	                                  <div class="form-group">
	                                   <table class="table table-striped ">
											<tr><td>
													<div align="center">writer</div></td>
												<td><%-- <input name="writer" type="text" value="<%=session.getAttribute("id") %>"> --%>
												<input name="writer" type="text" placeholder="이름..."></td></tr>
												
											<tr><td><div align="center">password</div></td><td>
													<input name="passwd" type="password"  placeholder="패스워드..."/></td></tr>
													
											<tr><td><div align="center">subject</div></td><td>
													<input name="subject" type="text"  placeholder="제목..."/></td></tr>
											<tr><td><div align="center">content</div>
												</td>
												<td>
									<textarea name="content"  rows="10" cols="100" style="width:766px; height:412px;"></textarea>
	
												</td>
												
											</tr>
											
											<tr><td colspan="5" align="center">
												<!--  <a href="javascript:writePro()"> -->
												<a href="javascript:writeForm.inputCheck()">
												<input type="submit" class="btn btn-success" value="[등록]">
												 </a>&nbsp;&nbsp;
												 	<button type="reset" class="btn btn-success" >[다시쓰기]</button>
												 <a href="boardlist.jsp">
												 	<input type="button" value="목록보기">
												 </a>
												
												</td>
											</tr>
										</table>
	                                    <p><br></p>
	                                </form>
	                                
	                               
	                            </div>
                        </div>
                    
                    <div class="clearfix"></div>
                </div>
            </div>
            
        </div>
        <!-- /.container -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Copyright © Your Website 2014</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
    

</body></html>