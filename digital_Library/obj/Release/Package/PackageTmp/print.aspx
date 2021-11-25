<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="digital_Library.print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ar" xml:lang="ar" dir='rtl'>
<head runat="server">
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


    <!-- Main CSS-->
    <link href="css/mainindex.css" rel="stylesheet" media="all"/>
	<link href="css/bootstrap-rtl.css" rel="stylesheet" media="all"/>
    <link href="css/printStyle.css" rel="stylesheet" />
    <meta http-equiv="content-type" content="text/html; charset=UTF8" />
   
</head>

<body>
    <form id="form1" runat="server">


     <div class="page-wrapper bg-gray p-t-100 p-b-100 font-robo" style="background-color:black">
        
        <div class="wrapper wrapper--w680" id="divprint">
            <div class="card card-1" >
              <div class="row row-space header">
                  <div class="col-1"><img src="images/i.png" width="100px"/></div>
                 <div class="col-1"><img src="images/i.png" width="100px"/></div>
                <div class="col-1"><img src="images/i.png" width="100px"/></div>
              </div>

                <div class="row row-space subheader" id="subheader">
                  <div class="col-1"><p>جامعة سوهاج</p></div>
                 <div class="col-1"><p>بنك المعرفة المصرى</p></div>
                <div class="col-1"><p>وحدة المكتبة الرقمية</p><p>رقم الافادة: <%=id_efada %></p></div>
              </div>

                <div class="card-body" style="padding-bottom:35px !important">
                   <div class="row">
                             <div class="col-md-4 col-xs-3">
                                 </div>
                            <div class="col-md-6 col-xs-9">	
                                 <h4 class="title">إفـــــــــادة</h4>
                            </div>
                      </div>
                         <h2 class="title" id="warning"> تحذير: يمكنك طباعة هذه الاستمارة مرة واحده فقط وظهور هذه الرساله علي الورقة المطبوعه تدل علي ان الطالب لم يسجل بياناته علي الموقع</h2>
                  <div class="row">
                      <div class="col-md-2 ">
                                 </div>
                       <div class="col-md-10 col-xs-12">	
                            <h6 class="title">تفيد وحدة المكتبة الرقمية بجامعة سوهاج بأن العنوان الآتى:</h6>
                         </div>
                      </div>
                       <div>   
                        <div class="divone">
                            <p class="address">باللغة العربية:</p>
                            <p class="points" runat="server" id="ara_add"></p>
                        </div>
                        
                       <div class="divone">
                            <p class="address">باللغة الانجليزية:</p>
                            <p class="points" runat="server" id="eng_add">
                              
                            </p>
                        </div>

                        <div class="row row-space divtwo">
                            <div class="col-2">
                                <span class="elements">الكلية:</span>
                                <span id="facultyname" runat="server"></span>
                            </div>
                            <div class="col-2">
                                <span class="elements">القسم:</span>
                                <span  runat="server" id="dep"></span>
                            </div>
                        </div>



                         <div class="row row-space divtwo">
                            <div class="col-2">
                                
                                 <span class="elements">الدرجة العلمية:</span>
                                <span  runat="server" id="deg"></span>
                            </div>
                            <div class="col-2">
                                 <span class="elements">اسم الباحث:</span>
                                <span  runat="server" id="search"></span>
                            </div>
                        </div>
                    
                     <h6 class="title2">لا يوجد ضمن البيانات المدخله على موقع الفهرس الموحد لمكتبات الجامعات المصرية <br />  حتى تاريخه<span runat="server" id="sdate"></span></h6>
                       <h6 class="title2">
             وهذه الإفادة استرشادية وليست ملزمة<span> ،</span>وعلى السادة المشرفين ومجالس الاقسام العلمية
                        اتخاذ مايرونه مناسبا للاستمرار فى هذه النقطة البحثية أوتغييرها <span>،</span> وتم ذلك على مسئولية الباحث دون أدنى مسئولية على وحدةالمكتبة الرقمية.

                           <br />
                           تم تسليم عدد ( 3 ) نسخة إلكترونية CD من مخطط الرسالة الذى تم البحث عن عنوانه.
                       </h6>
                          

                        <div class="row row-space divthree">
                            <div class="col-1">
                                
                                 <span class="elements">الموظف المختص</span>
                                <br />
                                <span>.............................</span>
                            </div>
                            <div class="col-1">
                                </div>

                            <div class="col-1">
                                 <span class="elements">مدير المكتبة الرقمية <br />ومنسق بنك المعرفه</span>
                                <br />
                                <img src="images/s.png" width="120px" height="90px" />
                               <%-- <span>................................................</span>--%>
                            </div>
                        </div>
                            
                           <div class="row row-space footer">
                            <div class="col-3">
                                
                                 <span class="elements">العنوان:جامعة سوهاج-مركز تكنولوجيا المعلومات - الدور السادس</span>
                                <br />
                                <span>تليفون الداخلى87877878787787 فاكس 98989898989</span>
                            </div>
                            

                            <div class="col-1 emails">
                                 <span class="elements">eee@gmail.com</span>
                                <br />
                                <span>eejhjhjhjhe@gmail.com</span>
                            </div>
                        </div>
                          
                           <br />
   
                   </div>
                     <div class="sidenav">
                            <%-- <div class="p-t-20">--%>
                                <button  type="submit"  onclick="printDiv('divprint')" id="sub"  runat="server" title="'طباعه" > <i class="fa fa-print" aria-hidden="true" style="background-color:royalblue;color:white;padding:20px"></i></button>
                                 <br />
                                  <button  type="button"  id="btnSave" title="تنزيل كصورة"> <i class="fa fa-download" aria-hidden="true" style="background-color:red;color:white;padding:20px"></i></button>
                                 <br />
                                  <%--<input type="button" id="btnSave" class="fa fa-download"  title="تنزيل كصورة"  style="background-color:red;color:white;padding:20px"/>--%>
                                 <button  type="button"  onclick="back();" id="Button1"  runat="server" ><i class="fa fa-chevron-left" aria-hidden="true" title="رجوع للصفحه الرئيسية" style="background-color:white;color:black;padding:22px;border:1px solid #a79797;"></i></button>
                             <%--</div>--%>
                </div>
                </div>
              
            </div>
             
        </div>
    </div>
     




   
    </form>
      <!-- Jquery JS-->
    <script src="vendor/vendorindex/jquery/jquery.min.js"></script>
  
    <!-- Main JS-->
    <script src="js/global.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="js/canvas2image.js"></script>
    <script>
        function back()
        { location.href = "index.aspx";}
        function printDiv(divName){
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;
            document.getElementById('warning').style.display = 'none';
            window.print();
            $.ajax({
                type: 'POST',
                url: 'print.aspx/printfunction',
                contentType: "application/json; charset=utf-8",

                dataType: 'json',
                success: function (data) {
                    //printDiv('divprint');
                    document.body.innerHTML = originalContents;
                    document.getElementById('sub').style.display = 'none';
                }

            });
            
        }
        
      
        $(function () {
            $("#btnSave").click(function () {

                $(".sidenav").hide();
   
                document.getElementById('warning').style.display = 'none';
                //printDiv(divprint);
                html2canvas($("#divprint"), {
                    onrendered: function (canvas) {
                        theCanvas = canvas;
                        //document.body.appendChild(canvas);

                        // Convert and download as image 
                        Canvas2Image.saveAsPNG(canvas);
              
                        var imgageData = canvas.toDataURL("image/png");
                        var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
                        $("#btn-Convert-Html2Image").attr("download", "الإفادة.png").attr("href", newData);
                    }
                });
            });
        });




        // global variable
        var getCanvas; // global variable

        $("#btn-Convert-Html2Image").on('click', function () {
            $('#sub').hide();
            var element = $("#divprint");
            
           
            html2canvas(element, {
                onrendered: function (canvas) {
                    getCanvas = canvas;
                   var imgageData = getCanvas.toDataURL("image/jpg");
                   // Now browser starts downloading it instead of just showing it
                   var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
                   $("#btn-Convert-Html2Image").attr("download", "الإفادة.png").attr("href", newData);
               }
            });
        });
        

        $(document).keydown(function (e) {
            if (e.which === 123) {
                return false;
            }
        });

    </script>
</body>
</html>

