<!DOCTYPE html>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>



<f:view>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
<head>
    <title>Register Now</title>
    <link rel="stylesheet" type="text/css" href="styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
    $(document).ready(function() {
        // Animate form fields on page load
        $('.form-group').each(function(index) {
            $(this).delay(200 * index).queue(function(next) {
                $(this).addClass('visible');
                next();
            });
        });

        // Update donate value on slider change
        $('#donate').on('input change', function() {
            $('#donateValue').text('$' + $(this).val());
        });
    });

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
        function updateClock() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            var ampm = hours >= 12 ? 'PM' : 'AM';

            // Convert to 12-hour format
            hours = hours % 12;
            hours = hours ? hours : 12; // '0' should be '12'
            
            // Format time
            hours = (hours < 10 ? '0' : '') + hours;
            minutes = (minutes < 10 ? '0' : '') + minutes;
            seconds = (seconds < 10 ? '0' : '') + seconds;

            // Display the time
            $('#clock').text(hours + ':' + minutes + ':' + seconds + ' ' + ampm);
        }

        // Initial call to display clock immediately
        updateClock();
        // Update clock every second
        setInterval(updateClock, 1000);
    });

        
    		
    </script>
</head>
<body>
    <h:form>
        <div class="container">
            <div class="left-side">
             <b><h:outputText value="Mo PHARMA" styleClass="register-title"/></b>
                <h:outputText value="Biju guarantee, Sankha guarantee" styleClass="register-subtitle"/>
        		<br>
        		<img style=" box-shadow: 10px 10px 30px 6px gray; border: none;
    				border-radius: 20px;"width="350" height="215" src="BijuBabu.webp"/>
        		<div class="clock-container">
            	<h3><a href="https://time.is/IST" style="text-decoration: none; color:cornflowerblue;">
            	<span  id="clock" ></span>
            	</a></h3>
        </div>
            </div>
            
            <div class="right-side">
				<div class="group">
					<div class="form-group">
                    <h:outputLabel for="firstName" value="USERNAME"/><span style="color:red;">*  </span>
                    <h:inputText id="firstName" value="#{users.username}" required="true" styleClass="input"/>
                </div>
                
                <div class="form-group" id="passInput">
                    <h:outputLabel for="lastName" value="PASSWORD"/><span style="color:red;">*  </span>
							<h:inputSecret id="lastName" value="#{users.password}" required="true" styleClass="input" >
								<i class="fa fa-eye" id="showPass"></i> 
								<i class="fa fa-eye-slash" id="showPassSlash" style="display: none;"></i>
							</h:inputSecret>
							
               </div> 
               
                <div class="form-group">
                    <h:outputLabel for="email" value="EMAIL"/><span style="color:red;">*  </span>
                    <h:inputText id="email" value="#{users.email}" required="true" styleClass="input"/>
                </div>
                
                <div class="form-group">
                    <h:outputLabel for="mealPreference" value="GENDER"/><span style="color:red;">*  </span>
                    <h:selectOneMenu id="mealPreference" value="#{users.gender}" styleClass="input" style="width:156%;">
                        <f:selectItem itemLabel="--Select--" itemValue=""/>
                        <f:selectItem itemLabel="Male" itemValue="MALE"/>
                        <f:selectItem itemLabel="Female" itemValue="FEMALE"/>
                        <f:selectItem itemLabel="Prefer not to say" itemValue="OTHERS"/>
                    </h:selectOneMenu>
                </div>
               
                <div class="form-group buttons">
                    <h:commandButton value="SUBMIT" action="#{usersImpl.register(users)}" styleClass="btn submit-btn"/>
                    <h:commandButton value="RESET" type="reset" styleClass="btn reset-btn"/>
                </div>
                <br>
                 <div class="form-group signup">
                    <span>Already have an account?</span> <h:outputLink value="Login.jsf" styleClass="signup-link">Sign In</h:outputLink>
                </div>
				</div>            
            </div>
        </div>
    </h:form>
</body>
</html>
</f:view>
