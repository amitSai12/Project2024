<!DOCTYPE html>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - User Information</title>
    <link rel="stylesheet" href="style.css">
    <script>
    document.addEventListener("DOMContentLoaded", () => {
        // Function to validate form
        function validateForm() {
            let isValid = true;
            
            // Get form fields
            const nameField = document.querySelector('[id$="name"]');
            const ageField = document.querySelector('[id$="age"]');
            const nameError = document.getElementById('name-error');
            const ageError = document.getElementById('age-error');

            // Clear previous errors
            nameError.style.display = 'none';
            ageError.style.display = 'none';

            // Validate name
            if (nameField.value.trim() === '') {
                nameError.textContent = 'Name is required.';
                nameError.style.display = 'block';
                isValid = false;
            } else if (!/^[a-zA-Z\s]+$/.test(nameField.value)) {
                nameError.textContent = 'Name can only contain letters and spaces.';
                nameError.style.display = 'block';
                isValid = false;
            }

            // Validate age
            const ageValue = parseInt(ageField.value, 10);
            if (isNaN(ageValue) || ageValue <= 0) {
                ageError.textContent = 'Please enter a valid age.';
                ageError.style.display = 'block';
                isValid = false;
            }

            return isValid;
        }

        // Attach validation to form
        const form = document.querySelector('[id$="userForm"]');
        form.addEventListener('submit', (event) => {
            if (!validateForm()) {
                event.preventDefault();
            }
        });

        // Handle floating labels
        const inputs = document.querySelectorAll('.floating-input');

        inputs.forEach(input => {
            input.addEventListener('focus', () => {
                input.previousElementSibling.classList.add('active');
            });

            input.addEventListener('blur', () => {
                if (input.value === '') {
                    input.previousElementSibling.classList.remove('active');
                }
            });

            // Prevent leading zeros in age input
            if (input.id.includes('age')) {
                input.addEventListener('input', () => {
                    input.value = input.value.replace(/^0+/, '');
                });
            }
        });
    });

    document.addEventListener("DOMContentLoaded", () => {
        const dropdown = document.querySelector('.dropdown');
        const dropdownMenu = document.querySelector('.dropdown-menu');

        dropdown.addEventListener('mouseover', () => {
            dropdownMenu.style.display = 'block';
        });

        dropdown.addEventListener('mouseout', () => {
            dropdownMenu.style.display = 'none';
        });
    });
    </script>
</head>
<body>

<h:form>
  <nav class="navbar">
            <div class="navbar-container">
                <h:graphicImage value="logo.png" alt="Logo" styleClass="logo"/>
                <ul class="navbar-menu">
                    <li><h:commandLink value="Home" action="show.jsf" styleClass="nav-link" /></li>
                    <li class="dropdown">
                        <h:outputLink value="#" styleClass="nav-link">Categories</h:outputLink>
                        <ul class="dropdown-menu">
                            <li><h:commandLink value="Option 1" action="show.jsf" styleClass="dropdown-item" /></li>
                            <li><h:commandLink value="Option 2" action="show.jsf" styleClass="dropdown-item" /></li>
                            <li><h:commandLink value="Option 3" action="show.jsf" styleClass="dropdown-item" /></li>
                        </ul>
                    </li>
                    <li><h:commandLink value="Games" action="show.jsf" styleClass="nav-link" /></li>
                    <li><h:commandLink value="About" action="show.jsf" styleClass="nav-link" /></li>
                </ul>
            </div>
        </nav>
        </h:form>
    <div class="container">
        <h1 class="title">Enter Details</h1>
        
        <h:form id="userForm">
            <div class="form-group">
                <label for="name" class="floating-label">Username:</label>
                <h:inputText id="name" value="#{user.name}" styleClass="floating-input input-field" />
                <span id="name-error" class="error-message"></span>
            </div>
            <div class="form-group">
                <label for="age" class="floating-label">Age:</label>
                <h:inputText id="age" value="#{user.age}" styleClass="floating-input input-field" />
                <span id="age-error" class="error-message"></span>
            </div>
            <div class="form-group">
                <h:commandButton value="Start Quiz" action="#{daoImpl.addUser(user)}" styleClass="submit-button" />
            </div>
        </h:form>
    </div>
     <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Handle dropdown menu hover
            document.querySelector('.dropdown').addEventListener('mouseenter', function() {
                this.querySelector('.dropdown-menu').style.display = 'block';
            });
            document.querySelector('.dropdown').addEventListener('mouseleave', function() {
                this.querySelector('.dropdown-menu').style.display = 'none';
            });
        });
    </script>
</body>
</html>
</f:view>
