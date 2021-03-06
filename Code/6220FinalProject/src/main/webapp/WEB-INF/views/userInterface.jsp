<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<script type="text/javascript"
	src="${pageContent.request.contextPath}/static/script/jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-carousel.min.js"></script>
<title>Home Page</title>
</head>
<body>
	<!-- 顶部导航 -->
	<div id="header">
		<ul class="nav nav-tabs ">
			<li class="active"><a href="<c:url value='/jobList'/>">Jobs</a></li>
			<li><a href="<c:url value='/jobs/searchJobs'/>">Search for
					Job</a></li>
			<sec:authorize access="hasAuthority('employer')">
				<li><a href="<c:url value='/jobs/publish'/>">Publish Jobs</a></li>
			</sec:authorize>
			<sec:authorize access="hasAuthority('employee')">
				<li><a href="<c:url value='/application/viewAll'/>">My
						Application</a></li>
			</sec:authorize>
			<sec:authorize access="hasAuthority('employer')">
				<li><a href="<c:url value='/jobs/viewPublished'/>">Published
						Job Offer</a></li>
			</sec:authorize>
			<li><a href="<c:url value='/userInfo'/>">Person Information</a></li>
			<li><a href="<c:url value='/message/myMessages'/>">My
					Message</a></li>
			<li><a href="<c:url value='/logout'/>">Log Out</a></li>
		</ul>
	</div>
	<!-- 轮播 -->
	<div id="slidershow" class="carousel slide upper" data-ride="carousel"
		data-wrap="true" data-interval="2000">
		<ol class="carousel-indicators">
			<li class="active" data-target="#slidershow" data-slide-to="0">1</li>
			<li data-target="#slidershow" data-slide-to="1">2</li>
			<li data-target="#slidershow" data-slide-to="2">3</li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<a href="##"><img src="<c:url value="/resources/css/book.jpg"/>"
					alt=""></a>
				<div class="carousel-caption">
					<h3>Skillful</h3>
					<p>Learning something new is always a good choice.</p>
				</div>
			</div>
			<div class="item">
				<a href="##"><img src="<c:url value="/resources/css/road.jpg"/>"
					alt=""></a>
				<div class="carousel-caption">
					<h3>Adventurous</h3>
					<p>Let's hit the road.</p>
				</div>
			</div>
			<div class="item">
				<a href="##"><img
					src="<c:url value="/resources/css/laptop.jpg"/>" alt=""></a>
				<div class="carousel-caption">
					<h3>Conscientious</h3>
					<p>Find a better you in a new Job.</p>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#slidershow" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#slidershow" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<!-- content -->
	
	<center>
		<h1 class="hello">Hello,${currentUser.username},welcome.</h1>
		<!-- Job List -->
		<div class="panel panel-default" style="width: 60%;">
			<div class="text-center panel-body">
				<p>Here is a list of all the Jobs. Find those you are interested
					and contact with the Publisher! Open the job link to see detail and
					apply for yourself!</p>
			</div>
		</div>
		<c:if test="${!empty jobs}">
			<fieldset style="width: 400px">
				<legend>Job List</legend>
				<div class="container" style="width: 500px">

					<c:forEach var="jobInfo" items="${jobs}">
						<div class="row">
							<div class="col-md-7 text-left">
								<a href="<c:url value='/jobs/${jobInfo.id}/showDetail'/>"><c:out
										value="${jobInfo.title}"></c:out></a>
							</div>

							<div class="col-md-2 row2">
								<a
									href="<c:url value='/message/${jobInfo.user.id}/messageForm'/>"><c:out
										value="${jobInfo.user.username}"></c:out></a>
							</div>

							<div class="col-md-3 row2">
								<c:out value="${jobInfo.publishDate}"></c:out>
							</div>
						</div>
					</c:forEach>
				</div>
			</fieldset>
		</c:if>
	</center>
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<footer>
	<p class="pull-right">
		<a href="#top">Back to Top</a>
	</p>

	<p>&copy; 2016 Xiajie Zhang</p>
	</footer>
</body>
</html>