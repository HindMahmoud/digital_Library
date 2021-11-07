<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="digital_Library.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>المكتبه الرقمية</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />

    <link rel="stylesheet" href="css/bootstrap.min.css" />

    <link rel="stylesheet" href="css/bootstrap-rtl.css" />

    <link href="vendor/vendorindex/font-awesome-4.7/css/font-awesome.css" rel="stylesheet" />
    <%--  <link rel="stylesheet" href="css/style1.css"/>--%>
    <style>
        body {
            background-color: #f1eff0;
        }

        #example_wrapper {
            border-radius: 3px;
            padding: 11px;
            overflow-x: scroll;
            background: white;
        }
        .bg-white {
        background-color:white;padding-top:10px}
        th {text-align:center
        }
        .lg {
        padding:10px 40px;text-align:center}
        .dataTables_filter>label{content:"بحث" !important
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
      
          <h1 class="text-center header">ادارة المكتبة الرقمية بجامعة سوهاج </h1>
            <div class="container py-5">
                <div class="row py-5">
                    <div class="col-lg-12 mx-auto bg-white">
                        <div class="card shadow border-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <input type="button" class="btn lg btn-default" id="select" value="تحديد الكل"/>
                                  <%-- <asp:Button runat="server" ID="accept" cssClass="btn lg btn-" Text="قبول"/>
                                    <asp:Button runat="server" ID="reject" cssClass="btn lg btn-danger" Text="رفض"/>
                                   --%>
                                      <input type="button" class="btn lg btn-success"  id="accept" value="قبول"/>
                                      <input type="button" class="btn lg btn-danger" id="reject" value="رفض"/>
                                 
                                     <table id="example"  class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <td></td>
                                               
                                                <th>الاسم</th>
                                                <th>الرقم القومي</th>
                                                <th>الكلية</th>
                                                <th>الجامعة</th>
                                                <th>رقم التليفون </th>
                                                <th>الايميل</th>
                                                <th>الوظيفة</th>
                                                <th>محل الوظيفه</th>
                                                <th>العنوان باللغه العربية</th>
                                                <th>العنوان باللغه الانجليزية</th>
                                                <th>القسم</th>
                                                <th>الشعبة </th>
                                                <th>التخصص</th>
                                                <th>الدرجة العلمية</th>
                                                <th>المشرف</th>
                                                <th>عنوان المخطط</th>
                                                <th>المشاركين/المشرفين</th>
                                                <th>حالة الدفع</th>
                                                <th>الاطلاع علي الملف</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%if (all != null)
                                            {
                                                foreach (var i in all)
                                                {
                                            %>
                                            <tr>
                                                <td><input type="checkbox" class="alert-info checkbox ch" id='<%=i.id_student %>' data-id='<%=i.id_student %>'/></td>
                                                <td><%=i.name_student %></td>
                                                <td><%=i.national_id %></td>
                                                <td><%=i.faculty_id %></td>
                                                <td><%=i.univ_name %></td>
                                                <td><%=i.phone %></td>
                                                <td><%=i.email_address %></td>
                                                <td><%=i.Job %></td>
                                                <td><%=i.Job_place %></td>
                                                <td><%=i.arabic_address %></td>
                                                <td><%=i.eng_add %></td>
                                                <td><%=i.department %></td>
                                                <td><%=i.Division %></td>
                                                <td><%=i.Specialization %></td>
                                                <td><%=i.degree_academic %></td>
                                                <td><%=i.Supervisor %></td>
                                                <td><%=i.chart_title %></td>
                                                <td><%=i.Co_supervisor %></td>
                                                <td><%=i.Flag_pay %></td>
                                                <td><a  target="_blank" href="~/sfiles/<%=i.student_file %>"></a></td>
                                              
                                            </tr>
                                            <% }
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </form>

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>

    <script>

        $(function () {
            $(document).ready(function () {
              var Otables=  $('#example').DataTable();
                //$('.checkbox').change(function (e) {
                //    var che = true;

                //    var el = this;
                //    e.preventDefault();
                //    var delid = $(this).attr('id');
                //    alert(delid);
                //    if (!$(this).is(':checked'))
                //    { che = false; }
                //    $.ajax({
                //        type: 'POST',
                //        url: 'dashboard.aspx/updatefunction',
                //        contentType: "application/json; charset=utf-8",
                //        data: '{delid:' + delid + ',che:' + che + '}',
                //        dataType: 'json',
                //        success: function (data) {
                //            alert("تمت بنجاح");
                //        }
                //           , faild: function () {
                //               alert('لم يتم الحفظ');
                //           }
                //    });
                //});
            
              var allPages = Otables.cells().nodes();
                $("#select").on("click", function () {
              
                    if ($(this).hasClass('allChecked')) {
                        $(allPages).find('input[type="checkbox"]').prop('checked', false);
                    } else {
                        $(allPages).find('input[type="checkbox"]').prop('checked', true);
                    }
                    $(this).toggleClass('allChecked');
                
               

                    //$(".checkbox").prop("checked", !clicked);
                    //clicked = !clicked;
                    //this.innerHTML = clicked ? 'Deselect' : 'Select';
                });

                var arr = [];
                var id_stu;
                $('body').on('click','input:checked',function () {
                 

                    id_stu = $(this).attr('id');
                    var exist = arr.indexOf(id_stu);
                    if (exist == -1) { arr.push(id_stu); };
                });
                $("#accept").on("click", function () {
                   
                   if (arr.length > 0) {
                        console.log(arr);
                        for (var i = 0; i < arr.length; i++) {
                           
                            console.log(arr[i]);
                        }
                    }
                   
                });


            });
        });
    </script>
</body>
</html>
