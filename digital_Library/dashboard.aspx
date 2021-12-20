<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UMaster.Master" CodeBehind="dashboard.aspx.cs" Inherits="digital_Library.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        .icon_container {

	display: inline-block;
  vertical-align: top;
}
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                                <td><input type="checkbox" name="t" class="alert-info checkbox ch" id='<%=i.id_student %>' data-id='<%=i.id_student %>'/></td>
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
                                               <td>
                                                   <%if (i.status == 2 || i.status == 4 || i.status == 5)
                                                       {
                                                           Response.Write("تم القبول");
                                                       %><div class="icon_container" style="float : left" ><input type="button" class="btn lg btn-danger"  id="ReDoAcc_<%=i.id_student%>" value="تراجع"/></div> <%
                                                       }
                                                       else if (i.status == 3)
                                                       {
                                                          Response.Write("تم الرفض");
                                                          %> <div class="icon_container" style="float : left" ><input type="button" class="btn lg btn-success"  id="ReDoRej_<%=i.id_student%>" value="نراجع"/></div>  <%
                                                       }
                                                       else
                                                       {
                                                        %>
                                                        <div class="inline" style="width: 220px" >
                                                        <div class="icon_container" style="float: right" ><input type="button" class="btn lg btn-success" id="Acc_<%=i.id_student%>" value="قبول" onclick="display();"/></div>
                                                        <div class="icon_container" style="float : left" ><input type="button" class="btn lg btn-danger"  id="Rej_<%=i.id_student%>" value="رفض"/></div>

                                                   </div> <% } %></td>
                                            </tr>
                                            <% }
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
       <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
     <script>

        $(function () {
            $(document).ready(function () {
              var Otables=  $('#example').DataTable();
               
              var allPages = Otables.cells().nodes();
                $("#select").on("click", function () {
              
                    if ($(this).hasClass('allChecked')) {
                        $(allPages).find('input[type="checkbox"]').prop('checked', false);
                    } else {
                        $(allPages).find('input[type="checkbox"]').prop('checked', true);
                    }
                    $(this).toggleClass('allChecked');
                
                });

                /*function stat_of_stud() {
                    var restorebody = document.body.innerHTML;
                    var printedcontent = document.getElementById("printedtable").innerHTML;
                    
                    //if (style.styleSheet) {
                    //    style.styleSheet.cssText = css;
                    // } else {
                    //    style.appendChild(document.createTextNode(css));
                    // }

                    // head.appendChild(style);
                    window.print();
                    document.body.innerHTML = restorebody;
                    document.body.style.backgroundColor = "#eae8e8";
                    location.href = location.href;

                } */

                function display(btnClicked) {
                    alert($(btnClicked).attr('id'));
                    $(btnClicked).hide();
                }


                var arr = [];
                var id_stu;
               
                $('body').on('change','input:checked',function () {
                    var ischecked = $(this).is(':checked');
                    if (ischecked) {
                        id_stu = $(this).attr('id');
                        var exist = arr.indexOf(id_stu);
                        if (exist == -1) { arr.push(id_stu); };
                    }
                });
                $("body input:checkbox").click(function () {
                    var ischecked = $(this).is(':checked');
                    if (!ischecked)
                        arr.pop($(this).attr('id'));
                });
                $("#accept").on("click", function () {
                    if (arr.length > 0) {
                       // console.log(arr);
                        $.ajax({
                                    type: 'POST',
                                    url: 'dashboard.aspx/finalAcceptStuFun',
                                    contentType: "application/json; charset=utf-8",
                                    data:JSON.stringify({ stuIDs: arr }),
                                    dataType: 'json',
                                    success: function () {
                                        alert(' تم الحفظ');
                                    }
                                       , faild: function () {
                                           alert('لم يتم الحفظ');
                                       }
                                });


                    }
                   
                });


            });
        });
     </script>
 </asp:Content>
