<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newstudent.aspx.cs" Inherits="digital_Library.newstudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>المكتبة الرقمية</title>
  
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-rtl.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        .alert{
            padding:10px;
            width:100% !important;
            border-radius:0;
            margin-bottom:15px !important;
            margin-top:5px
        }
         h1 {
        text-align:center;color:white}
            h1 a {
            text-decoration:none;color:white}
                h1 a:hover {
               color:white }
            h1 a:active {
             text-decoration:none;color:white}
                h1 a:focus {
                 text-decoration:none;color:white}
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
           <h1>انشاء حساب جديد </h1>   
        <div class="logi login" style="padding-bottom: 10px !important;">
              
        <div class="container-fluid">
            
            <div class="row">
                <div class="col-md-12 form log" style="margin-top: 0 !important;">
                     
                     <asp:Label runat="server" style="font-size:14px; color:red;display:none" CssClass="alert alert-danger"  Width="100%" ID="msg"></asp:Label> 
                   
                     <asp:RegularExpressionValidator CssClass="text-red alert alert-danger" ID="RegularExpressionValidator5"
                                  ControlToValidate="nationalId"  runat="server" Display="Dynamic"
                                  ErrorMessage="ادخل 14 رقم للبطاقة"  Width="100%"
                                  ValidationExpression="^\d{14}$" ForeColor="red">
                               </asp:RegularExpressionValidator>
                         <input  title="الرقم القومى"  class="form-control" type="text"  id="nationalId" runat="server" placeholder="الرقم القومي" required="required" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')" onkeypress="filterDigit(event)"/>
                         <input class="form-control"  type="password"  id="pass" placeholder="الرقم السري" required="required" runat="server" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')"/>
						 <input class="form-control" onkeyup="Validate()" type="password"  id="Password1" placeholder="تأكيد الرقم السري"  runat="server" required="required" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')"/>
                     <span id="message" style="font-size:17px;"></span>
                    <br />
                     <asp:Label runat="server" style="font-size:14px;" ID="Label1"> لديك حساب ؟
                       <a href="Login.aspx">تسجيل دخول</a>
                     </asp:Label>
                    
                    <br />
                    
					<asp:Button runat="server" ID="Newconfirm"   OnClick="Newconfirm_Click" Text="تسجيل "/>
                  <br />
             </div>
            
            </div>
           
        </div>
         
    </div>

             <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/script.js"></script>
         <script>
             function checkPhoneKey(key) {
                 return (key >= '0' && key <= '9') || key == '+' || key == '(' || key == ')' || key == '-';
             }
        function Validate() {
      
            if (document.getElementById("pass").value == document.getElementById("Password1").value) {
                document.getElementById("message").innerHTML = "الرقم السري متطابق";
                document.getElementById('message').style.color = 'green';
                $('#message').addClass("alert alert-success");

               
            } else {
                document.getElementById('message').style.color = 'red';
                document.getElementById('message').innerHTML = 'الرقم السرى غير متطابق';
                $('#message').addClass(" alert alert-danger");

            }
           
        }

        function filterDigit(eventInstance) {
            eventInstance = eventInstance || window.event;
            key = eventInstance.keyCode || eventInstance.which;
            if ((47 < key) && (key < 58) || key == 45 || key == 8) {
                return true;
            } else {
                if (eventInstance.preventDefault) eventInstance.preventDefault();
                eventInstance.returnValue = false;
                return false;
            }
        }
    </script>
    </div>
    </form>
</body>
</html>
