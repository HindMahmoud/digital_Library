<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="digital_Library.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-rtl.css"/>
    <link href="css/style.css" rel="stylesheet" />
    <link href="vendor/vendorindex/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" />
    <style>
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
        #forget {
        color:orangered;}
    </style>
    <title>تسجيل الدخول</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <h1>تسجيل الدخول </h1> 
         <div class="logi login" style="padding-bottom:10px !important ;margin-top:7px;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 form log" style="padding-bottom:10px !important;margin-top:7px;">
                   
                     <br />
                        <asp:Label runat="server" style="font-size:15px;border-radius:0;display:none"  Width="100%" CssClass="alert alert-danger" ID="msg"></asp:Label> 
                                <asp:RegularExpressionValidator CssClass="alert alert-danger" display="Dynamic" Style="border-radius:0;" ID="RegularExpressionValidator5"
                                  ControlToValidate="nationald" runat="server" Width="100%"
                                  ErrorMessage="ادخل 14 رقم للبطاقة" 
                                  ValidationExpression="^\d{14}$" ForeColor="red">
                               </asp:RegularExpressionValidator>
                    
         
                        <input  title="الرقم القومى"  class="form-control" type="text"  id="nationald" runat="server" placeholder="الرقم القومي" required="required"  oninvalid="this.setCustomValidity('هذا البيان مطلوب')"    onkeypress="filterDigit(event)" />
                        <input class="form-control"  type="password"  id="pass" placeholder="الرقم السري" required="required" runat="server" oninvalid="this.setCustomValidity('هذا البيان مطلوب')" oninput="setCustomValidity('')"/>
						      <br />
                     <asp:Label runat="server" style="font-size:14px" ID="Label1" visible="true">ليس لديك حساب ؟
                       <a href="newstudent.aspx">انشاء حساب جديد</a>
                     </asp:Label>
                    
                    <br />
                    <asp:Button runat="server" ID="confirm"  OnClick="confirm_Click"  Text="تسجيل الدخول"/> <br />
                    <asp:Label ID="forget" runat="server" Visible="false">في حالة نسيان الرقم السري  واتساب فقط بالدعم الفني 01152246640  من 9 ص ل 5 م</asp:Label>
					<br />
                  </div>
            </div>
        </div>
    </div>
 <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
   
 
<script type="text/javascript">
    function checkPhoneKey(key) {
        return (key >= '0' && key <= '9') || key == '+' || key == '(' || key == ')' || key == '-';
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
