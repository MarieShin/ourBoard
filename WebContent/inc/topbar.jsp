<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="study.jsp.mysite.model.Member"%>
<%
	// 이 파일도 index.jsp에 include 될 것이므로, 앞서 작업한 head.jsp와 변수명이
	// 중복되지 않도록 만든다.

	/** 세션 정보를 조회한다. */
	// 세션 생성시 Beans의 객체를 저장하였으므로, 꺼낼때도 Beans 형식으로 변환한다.
	Member topbarSessionInfo = (Member) session.getAttribute("member");

	// 현재 사이트에 대한 웹 상의 디렉토리 경로를 얻는다.
	String homeDir = request.getContextPath();
%>

<!-- 메뉴바 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- 배경을 제외한 메뉴 항목의 영역 제한 -->
	<div class="container">
		<!-- 로고 영역 -->
		<div class="navbar-header">
			<!-- 반응형 메뉴 버튼 -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- // 반응형 메뉴 버튼 -->
			<!-- 로고 -->
			<a class="navbar-brand" href="<%=homeDir%>/index.jsp">My Site</a>
			<!-- // 로고 -->
		</div>
		<!-- // 로고 영역 -->
		<!-- 메뉴 영역 -->
		<div class="navbar-collapse collapse">
			<!-- 사이트 메뉴 -->
			<ul class="nav navbar-nav">
				<li><a href="<%=homeDir%>/bbs/list.jsp">게시판</a></li>
			</ul>
			<!--// 사이트 메뉴 -->

			<%
				if (topbarSessionInfo == null) {
					// 세션이 없는 경우 로그인 폼 보여주기
			%>

			<!-- 로그인(메뉴 우측) -->
			<form class="navbar-form navbar-right" method="post"
				action="<%=homeDir%>/member/login_ok.jsp">
				<div class="form-group">
					<input type="text" name="user_id" placeholder="user Id"
						class="form-control">
				</div>
				<div class="form-group">
					<input type="password" name="user_pw" placeholder="Password"
						class="form-control">
				</div>
				<button type="submit" class="btn btn-success">
					<i class="glyphicon glyphicon-user"></i>
				</button>
				<a href="<%=homeDir%>/member/join.jsp" class="btn btn-warning">
					<i class="glyphicon glyphicon-plus"></i>
				</a> <a href="<%=homeDir%>/member/find_pw.jsp" class="btn btn-info">
					<i class="glyphicon glyphicon-search"></i>
				</a>
			</form>
			<!-- // 로그인(메뉴 우측) -->

			<%
				} else {
					// 그렇지 않은 경우 다른 UI 보여주기
			%>

			<!-- 로그인 된 경우 -->
			<div class="navbar-right">
				<p class="navbar-text">
					<%=topbarSessionInfo.getUserId()%>님
				</p>
				<a href="<%=homeDir%>/member/logout.jsp"
					class="btn navbar-btn btn-primary"> <i
					class="glyphicon glyphicon-off"></i>
				</a> <a href="<%=homeDir%>/member/edit.jsp"
					class="btn navbar-btn btn-info"> <i
					class="glyphicon glyphicon-edit"></i></a> <a
					href="<%=homeDir%>/member/out.jsp"
					class="btn navbar-btn btn-danger"> <i
					class="glyphicon glyphicon-remove-circle"></i></a>
			</div>
			<!-- // 로그인 된 경우 -->

			<%
				}
			%>

		</div>
		<!-- // 메뉴 영역 -->
	</div>
	<!-- 배경을 제외한 메뉴 항목의 영역 제한 -->
</div>
<!-- // 메뉴바 -->