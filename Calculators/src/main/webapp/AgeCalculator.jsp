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
<title>Age Calculator</title>
<link rel="stylesheet" type="text/css" href="AgeCalculator.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
            function validateForm() {
                let bornDate = document.getElementById('ageForm:bornDateStr').value;
                let deathDate = document.getElementById('ageForm:deathDateStr').value;

                if (bornDate === "") {
                    alert("Born date is required!");
                    return false;
                }

                let bornDateObj = new Date(bornDate);
                let deathDateObj = deathDate ? new Date(deathDate) : null;
                let currentDate = new Date();

                if (bornDateObj >=currentDate) {
                    alert("Born date cannot be in the future or today!");
                    return false;
                }
                
                if (deathDate && deathDateObj  > currentDate) {
                    alert("Death date cannot be in the future!");
                    return false;
                }

                if (deathDate && deathDateObj < bornDateObj) {
                    alert("Death date cannot be before the born date!");
                    return false;
                }

                return true;
            }

            // Adjust input type to 'date' on page load if needed
            document.addEventListener('DOMContentLoaded', function () {
                var dateInputs = document.querySelectorAll('input[type="text"]');
                dateInputs.forEach(function (input) {
                    if (!input.type || input.type === 'text') {
                        input.setAttribute('type', 'date');
                    }
                });
            });
        </script>
<style>
input[type="date"] {
	width: 380px;
	padding: 5px;
	margin: 5px 0;
	box-shadow: 7px 7px 0px 0px;
}
</style>
</head>
<body>
	
	 <h:form>
	 <h:commandLink action="Menu.jsf" style="text-decoration:none; border:2px solid white; padding:4px;box-shadow:4px 4px 0px 0px darkorange;">
                <h:outputText escape="false" value='<i class="fa fa-home" style="font-size:60px; color:darkorange;"></i>' />
            </h:commandLink>
	</h:form>
	
	  <div class="form-container">
            <h1>Age Calculator</h1>
            <h:form id="ageForm" styleClass="form">
                <div class="form-row">
                    <label for="bornDateStr" class="form-label">Born</label>
                    <h:inputText id="bornDateStr" value="#{age.born}" styleClass="form-input" required="true"
                                 requiredMessage="Born date is required!">
                        <f:convertDateTime pattern="yyyy-MM-dd"/>
                    </h:inputText>
                    <h:message for="bornDateStr" style="color:red"/>
                </div>

                <div class="form-row">
                    <label for="deathDateStr" class="form-label">Died (Optional)</label>
                    <h:inputText id="deathDateStr" value="#{age.died}" styleClass="form-input">
                        <f:convertDateTime pattern="yyyy-MM-dd"/>
                    </h:inputText>
                    <h:message for="deathDateStr" style="color:red"/>
                </div>

                <div class="form-row">
                    <h:outputText id="ageResult" value="#{ageOf}" styleClass="result"/>
                </div>

                <div class="form-row">
                    <h:commandButton value="calculate" action="#{impl.ageCalculator(age)}"
                                     onclick="return validateForm()" styleClass="calculate-btn"/>
                </div>
            </h:form>
        </div>
</body>
	</html>
</f:view>
