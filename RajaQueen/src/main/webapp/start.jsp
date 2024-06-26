<!DOCTYPE html>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Raja Quiz</title>
          <link rel="stylesheet" href="start.css">
   
    </head>
    <body>
        <h:form>
            <div class="container">
                <div class="header">
                   <h:graphicImage value="logo.png" alt="Logo" styleClass="logo"/>
                    <h1>Can you ASKY the best out of you?</h1>
                    <p>
                        Help teach yourself by asking yourself with Asky, 
                        <h:outputLink styleClass="custom-link" value="https://quickdraw.withgoogle.com/data" target="_blank">the best version of yourself</h:outputLink>, 
                       	is here waiting for you, just go for it !!
                    </p>
                </div>
                <h:commandButton value="Play !" styleClass="draw-button" action="User.jsf" />
            </div>
   
        </h:form>
    </body>
    </html>
</f:view>
