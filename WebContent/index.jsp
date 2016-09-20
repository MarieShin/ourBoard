<%@page import="study.jsp.mysite.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!doctype html>
<html>
<head>

	<%@ include file="/inc/head.jsp"%>
<style type="text/css" >
	<%@ include file="assets/css/index.css"%>
	.pic{
		background-image: url('assets/pic/main.jpg');
	}
</style>
</head>
<body>
<%@ include file="/inc/topbar.jsp"%>
	
	
	<div class="jumbotron text-center login_form pic" id="title">
	<br>
    	<h1 id="top">Our Board</h1>
    	<br>
    	<p class="margin_height"/>
	    	
    	<p >소통하는 게시판 -----</p>
    	<a href="#other" class="btn btn-default btn-lg" >other story</a>
	</div>
	<div id="other"class="text-center jumbotron">
		<br>	
	    <div class="well-sm">
	        <label class="label_title">OTL : Our Time Line</label>
	    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 text-center">
                <div class="">
                    <span class="glyphicon glyphicon-user"></span>
                    <h3>Users</h3>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="">
                    <span class="glyphicon glyphicon-paperclip"></span>
                    <h3>article</h3>
                </div>
             </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div >
                    <span class="glyphicon glyphicon-calendar"></span>
                    <h3>Up to Date</h3>
                    <label class="label_small">2016/09/06 ~ ing</label>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="">
                    <a href="#made"><span class="glyphicon glyphicon-heart-empty"/></a>
                    <h3>Made with Love</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="jumbotron">
    <div id="made">
        <div class="col-lg-4 text-center">
            <h3>TeamLeader_TA</h3>
            <h2>정인우</h2>
        </div>
        <div class="col-lg-4 text-center">
            <h3>DA</h3>
            <h2>서종환</h2>
        </div>
        <div class="col-lg-4 text-center">
            <h3>AA</h3>
            <h2>신새희</h2>
        </div>
    </div>
</div>
<%@ include file="/inc/footer.jsp"%>

</body>

</html>
