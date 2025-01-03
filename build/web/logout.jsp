<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log the user out
    session.invalidate();
    response.sendRedirect("login.jsp");  // Redirect to home page after logout
%>
