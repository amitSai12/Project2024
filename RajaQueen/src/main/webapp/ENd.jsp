<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
<html>
<head>
    <title>Quiz Ended</title>
    <link rel="stylesheet" href="end.css" />
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const score = parseInt(document.getElementById('score').textContent, 10);
            const message = document.getElementById('message');
            if (score < 10) {
                message.textContent = "Try harder next time!";
            } else if (score === 10) {
                message.textContent = "Congratulations!";
            }
        });

        window.onload = function() {
            createParticles();
        };

        function createParticles() {
            const particlesContainer = document.getElementById('particles-js');
            const numParticles = 100;
            for (let i = 0; i < numParticles; i++) {
                let particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + 'vw';
                particle.style.top = Math.random() * 100 + 'vh';
                particle.style.animationDelay = Math.random() * 10 + 's';
                particlesContainer.appendChild(particle);
            }
        }
    </script>
</head>
<body>
    <div id="particles-js"></div>
    <div class="container">
        <h:form>
            <h1>QUIZ ENDED</h1>
            <h2>Score: <span id="score"><h:outputText value="#{score}" /></span></h2>
            <h3 id="message"></h3>
            <h:commandButton value="Play Again !" action="User.jsf" styleClass="home-button"/>
        </h:form>
    </div>
</body>
</html>
</f:view>
