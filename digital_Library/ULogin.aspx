<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ULogin.aspx.cs" Inherits="digital_Library.ULogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-rtl.css"/>
    <link href="vendor/vendorindex/font-awesome-4.7/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="icon" href="images/55.png" />
    <title>تسجيل الدخول</title>
    <style>
        #errorlbl {
        color:red;
        }
    </style>
</head>
<body >
     <form id="form1" runat="server">
    <div>
     <div class="loginn" 
         style="margin-top: 50px;">
        <h1 class="text-center header">ادارة المكتبة الرقمية بجامعة سوهاج</h1>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 form log">
                    <h3>تسجيل الدخول</h3>
                         <asp:Label ID="errorlbl" runat="server" Visible="false"></asp:Label>
                        <input class="form-control" type="text" id="fname" placeholder="الاسم" runat="server" required="required"/>
                        <input class="form-control" type="password" id="pass" placeholder="الرقم السري" required="required" runat="server"/>
                    <asp:Button runat="server" ID="confirm"  OnClick="confirm_Click" Text="تسجيل الدخول"/>
					
                </div>
            </div>
        </div>
    </div>
    
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    </div>
    </form>
</body>
</html>
