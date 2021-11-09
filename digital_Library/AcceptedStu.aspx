<%@ Page Title="" Language="C#" MasterPageFile="~/UMaster.Master" AutoEventWireup="true" CodeBehind="AcceptedStu.aspx.cs" Inherits="digital_Library.AcceptedStu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                                                <th>حالة الدفع</th>
                                                <th>الاطلاع علي الملف</th>
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
                                                <td><%=i.Flag_pay %></td>
                                                <td><a  target="_blank" href="~/sfiles/<%=i.student_file %>"></a></td>
                                              
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
              
            });
        });
    </script>
</asp:Content>
