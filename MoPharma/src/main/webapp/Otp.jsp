<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<f:view>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html"
      xmlns:f="http://xmlns.jcp.org/jsf/core">
<head>
    <title>OTP Verification</title>
  <link rel="stylesheet" type="text/css" href="Otp.css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        const inputs = document.querySelectorAll('.otp-inputs input');

        inputs.forEach((input, index) => {
            input.addEventListener('keyup', (e) => {
                if (e.keyCode === 8 && index !== 0) {
                    inputs[index - 1].focus();
                } else if (e.keyCode >= 48 && e.keyCode <= 57) {
                    if (index !== inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                }
            });
        });
    });
    		
    </script>
</head>
<body>
    <h:form>
        <div class="container">
            <div class="card">
               <h2>Mo PHARMA</h2>
               <span style="font-size: 15px;">Biju Guarantee, Sankha Guarantee</span>
                <img src="BijuBhai.png" alt="OTP Icon" class="otp-icon"/>
                <h3>OTP Verification Code</h3>
                <p>We have sent a verification code to your e-mail</p>
                <div class="otp-inputs">
                    <input type="number" maxlength="1" />
                    <input type="number" maxlength="1" />
                    <input type="number" maxlength="1" />
                    <input type="number" maxlength="1" />
                </div>
                <h:commandButton value="Submit" action="#{usersImpl.otpCheck(login)}" styleClass="submit-button"/>
            </div>
        </div>
    </h:form>
</body>
</html>

</f:view>