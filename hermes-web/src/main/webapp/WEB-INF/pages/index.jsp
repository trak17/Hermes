<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>HERMES - Strona startowa</title>
    <link href="resources/css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="container">
    <h1>Strona startowa</h1>
    <p>
        <a href="${pageContext.request.contextPath}/shipment/create.htm">Nowa przesyłka</a><br/>
        <a href="${pageContext.request.contextPath}/shipment.htm">Przesyłki</a><br/>
    </p>
</div>
</body>
</html>