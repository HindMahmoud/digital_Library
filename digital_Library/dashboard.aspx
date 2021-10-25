<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="digital_Library.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>المكتبه الرقمية</title>
      <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
     <link rel="stylesheet" href="//cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    
    <link rel="stylesheet" href="css/bootstrap-rtl.css"/>
    
    <link href="vendor/vendorindex/font-awesome-4.7/css/font-awesome.css" rel="stylesheet" />
  <%--  <link rel="stylesheet" href="css/style1.css"/>--%>
   <style>
       body {
            background-color: #f1eff0;
       }
       #example_wrapper{border-radius: 3px;
    padding: 11px;
    background: white;}
       .sorting {
       padding-left:15px !important}

   </style>
</head>
    
<body>
    <form id="form1" runat="server">
    <div>
         <h1 class="text-center header"> ادارة المكتبة الرقمية بجامعة سوهاج </h1>
           

                          <div class="container py-5">
  
  <div class="row py-5">
    <div class="col-lg-12 mx-auto">
      <div class="card rounded shadow border-0">
        <div class="card-body p-5 bg-white rounded">
          <div class="table-responsive">
            <table id="example" style="width:100%" class="table table-striped table-bordered">
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
                </tr>
              </thead>
                <tbody>
             <%if (all != null)
    {
        foreach (var i in all) {
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
                   </tr>
                   <% }} %>
                </tbody>
            </table>
          </div>
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
                $('#example').DataTable();
               
                 });
        });
    </script>
</body>
</html>
