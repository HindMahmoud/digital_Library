<%@ Page Title="" Language="C#" MasterPageFile="~/UMaster.Master" AutoEventWireup="true" CodeBehind="AcceptedStu.aspx.cs" Inherits="digital_Library.AcceptedStu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                               <div class="table-responsive">
                                  <table id="example"  class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
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
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%if (acceptStutends != null)
                                            {
                                                foreach (var i in acceptStutends)
                                                {
                                            %>
                                            <tr>
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
                                                
                                            </tr>
                                            <% }
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
    
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.print.min.js" > </script>
    <script>
      
        $(function () {
            $(document).ready(function () {
                var Otables = $('#example').DataTable(
                    {
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'print',
                                customize: function (win) {
                                    $(win.document.body)
                                        .css('font-size', '10pt')
                                        .prepend(
                                            '<img src="images/i.png" style="position:absolute; top:0; left:0;" />'
                                        );

                                    $(win.document.body).find('table')
                                        .addClass('compact')
                                        .css('font-size', 'inherit');
                                }
                            }
                        ]
                });
                $('.buttons-print>span').text('طباعة');
              
            });
        });
    </script>
</asp:Content>
