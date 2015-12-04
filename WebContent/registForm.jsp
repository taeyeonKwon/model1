<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="registBean" class="kwon_bean.registBean" scope="page"/>
<jsp:setProperty name="registBean" property="*"/>
<html>
<head>
<meta name="keywords" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Registration Form</title>
<!-- Bootstrap
        Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">

<!-- Custom CSS -->
<link href="css/business-casual.css" rel="stylesheet">
<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
        queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file://
        -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->


<script>
function inputCheck(){
		   
		    if(document.writeform.name.value==null||document.writeform.name.value==""){   // form 에 있는 name 값이 없을 때
			    alert("Enter your name in box"); // 경고창 띄움
			    document.writeform.name.focus();   // form 에 있는 name 위치로 이동
			    return false;
			}if(document.writeform.id.value==null||document.writeform.id.value==""){
				alert("Enter your id in box.");
				document.writeform.id.focus();
				return false;
			}if(document.writeform.pass.value==null||document.writeform.pass.value==""){
				alert('Enter your password in box');
				document.writeform.pass.focus();
				return false;
			}if(document.writeform.repass.value==null||document.writeform.repass.value==""){
				alert('confirm your password');
				document.writeform.repass.focus();
				return false;
			}if(document.writeform.mail.value==null||document.writeform.mail.value==""){
				alert('Enter your email in box');
				document.writeform.mail.focus();
				return false;
			}if(document.writeform.mobile.value==null||document.writeform.mobile.value==""){
				alert('Enter your mobile in box');
				document.writeform.mobile.focus();
				return false;
			}
}
</script>
<script>
	function windowClose() {
		window.open('', '_parent', '');
		window.close();
	}
</script>

</head>
<body>
	<div class="brand">Kwon baking school</div>
	<div class="address-bar">3481 Eunpyeong Place | Yeok Mal st.,
		902-10 | 123.456.7890</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="modal fade" id="login"></div>

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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- navbar-brand is hidden on larger screens, but visible when the menu
                    is collapsed -->
				<a class="navbar-brand" href="index.html">Business Casual</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="index.html">Baking Academy</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="blog.html">blog</a></li>
					<li><a href="classinfo.html">Class info</a></li>
					<li><a href="contact.html">Board</a></li>

				</ul>
			</div>
			<!-- /.navibar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container padding-top-10">
		<div class="panel panel-default">
			<div class="panel-heading">Registration</div>
			<div class="panel-body">
				<form name="writeform" action="registPro.jsp" method="post"	onsubmit="return inputCheck()">
						<label for="id" class="control-label padding-top-10">Id</label>
						<div class="row padding-top-10">
							<div class="col-md-6">
								<input name= "id" type="text" class="form-control" id="id" placeholder="ID..." />
							</div>
						</div>
	
						<label for="passwd" class="control-label padding-top-10">Password</label>
						<div class="row padding-top-10">
							<div class="col-md-6">
								<input name="passwd" type="password" class="form-control" id="pass" placeholder="Password..." />
							</div>
						</div>
						<div class="row padding-top-10">
							<div class="col-md-6">
								<input name="repasswd" type="password" class="form-control" id="repass" placeholder="Confirm your Password..." />
						
							</div>
							
						</div>
						
						<label for="name" class="control-label padding-top-10">name</label>
						<div class="row">
							<div class="col-md-6">
								<input type="text" name= "name" class="form-control" id="name" placeholder="please put on your name" />
							</div>
						</div>
						<label class="control-label padding-top-10">Sex</label>
						<div class="row">
							<div class="col-md-6">
								<input type="radio" name="sex" value="male"  />Man 
								<input type="radio" name="sex" value="female" checked/>Woman
							</div>
						</div>
						<label for="mail" class="control-label padding-top-10">E-mail</label>
						<div class="row">
							<div class="col-md-6">
								<input type="email" name="email" class="form-control" id="mail" placeholder="Email..." />
							</div>
						</div>
						<label for="mobile" class="control-label padding-top-10">Your mobile number</label>
						<div class="row">
							<div class="col-md-6">
								<input type="text" name="mobile" class="form-control" id="mobile" placeholder="put in number without '-'..." />
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-1">
								<!-- Indicates a successful or positive action -->
								<a href="index.html"><h5><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></h5></a>
							</div>
							<div class="col-md-2">
								<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
								<!-- <input type="submit" class="btn btn-primary btn-lg"> -->
								<a href="javascript:registForm.inputCheck()"><input type="submit" class="btn btn-success" value="submit"></a> 
							</div>
						
	
						</div>
				</form>
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


</body>
</html>