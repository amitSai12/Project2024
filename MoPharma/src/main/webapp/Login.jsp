<!DOCTYPE html>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>



<f:view>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
<head>
    <title>Sign In</title>
    <link rel="stylesheet" type="text/css" href="Login.css"/>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>

        $(document).ready(function() {
            $('#showPass, #showPassSlash').on('click', function() {
                var passInput = $("#passInput input");
                var showPassIcon = $("#showPass");
                var showPassSlashIcon = $("#showPassSlash");

                if (passInput.attr('type') === 'password') {
                    passInput.attr('type', 'text');
                    showPassIcon.hide();
                    showPassSlashIcon.show();
                } else {
                    passInput.attr('type', 'password');
                    showPassIcon.show();
                    showPassSlashIcon.hide();
                }
            });
        });
        
        $(document).ready(function() {
            $('.input-field input').on('focus blur keyup', function() {
                if ($(this).val() !== '') {
                    $(this).closest('.input-field').addClass('filled');
                } else {
                    $(this).closest('.input-field').removeClass('filled');
                }
            });
        });
    </script>
</head>
<body>
    <h:form>
        <div class="container">
            <div class="card">
                <h2>Sign In</h2>
                <div class="input-field">
                	
                    <h:inputText id="username" value="#{users.username}" required="true" styleClass="input"/>
                    <label for="username"><i class="fa fa-user" aria-hidden="true"></i> Username</label>
                </div>
                
                <div class="input-field" id="passInput">
	                
                    <h:inputSecret id="password" value="#{users.password}" required="true" styleClass="input"/>
                    <label for="password"><i class="fa fa-lock" aria-hidden="true"></i> Password</label>
	                <i class="fa fa-eye" id="showPass" style="margin-left:-27px;"></i> 
					<i class="fa fa-eye-slash" id="showPassSlash" style="display: none;margin-left:-27px;"></i>
                    
                </div>
                
                <div class="forgot-password">
                    <h:outputLink value="#">Forgot Username / Password?</h:outputLink>
                </div>
                <h:commandButton value="Sign In" action="#{usersImpl.login(users)}" styleClass="btn"/>
                <div class="signup">
                    <span><b>Don't have an account?</b></span> <h:outputLink value="SignUp.jsf" styleClass="signup-link">Sign Up Now</h:outputLink>
                </div>
            </div>
        </div>
    </h:form>
</body>
</html>
</f:view>