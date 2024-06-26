<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<f:view>
<html>
<head>
    <title>Quiz - Question 1</title>
    <link rel="stylesheet" href="question.css" />
    <script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Ensure no radio button is selected by default
        let radios = document.querySelectorAll('.custom-radio input[type="radio"]');
        radios.forEach(radio => {
            radio.checked = false;
        });

        // Add event listeners to update the background color on selection
        radios.forEach(radio => {
            radio.addEventListener('change', function () {
                radios.forEach(r => {
                    let label = document.querySelector(`label[for='${r.id}']`);
                    if (label) {
                        if (r.checked) {
                            label.style.backgroundColor = 'yellow';
                        } else {
                            label.style.backgroundColor = '';
                        }
                    }
                });
            });
        });
    });

    function validateForm() {
        let radios = document.querySelectorAll('.custom-radio input[type="radio"]');
        let selected = false;

        radios.forEach(radio => {
            if (radio.checked) selected = true;
        });

        if (!selected) {
            alert("Please select an option.");
            return false;
        }
        return true;
    }
</script>
		
</head>
<body>
    <h:form onsubmit="return validateForm()">
        <div class="quiz-container">
            <c:forEach items="#{questionlist}" var="q">
                <div class="question-block">
                    <h:outputText value="#{q.text}" styleClass="question-text" />
                    <h:selectOneRadio value="#{question.correctAnswer}" layout="pageDirection" styleClass="custom-radio">
                        <f:selectItem itemValue="optionA" itemLabel="#{q.optionA}" id="optionA" />
                        <f:selectItem itemValue="optionB" itemLabel="#{q.optionB}" id="optionB" />
                        <f:selectItem itemValue="optionC" itemLabel="#{q.optionC}" id="optionC" />
                        <f:selectItem itemValue="optionD" itemLabel="#{q.optionD}" id="optionD" />
                    </h:selectOneRadio>
                </div>
            </c:forEach>
            <h:commandButton value="Next" action="#{daoImpl.nextQuestion(question)}" styleClass="next-button"/>
        </div>
    </h:form>
</body>
</html>
</f:view>
