<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="digital_Library.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ar" xml:lang="ar" dir='rtl'>
<head>
     <meta charset="UTF-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Colorlib Templates"/>
    <meta name="author" content="Colorlib"/>


    <!-- Title Page-->
    <title>التحويل الرقمي للمكتبه الرقميه</title>

    <!-- Icons font CSS-->
    <link href="vendor/vendorindex/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all"/>
    <link href="vendor/vendorindex/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all"/>
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet"/>

    <!-- Vendor CSS-->
  
    <link href="vendor/vendorindex/datepicker/daterangepicker.css" rel="stylesheet" media="all"/>

    <!-- Main CSS-->
    <link href="css/mainindex.css" rel="stylesheet" media="all"/>
	<link href="css/bootstrap-rtl.css" rel="stylesheet" media="all"/>
    <link href="css/indexstyle.css" rel="stylesheet" />
   
</head>

<body >
     <div class="alert success" id="sucessdiv"  >
                                      <span class="closebtn">&times;</span>  
                                      تم رفع ملفك بنجاح !
                                    </div> 
    <form id="form1" runat="server">
   
     <div class="page-wrapper bg-gray p-t-100 p-b-100 font-robo" style="background-color:#743d3d">
           
          <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading">
               
                </div>
                <div class="card-body">
                    <h2 class="title">وحدة المكتبة الرقميه</h2>
					   <h4 class="title">إستمارة فحص موضوعات المخططات</h4>
                    	<asp:button runat="server" ID="btn" OnClick="btn_Click" cssClass="glyphicon glyphicon-off btn logoutBtn" Text="تسجيل الخروج"/>       
                    <div class="containerstep" dir="rtl">
                               <ul class="progressbar">
                                  <li  id="li1"><a href="#fawerydiv">دفع مصاريف الافادة </a></li>
                                  <li id="li2"><a href="#formdiv"> ملأ بياناتك </a></li>
                                  <li id="li3">انتظار نتيجه القبول</li>
                                  <li id="li4"> <a href="#upfildiv">رفع الملف </a></li>
                                  <li id="li5"><a href="print.aspx">طباعة الإفادة </a> </li>
                               </ul>
                            </div>
                         <div style="text-align:center">
                               
                            <asp:Label runat="server" class="infolabel" ID="Info">الخطوة 1 يرجي دفع مصروفات الافادة</asp:Label>
                             <br /> 
                              <div id="fawerydiv" runat="server" style="margin-top:15px">
                                 <input type="button"  class="btn btn-primary" onclick="FawryPay.checkout(chargeRequest,'http://localhost:51521/index.aspx' , 'http://localhost:51521/index.aspx')"   alt="Edfa3 Fawry" id="xsrrs" style=" height:47px; width:103px; background:url(https://www.atfawry.com/ECommercePlugin/resources/images/atfawry-ar-logo.png);"/>
                              </div>
                         </div>
                    
                        <div id="formdiv"  runat="server"> 
                         <fieldset>
                             <legend>الخطوة 2 ملأ الاستمارة</legend>
                          
                       <div class="input-group">
                            <input class="input--style-1" required="required" oninvalid="this.setCustomValidity(' الاسم مطلوب')" oninput="setCustomValidity('')" type="text" id="name"  placeholder="الاسم *" runat="server" />
                           <span class="name-msg"></span>
                       </div> 
                        
                       <div class="row row-space">
                            <div class="col-2">
                               <div class="input-group">
                                     <input class="input--style-1" oninvalid="this.setCustomValidity(' العنوان مطلوب')" oninput="setCustomValidity('')" type="text" required="required" placeholder="العنوان باللغه العربية *" runat="server" id="arabic_add"/>
                                     <span class="ar-add"></span> 
                                  
                               </div>
                               
                            </div>
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" oninvalid="this.setCustomValidity('العنوان بالانجليزية مطلوب')" oninput="setCustomValidity('')" type="text" required="required" placeholder="العنوان باللغه الانجليزية *" runat="server" id="eng_add"/>
                                 <span class="eng-add"></span>
                                     </div>
                               
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text" placeholder="الوظيفة" runat="server" id="jobtxt" />
                                </div>
                                
                            </div>
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text" placeholder="محل العمل" runat="server" id="jobplacetxt"/>
                                     
                                </div>
                            </div>
                        </div>
                         <div class="row row-space">
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1"   pattern="^\d{11}$"  title="برجاء ادخال رقم موبيل صحيح من 11 رقم" type="text" required="required" placeholder="الموبيل *"  runat="server" id="mobtxt"/>
                                    <span class="mob_error"></span>
                                </div>
                                
                            </div>
                            <div class="col-2">
                                <div class=" input-group">
                                   <input class="input--style-1" type="text" required="required"    placeholder="البريد الالكترونى *"  runat="server" id="emtxt"/>
                                   <%-- title="برجاء ادخال بريد إلكتروني صحيح (example@examp.com)" pattern="w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"--%>
                                   <span class="email_error"></span>
                                </div>
                                
                            </div>
                        </div>
                    
                     <div class=" univ">
                      <p class="univp"> الجامعة المراد تسجيل نقطة البحث بها <span >*</span></p>
                         <div class="row row-space options">  
                          <div class="col-2">
                                <div>
                                    <label>
                                        <input type="radio" class="option-input radio" name="example" id="radio1" runat="server"/>
                                        جامعة سوهاج
                                      </label>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div>
                                      <label>
                                    <input type="radio"   class="option-input radio" name="example" id="radio2" runat="server"/>
                                   جامعة اخرى
                                  </label>
                                </div>
                            </div>
                                 <span class="choose-msg"></span>
                        </div>
                        
                                <div class="input-group" id="univ_new" style="display:none" runat="server">
                                    
                                     <input list="brow1" class="input--style-1" id="university_name" placeholder="اسم الجامعة *" runat="server"/>
                                  <datalist id="brow1"  runat="server" >
                                </datalist>
                                    <span class="another-univ"></span>
                                </div>
                           
                     
                         </div>
                      <div class="row row-space ss">
                            <div class="col-2">
                                <div class=" input-group">
                                  <input list="brow" class=" input--style-1" id="browinput" autocomplete="off" placeholder="الكلية *" runat="server" required="required" oninvalid="this.setCustomValidity('الكلية مطلوبه')" oninput="setCustomValidity('')"/>
                                  <datalist id="brow"  runat="server">
                                </datalist>    
	                              
                            </div>
                                </div>
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text"  placeholder="القسم *" runat="server" id="deptxt" required="required" oninvalid="this.setCustomValidity('القسم مطلوب')" oninput="setCustomValidity('')"/>
                                    <span class="dep-msg"></span>
                                </div>
                            </div>
                        </div>
						<div class="row row-space">
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text" placeholder="الشعبة *" runat="server" id="Divisiontxt" required="required" oninvalid="this.setCustomValidity('الشعبة مطلوبة')" oninput="setCustomValidity('')"/>
                                    <span class="div-msg"></span>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                     <input class="input--style-1" type="text" placeholder="التخصص *" runat="server" id="spectxt" required="required" oninvalid="this.setCustomValidity('التخصص مطلوب')" oninput="setCustomValidity('')"/>
                                    <span class="spec-msg"></span>
                                </div>
                            </div>
                        </div>
						
						<div class="row row-space">
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text" placeholder="العام الدراسي *" runat="server" id="academictxt" required="required" oninvalid="this.setCustomValidity('العام الدراسى مطلوب')" oninput="setCustomValidity('')"/>
                                    <span class="year"></span>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                     <input class="input--style-1" type="text" placeholder="عنوان المخطط*" runat="server" id="titletxt" required="required" oninvalid="this.setCustomValidity('عنوان المخطط مطلوب')" oninput="setCustomValidity('')"/>
                                    <span class="title-msg"></span>
                                </div>
                            </div>
                        </div>
						
						<div class="row row-space">
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text" placeholder="المشرف *" runat="server" id="supertxt" required="required" oninvalid="this.setCustomValidity('المشرف مطلوب')" oninput="setCustomValidity('')"/>
                                    <span class="super-msg"></span>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class=" input-group">
                                     <input class="input--style-1" type="text" placeholder="المشرف المشارك او المشاركون *" runat="server" id="partenarstxt" required="required" oninvalid="this.setCustomValidity('المشاركون مطلوب')" oninput="setCustomValidity('')"/>
                                     <span class="supers-msg"></span>
                                </div>
                            </div>
                        </div>

                   <div class="row row-space">
                                <div class="dropdiv col-2">
                                       <label class="choose"> اختر الدرجة العلمية <span>*</span></label>
                                    <br />
                                    <asp:DropDownList runat="server" ID="degree" CssClass="form-Control select3">
                                        <asp:ListItem Value="1">ماجستير</asp:ListItem>
                                        <asp:ListItem Value="2">دكتوراة</asp:ListItem>
                                    </asp:DropDownList>
	                                
                              </div>
                      
                       </div>
                        <div class="p-t-20">
                            <asp:Button CssClass="btn btn--radius"    style="background-color:#191818;width: 18%;" Text="حفظ" OnClick="Unnamed_Click"  ID="submit" runat="server" />
                          
                        </div>
                         </fieldset>      
                   </div>
                    
                         <div class="dropdiv" runat="server" id="upfildiv" >
                             <fieldset>
                                 <legend>الخطوة 4 رفع الملف</legend>

                                  <label class="choose"> يمكنك رفع ملفك فقط بعد الموافقه علي بياناتك </label>
                                 <br />
            
                                  <asp:FileUpload runat="server"  ForeColor="DarkBlue"    ID="fileup" name="Ipic"  />
                                   <asp:RegularExpressionValidator ID="regexValidateImageFil" ValidationGroup="d" Display="Dynamic" EnableClientScript="true" runat="server" ControlToValidate="fileup"  ForeColor="red"  ErrorMessage="لايمكنك رفع هذا الملف ,الملفات المطلوبة من نوع .docx or .rtf فقط." ValidationExpression="^.*\.(docx|rtf)$"></asp:RegularExpressionValidator>  
                                            
                                   <div class="p-t-20" >
                                      <asp:Button CssClass="btn btn--radius" runat="server"   CausesValidation="true" ValidationGroup="d"     style="background-color:#191818;width: 18%;" Text="رفع"   ID="Button1"  OnClick="Button1_Click" />
                                      
                                  </div>
	                         </fieldset> 
                               
                          </div>

                    
                    </div>
                </div>
            </div>
        </div>
    </form>
      <!-- Jquery JS-->
    <script src="vendor/vendorindex/jquery/jquery.min.js"></script>
    <script src="js/sha.js"></script>
    <!-- Main JS-->
    <script src="js/global.js"></script>
  <script src="js/indexjsFile.js"></script>
    <script src= "https://atfawry.fawrystaging.com/ECommercePlugin/scripts/V2/FawryPay.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/forge/0.8.2/forge.all.min.js"></script>
     
    <script>
        
        var close = document.getElementsByClassName("closebtn");
        var i;

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function(){
                var div = this.parentElement;
                div.style.opacity = "0";
                setTimeout(function(){ div.style.display = "none"; }, 800);
            }
        }

       var sttus=<%=status%>;
       var flagPaid="<%=flagPaid%>";
        if(sttus==0)
        {   if(flagPaid==true)
            {
            $('#li1').addClass('active');}
            
        }
        else if(sttus==1)
        {   $('#li1').addClass('active');
            $('#li1 a').addClass('active');
            $('#li2').addClass('active');
            $('#li2 a').addClass('active');
        }

        else if(sttus==2||sttus==3)
            {
        
            for(var i=1;i<4;i++)
            {
                $('#li'+i).addClass('active');
                $('#li'+i+' a').addClass('active');
            }

        }
        else if(sttus==4)
        {
           
            for(var i=1;i<5;i++)
            {
                $('#li'+i).addClass('active');
                $('#li'+i+' a').addClass('active');
            }
        }
        else if(sttus==5)
        {  $('li').addClass('active');
           $('li a').addClass('active');  
        }

        function changestatus()
        {
            for(var i=1;i<5;i++)
            {
                $('#li'+i).addClass('active');
                $('#li'+i+' a').addClass('active');
            }
        }
           
 
    </script>
    <!--script for api fawry-->
    <script>
        var ref=<%=refunumber%>;
        var id=<%=id%>;
         var chargeRequest = {};
              chargeRequest.language = 'eg-ar';
              chargeRequest.merchantCode = '1tSa6uxz2nSuj+kDUGVlyw';
              chargeRequest.merchantRefNumber = ref;
              chargeRequest.customer = {}
              chargeRequest.customer.name =<%=nid%>;
              chargeRequest.customer.mobile = <%=mobiletxt%>;
              chargeRequest.order = {};
              chargeRequest.order.description = <%=nid%>;
              chargeRequest.order.expiry = '720';
              chargeRequest.order.orderItems = [];
              var item = {};
              item.productSKU = 1;
              item.quantity = 1;
              item.description = <%=nid%>
              item.price = parseInt(5.00);
             
              chargeRequest.order.orderItems.push(item);
              txt = chargeRequest.merchantCode + chargeRequest.merchantRefNumber + item.productSKU + item.quantity + item.price;
              
              chargeRequest.signature = generateHash(txt);

              function generateHash(txt) {
                  var plainText = txt;
                  var md = forge.md.sha256.create();
                  md.start();
                  md.update(plainText, "utf8");
                  var hashText = md.digest().toHex();
                  return hashText
              }
         
		function requestCanceldCallBack(merchantRefNum) {		 
		    // Your implementation to handle the calncel button	
		    // window.location.href = "errorPage.aspx";
		    document.getElementById("myModal").showModal();
		}
		
		function fawryCallbackFunction(paid, billingAcctNum, paymentAuthId,merchantRefNum, messageSignature) {
		    $.ajax({
		        type: 'POST',
		        url: '{ValuesController1.aspx/POST',
		        contentType: "application/json; charset=utf-8",
	            data:'{paidStatus:' + paid + ',paymentID:'+paymentAuthId+',merchantRefNum:'+merchantRefNum+',messageSignature:'+messageSignature+'}',
		        success: function () {
		            alert(' تم الحفظ');
		        }
                , faild: function () {
                    alert('لم يتم الحفظ');
                }
		    });
		    // Your implementation
		}
		function GetParameterValues(param) {  
		    var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');  
		    for (var i = 0; i < url.length; i++) {  
		        var urlparam = url[i].split('=');  
		        if (urlparam[0] == param) {  
		            return urlparam[1];  
		        }  
		    }}
		function GetParameterValues1(param) {  
		    
		    var ele= param.split(',');
		    var eleValue= ele[0].split(':');
		    ref=eleValue[1];
		    }
		$(document).ready(function () {
		    var URLPage=window.location.href;
		    if(URLPage.indexOf("?chargeResponse=") > -1) {
		        const queryString =GetParameterValues('chargeResponse');// window.location.search;
		        alert(queryString);
		        GetParameterValues1(queryString);
		        sucessFunction();
		        
		    }
		});
	function sucessFunction()
	{ //alert(ref+",id="+id);
	
	$.ajax({
	    type: 'POST',
	    url: 'index.aspx/assignRefNumToDB',
	    contentType: "application/json; charset=utf-8",
	            
	    data:'{reff:' + ref + ',idStu:'+id+'}',
	            success: function () {
	                window.location.href="http://localhost:51521/index.aspx";
	                $('fawerydiv').hide();
	            }
                , faild: function () {
                 alert('لم يتم الحفظ');
                 }
	        });
		}

