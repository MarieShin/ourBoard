<%@page import="study.java.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	// WebHelper
	WebHelper helper = WebHelper.getInstance(request, response, out);

	// 세션정보 파괴
	session.invalidate();
	
	String url = "../index.jsp";
	helper.redirect(url, "안녕히 가세요.");
%>