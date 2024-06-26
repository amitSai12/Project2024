<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
    <html xmlns="http://www.w3.org/1999/xhtml"
          xmlns:h="http://java.sun.com/jsf/html"
          xmlns:f="http://java.sun.com/jsf/core">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator Options</title>
        <link rel="stylesheet" type="text/css" href="Menu.css">
    </head>
    <body>
        <div class="container">
            <h:form>
                <h:commandButton value="Math Calculator" action="Mathematics.jsf" styleClass="button"/>
                <h:commandButton value="Age Calculator" action="AgeCalculator.jsf" styleClass="button"/>
            </h:form>
        </div>
    </body>
    </html>
</f:view>
