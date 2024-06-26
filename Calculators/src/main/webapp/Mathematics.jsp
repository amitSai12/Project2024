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
        <title>Simple Calculator</title>
        <link rel="stylesheet" type="text/css" href="Mathematics.css">
        <script>
        function validateForm() {
            let num1 = document.getElementById('calcForm:num1').value;
            let num2 = document.getElementById('calcForm:num2').value;

            if (num1 === "") {
                alert("Number 1 is required!");
                return false;
            }

            if (num2 === "") {
                alert("Number 2 is required!");
                return false;
            }

            if (isNaN(num1) || isNaN(num2)) {
                alert("Please enter valid numbers!");
                return false;
            }

            return true;
        }

        document.addEventListener('DOMContentLoaded', function () {
            var dateInputs = document.querySelectorAll('input[type="text"]');
            dateInputs.forEach(function (input) {
                if (!input.type || input.type === 'text') {
                    input.setAttribute('type', 'number');
                }
            });
        });
        			
        </script>
    </head>
    <body>
        <div class="form-container">
            <h1>Simple Calculator</h1>
            <h:form id="calcForm" styleClass="form">
                <div class="form-row">
                    <label for="num1" class="form-label">Num1</label>
                    <h:inputText id="num1" value="#{maths.num1}" styleClass="form-input" required="true"
                                 requiredMessage="required" />
                    <h:message for="num1" style="color:red"/>
                </div>

                <div class="form-row">
                    <label for="num2" class="form-label">Num2</label>
                    <h:inputText id="num2" value="#{maths.num2}" styleClass="form-input" required="true"
                                 requiredMessage="required" />
                    <h:message for="num2" style="color:red"/>
                </div>

                <div class="form-row buttons-row">
                    <h:commandButton action="#{impl.sum(maths)}" value="+" styleClass="calculate-btn"/>
                    <h:commandButton action="#{impl.sub(maths)}" value="-" styleClass="calculate-btn"/>
                    <h:commandButton action="#{impl.mul(maths)}" value="x" styleClass="calculate-btn"/>
                    <h:commandButton action="#{impl.divs(maths)}" value="/" styleClass="calculate-btn"/>
                </div>

                <div class="form-row">
                    <h:outputText id="result" value="#{result}" styleClass="result"/>
                </div>
            </h:form>
        </div>
    </body>
    </html>
</f:view>
