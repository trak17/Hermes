<?xml version="1.0" encoding="UTF-8" ?>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>HERMES - Nowa przesyłka</title>
    <spring:url value="/resources/css/main.css" var="mainCssUrl"/>
    <spring:url value="/resources/css/bootstrap.css" var="bootstrapCssUrl"/>
    <spring:url value="/resources/js/jquery-1.10.2.js" var="jqueryJsUrl"/>
    <spring:url value="/resources/js/bootstrap.js" var="bootstrapJsUrl"/>

    <link media="screen" rel="stylesheet" href="${bootstrapCssUrl}" type="text/css"/>
    <link media="screen" rel="stylesheet" href="${mainCssUrl}" type="text/css"/>
    <script src="${jqueryJsUrl}"></script>
    <script src="${bootstrapJsUrl}"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#newShipmentForm').submit(function (event) {
                var recipient = $('#recipient').val();
                var street = $('#street').val();
                var house = $('#house').val();
                var flat = $('#flat').val();
                var postcode = $('#postcode').val();
                var city = $('#city').val();
                var country = $('#country').val();

                var json = {recipient: recipient,
                    recipientAddress: {
                        street: street,
                        house: house,
                        flat: flat,
                        postcode: postcode,
                        city: city,
                        country: country
                    }};

                $.ajax({
                    url: $('#newShipmentForm').attr("action"),
                    data: JSON.stringify(json),
                    type: "POST",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("Accept", "application/json");
                        xhr.setRequestHeader("Content-Type", "application/json");
                    },
                    success: function (id) {
                        var responseContent = "";
                        responseContent += "<div class='alert alert-success alert-dismissable'>Utworzono przesyłkę o numerze ID: [";
                        responseContent += id;
                        responseContent += "]</div>";

                        $('#newShipmentResponse').html(responseContent);
                    }
                });
                event.preventDefault();
            });
        });

    </script>
</head>
<body>
<div id="headerContainer">
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar-header-collapse-main">
                <span class="sr-only">Nawiguj</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">HERMES</a>
        </div>
        <div id="navbar-header-collapse-main" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="${pageContext.request.contextPath}/shipment/create">Rejestruj przesyłkę</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/shipment/check">Sprawdź przesyłkę</a></li>
            </ul>
        </div>
    </nav>
</div>
<div id="newShipmentResponse"></div>

<h1>Nowa przesyłka</h1>

<p>Wpisz poniżej dane adresata przesyłki</p>

<form:form id="newShipmentForm" action="${pageContext.request.contextPath}/shipment/create.json">
    <table>
        <tr>
            <td>Nazwa:</td>
            <td><input id="recipient"/></td>
        </tr>
        <tr>
            <td>Ulica:</td>
            <td><input id="street"/></td>
        </tr>
        <tr>
            <td>Numer domu:</td>
            <td><input id="house"/></td>
        </tr>
        <tr>
            <td>Numer mieszkania:</td>
            <td><input id="flat"/></td>
        </tr>
        <tr>
            <td>Kod pocztowy:</td>
            <td><input id="postcode"/></td>
        </tr>
        <tr>
            <td>Miejscowość:</td>
            <td><input id="city"/></td>
        </tr>
        <tr>
            <td>Kraj:</td>
            <td><input id="country"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Utwórz"/></td>
        </tr>
    </table>
</form:form>
</div>
<div id="footerContainer">
    <div class="footer">HERMES 1.0</div>
</div>
</body>
</html>