using digital_Library.modals;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digital_Library
{
   
    public partial class index : System.Web.UI.Page
    {
        digitalLibEntities d = new digitalLibEntities();
      public  int id = 0;
        public string refunumber = "", stuname = "";
        public string nid = "";
        public string mobiletxt = "";
        public int status=-1;
        public bool flagPaid = false;
        public student stu = new student();
        public string orderNumber = "";
                  
       protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                id = int.Parse(Session["id"].ToString());
                stu = (from m in d.students where m.id_student == id select m).FirstOrDefault();
                nid = stu.national_id;
                mobiletxt = stu.phone;
               stuname = stu.name_student;
                var stu_ref = d.merchent_ref_number.Where(a => a.id_stu == stu.id_student).FirstOrDefault();
                if (stu_ref == null)
                {//he is first time to login 
                    int random_num = GET_RandomNumberFunction();
                    refunumber = RandomString() + random_num + stu.id_student.ToString() + RandomString();
                }
                else { fawerydiv.Attributes.Add("class", "top_rounded"); }

                if (stu.status != null && stu.Flag_pay != null)
                {//paid and have steps in progress 
                    status = int.Parse(stu.status.ToString());
                    flagPaid = true;
                }
                else if (stu.status == null && stu.Flag_pay != null)
                {//paid and hasn't any steps 
                    status = 0;
                }
            }
            else Response.Redirect("Login.aspx");
            
            alertmsg();
            if (!IsPostBack)
            {

               if (status > 0)
                {
                    Getdata();
                }
                if (status == 0 && flagPaid == true)
                { GetsomeStudata(); }
                PopulateDataList();
                PopulateDataList2();
            }
        }
        private void GetsomeStudata()
        {
            var stu = (from mn in d.students where mn.id_student == id select mn).FirstOrDefault();
            {if (stu != null)
                {
                    name.Value = stu.name_student;
                    mobtxt.Value = stu.phone;
                }
            }
        }
        #region Fulldata()
        private void Getdata()
        {

            var stu = (from mn in d.students where mn.id_student==id select mn).FirstOrDefault();
            if (stu.email_address != null && stu.faculty_id != null)
            {
                
                arabic_add.Value = stu.arabic_address;
                eng_add.Value = stu.eng_add;
                jobtxt.Value = stu.Job;
                jobplacetxt.Value = stu.Job_place;
                emtxt.Value = stu.email_address;
                supertxt.Value = stu.Supervisor;
                partenarstxt.Value = stu.Co_supervisor;
                titletxt.Value = stu.chart_title;
                browinput.Value = (from mm in d.faculties where mm.id == stu.faculty_id select mm.faculty_name).FirstOrDefault();
                deptxt.Value = stu.department;
                Divisiontxt.Value = stu.Division;
                spectxt.Value = stu.Specialization;
                academictxt.Value = stu.academic_year;
               
                //dergree 
                if (stu.degree_academic == "ماجستير")
                {
                    degree.SelectedValue = "1";
                }
                else degree.SelectedValue = "2";
                //university
                if (stu.iduniversity != 0)//new university
                {
                    radio2.Checked = true;
                    univ_new.Visible = true;
                    university_name.Value = (from mm in d.universities where mm.id_uni == stu.iduniversity select mm.name_univ).FirstOrDefault();
                }
                else { radio1.Checked = true; }


            }

          }


        #endregion
        #region alertmsg
        private void alertmsg()
        {
            /*(from v in d.students where v.id_student == id select v).FirstOrDefault();*/
            if (stu.Flag_pay == true && stu.status == null)//تم الدفع
            {
                Info.Text = " تم الدفع برجاء ادخل جميع البيانات بشكل صحيح وملأ جميع الحقول التي تحتوي علي *";
                fileup.Enabled = false;
                fawerydiv.Visible = false;
                Button1.CssClass = "notactive";
                Button1.Enabled = false;
            }
            else if (stu.Flag_pay != true)//لم يتم الدفع
            {

                fawerydiv.Visible = true;
                fileup.Enabled = false;
                formdiv.Disabled = false;
                submit.Enabled = false;
                submit.CssClass = "notactive";
                Button1.CssClass = "notactive";
                upfildiv.Visible = false;
                formdiv.Visible = false;
            }
            else if (stu.status == 1)//تم الدفع وملأ البيانات
            {
                Info.Text = "تم ارسال البيانات للموظف وجاري مراجعة البيانات انتظر النتيجة علي الموقع في خلال اسبوع";
                submit.Enabled = false;
                submit.CssClass = "notactive";
                Button1.CssClass = "notactive";
                Button1.Enabled = false;
                fawerydiv.Visible = false;
            }
            else if (stu.status == 2)//تم الرد بالموافقه من الموظف
            {
                if (!string.IsNullOrEmpty(stu.student_file))//accepts the data and file
                {
                    Info.Text = "تم قبولك برجاء طباعه الافادة خطوة رقم 5";
                    fileup.Enabled = true;
                    fawerydiv.Visible = false;
                    upfildiv.Disabled = false;
                    submit.Enabled = false;
                    submit.CssClass = "notactive";
                    Button1.Enabled = false;
                    Button1.CssClass = "notactive";
                   
                }
                else {//تم الرد بالموافقه علي الداتا فقط

                    Info.Text = "تم قبول بياناتك برجاء رفع الملف الخاص بالرساله";
                    fileup.Enabled = true;
                    fawerydiv.Visible = false;
                    upfildiv.Disabled = false;
                    submit.Enabled = false;
                    submit.CssClass = "notactive";
                    //Button1.Enabled = false;
                    //Button1.CssClass = "notactive";

                }

                  

            }
            else if (stu.status == 3)//تم الرد بالرفض من الموظف
            {
                if (!string.IsNullOrEmpty(stu.student_file))//refuse the file
                {
                    Info.Text = "تم رفض الملف الخاص بالرساله";
                    fileup.Enabled = true;
                    fawerydiv.Visible = false;
                    upfildiv.Disabled = false;
                    submit.Enabled = false;
                    submit.CssClass = "notactive";
                    Button1.Enabled = true;
                    Info.CssClass = "dangerInfo";

                }
                else
                {//تم الرد بالرفض علي الداتا فقط

                    Info.Text = "تم رفض بياناتك برجاء تعديل البيانات";
                    fileup.Enabled = true;
                    fawerydiv.Visible = false;
                    upfildiv.Disabled = false;
                    submit.Enabled = true;
                    Button1.Enabled = false;
                    Button1.CssClass = "notactive";

                }

            }

            else if (stu.status == 4)//تم رفع الملف
            {
                formdiv.Disabled = true;
                Info.Text = stu.notes + "تم رفع ملفك بنجاح";
                Info.CssClass = "fileclass";
                fileup.Enabled = false;
                fawerydiv.Visible = false;
                Button1.Enabled = false;
                Button1.CssClass = "notactive";
                submit.Enabled = false;
                submit.CssClass = "notactive";

            }
            else if (stu.status == 5)//الطباعه تمت S
            {
                
                Info.Text = "تم الانتهاء من جميع الخطوات";
                formdiv.Visible = false;
                upfildiv.Visible = false;
                fileup.Enabled = false;
                fawerydiv.Visible = false;
                Button1.Enabled = false;
                Button1.CssClass = "notactive";
                submit.Enabled = false;
                submit.CssClass = "notactive";

            }
        }
        #endregion

        #region function full datalists
        private void PopulateDataList()
        {
            var allfaculties = d.faculties.ToList();

            for (int i = 0; i <= allfaculties.Count-1; i++)
            {
                // ADD VALUES TO <datalist>.
                string name = allfaculties[i].faculty_name.ToString();
                int value = allfaculties[i].id;
                brow.InnerHtml = brow.InnerHtml + System.Environment.NewLine +
                    String.Format("<option id='{0}' value='{1}'>",value,name);
            }
        }
        private void PopulateDataList2()
        {
            var alluniv = d.universities.ToList();

            for (int i = 0; i <= alluniv.Count - 1; i++)
            {
                // ADD VALUES TO <datalist>.
                string name = alluniv[i].name_univ.ToString();
                int value = alluniv[i].id_uni;
                brow.InnerHtml = brow1.InnerHtml + System.Environment.NewLine +
                    String.Format("<option id='{0}' value='{1}'>", value, name);
            }
        }
        #endregion

       public static int GET_RandomNumberFunction()
        {
            Random tr = new Random();
            int r = tr.Next(100000, 999999);
            return r;
        }

        #region validation
        private string validfunction()
        {
            string error_msg = "";
            if (name.Value == "" || arabic_add.Value == "" || eng_add.Value == "" || mobtxt.Value == "" || emtxt.Value == "" || browinput.Value == "" || deptxt.Value == "" || Divisiontxt.Value == "" || spectxt.Value == "" || titletxt.Value == "" || supertxt.Value == "" || partenarstxt.Value == "")
            {
                error_msg = "برجاء ادخال جميع الحقول التي تحتوي علي *";
               
            }

           else if (radio1.Checked == false && radio2.Checked == false)
            {
                error_msg = "برجاءاختيار الجامعة المراد تسجيل نقطة البحث بها";
            }
            else if (radio2.Checked == true && university_name.Value == "")
            {
                error_msg = " برجاء كتابة الجامعة المراد تسجيل نقطة البحث بها";
            }

            return error_msg;

        }

        #endregion
        #region refnumber
        private static Random random = new Random();
        public static string RandomString()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, 1)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        #endregion

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string result = validfunction();
            if (result != "")
            {
                Response.Write("<script> alert('" + result + "');</script>");
                return;
            }

            //var specstu = d.students.Where(d => d.id_student == id).FirstOrDefault();

            stu.name_student = name.Value;
            stu.Job = jobtxt.Value;
            stu.Job_place = jobplacetxt.Value;
            stu.phone = mobtxt.Value;
            stu.email_address = emtxt.Value;
            stu.eng_add = eng_add.Value;
            stu.arabic_address = arabic_add.Value;
            stu.chart_title = titletxt.Value;
            stu.academic_year = academictxt.Value;
            stu.Co_supervisor = partenarstxt.Value;
            stu.Supervisor = supertxt.Value;
            stu.department = deptxt.Value;
            stu.Specialization = spectxt.Value;
            stu.Division = Divisiontxt.Value;
            stu.status = 1;//fill he's data
            
            if (radio2.Checked)
            { //insert into univ table 
                var matching_university = (from v in d.universities where v.name_univ.Contains(university_name.Value) select v).FirstOrDefault();
                if (matching_university != null)
                { //it exists
                    int datalist_id = matching_university.id_uni;
                }
                else
                {
                    //not exist
                    university i = new university
                    {
                        name_univ = university_name.Value
                    };
                    d.universities.Add(i);
                    d.SaveChanges();
                    stu.iduniversity = i.id_uni;
                }

            }
            else {
                stu.iduniversity = 0;
                stu.univ_name = "جامعة سوهاج";
            }
            //insert into faculty
            #region fauclty
            var matching_faculty = (from v in d.faculties where v.faculty_name.Contains(browinput.Value) select v).FirstOrDefault();
            if (matching_faculty != null)
            { //it exists
                int datalist_id = matching_faculty.id;
            }
            else
            {
                //not exist
                faculty i = new faculty
                {
                    faculty_name = browinput.Value
                };
                d.faculties.Add(i);
                d.SaveChanges();
                stu.faculty_id = i.id;
            }
            #endregion
            if (degree.SelectedValue != "")
            {
                if (degree.SelectedValue == "1")
                { stu.degree_academic = "ماجستير"; }
                else stu.degree_academic = "دكتوراة";
            }
           d.SaveChanges();
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (fileup.HasFiles)
            {
                string fileName = fileup.FileName;
                string ext = Path.GetExtension(fileup.FileName);
                if (ext != ".docx")
                { return; }

                if (stu.status==2)
                {
                    try
                        {
                            string NewFileName = stu.name_student + "_" + stu.chart_title ;
                            string path = Server.MapPath("~/sfiles/" + stu.degree_academic + "/"  + NewFileName);

                            if (File.Exists(path))
                            {
                                File.SetAttributes(path, FileAttributes.Normal);
                                File.Delete(path);

                            }

                            fileup.PostedFile.SaveAs(path);
                        stu.status = 4;
                        stu.student_file = NewFileName;
                        d.SaveChanges();
                        alertmsg();
                        //sucessdiv.Visible = true;
                        
                        string script = "window.onload = function(){var div= document.getElementById('sucessdiv');div.style.display='block';div.style.opacity = '1';setTimeout(function(){ div.style.opacity='0'; }, 1000);document.getElementById('li4').className ='active';document.getElementById('li4').getElementsByTagName('a').className ='active';}";

                        //string script2 = " ";
                        //ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script2, true);
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);


                    }
                        catch (Exception ex)
                        {
                            if (ex.Message == "Illegal characters in path.")
                            { Response.Write("<script>alert('برجاء تعديل اسمك لاسم بدون اي علامات تنصيص')</script>"); }
                            else
                            {
                                Response.Write("<script>alert('حجم الملف كبير')</script>");
                            }
                            

                        }
                    }


                }
            }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
       

        #region assignRefNumToDB
            [WebMethod]
        public static void assignRefNumToDB(string reff, string refFawry, string orderStatus,string signtureVar)
        {
            digitalLibEntities d = new digitalLibEntities();
           int id_user = int.Parse(HttpContext.Current.Session["id"].ToString());
            var r = (d.merchent_ref_number.Where(a=>a.id_stu==id_user)).FirstOrDefault();
            if (orderStatus == "PAID")
            {
                var student_updated = (d.students.Where(a => a.id_student == id_user)).FirstOrDefault();
                student_updated.Flag_pay = true;
                student_updated.status = 0;
                merchent_ref_number m = new merchent_ref_number
                {
                    id_stu=id_user,
                    merchent_ref_num=reff,
                    date_pay=DateTime.Now.ToString(),
                    PaidStatus="PAID",
                    signture=signtureVar,
                    refNumber_fawry=refFawry
                };
                d.merchent_ref_number.Add(m);
                    d.SaveChanges();
            }
            else {
                merchent_ref_number m = new merchent_ref_number
                {
                    id_stu = id_user,
                    merchent_ref_num = reff,
                   
                    signture = signtureVar,
                    refNumber_fawry = refFawry
                };
                d.merchent_ref_number.Add(m);
                d.SaveChanges();
            }
        }
        #endregion
    }
}