//        function FawryPayAtFawry() {
        
//            let merchantCode    = "1tSa6uxz2nSuj+kDUGVlyw";
//let merchantRefNum  = 'ee2001';
//let merchant_cust_prof_id  = 1024;
//let payment_method = "PAYATFAWRY";
//let amount = "30";
//let customerName='hend';
//let mobile ='200000002022';
//let merchant_sec_key =  "259af31fc2f74453b3a55739b21ae9ef";
//let signature_body = merchantCode.concat(merchantCode , merchantRefNum , merchant_cust_prof_id , payment_method , amount , merchant_sec_key);
//let sha256 = new jsSHA('SHA-256', 'TEXT');
//sha256.update(signature_body);
//let hash_signature = sha256.getHash("HEX");
//axios.post('https://atfawry.fawrystaging.com/ECommerceWeb/Fawry/payments/charge', {
//                'merchantCode' : merchantCode,
//                'merchantRefNum' : merchantRefNum,
//                'customerName' : customerName,
//                'customerMobile' : mobile,
//                'customerEmail' : 'example@gmail.com',
//                'customerProfileId' : '1024',
//                'amount' : '30',
//                'paymentExpiry' : '1631138400000',
//                'currencyCode' : 'EGP',
//                'language' : 'en-gb',
//                'chargeItems' : {
//                                      'itemId' : '897fa8e81be26df25db592e81c31c',
//                                      'description' : 'Item Description',
//                                      'price' : '580.55',
//                                      'quantity' : '1'
//                                  },
//                'signature' : hash_signature,
//                'payment_method' : payment_method,
//                'description': 'example description'
//            })
//                .then(response => {
//                    // Get Response Contents
//                    let type          = response.data.type;
//                    let paymentStatus = response.data.paymentStatus;
//                    //
//                })
//                .catch(error => {
//                    console.log(error.response.data)
//                })
//}

    </script>

    <!--end the script-->

</body>
</html>
