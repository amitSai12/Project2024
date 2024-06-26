<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>



<f:view>
	<html>
<head>
<style>
#dashBack {
	display: block;
	text-decoration: none;
	margin-top: 20px;
	border: 1px solid white;
	width: 80px;
	height: 20px;
	padding: 5px 5px;
	border-radius: 10px;
	background-color: darkorange;
	color: white;
}

.dashBack h\:commandLink:hover {
	background-color: red;
}

.loader-container {
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.7);
	/* Semi-transparent background */
	z-index: 9999; /* Ensure the loader appears on top */
}

.loader {
	border: 8px solid #f3f3f3; /* Light grey */
	border-top: 8px solid #3498db; /* Blue */
	border-radius: 50%;
	width: 50px;
	height: 50px;
	animation: spin 2s linear infinite; /* Spin animation */
}

@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100
%
{
transform
:
rotate(
360deg
);
}
}
</style>

</head>

<!-- <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload=""> -->
<body >
<h:form>
				<h:dataTable value="#{daoImpl.quizQuestions()}" var="p" border="1">
					<h:column>
							<h:outputLabel value="Questions">
							
							</h:outputLabel>
						<h:outputText value="#{p.text}" />
					</h:column>

				</h:dataTable>
				<br><br>
				<h:commandButton action="#{daoImpl.nextQuestion()}" value="next" />

	</h:form>
</body>
	</html>
</f:view>
