using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using digital_Library.modals;
using System.Web.Services;

namespace digital_Library
{
    public partial class print : System.Web.UI.Page
    {
        digitalLibEntities dd = new digitalLibEntities();
        public int id_efada = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                id_efada = int.Parse(Session["id"].ToString());
                GetData(id_efada);
            }
            else Response.Redirect("Login.aspx");
        }
        private void GetData(int id)
        {
            var stu = (from m in dd.students where m.id_student == id &&m.status==4 select m).FirstOrDefault();
            if (stu != null)
            {
                ara_add.InnerText = stu.arabic_address;
                eng_add.InnerHtml = stu.eng_add;
                int? idd = stu.id_student;
                facultyname.InnerHtml = (getfacultyName(idd)).ToString();
                dep.InnerHtml = stu.department;
                deg.InnerHtml = stu.degree_academic;
                search.InnerHtml = stu.name_student;
                sdate.InnerHtml =" "+stu.search_date;


            }
            else Response.Redirect("index.aspx");

        }

        private string getfacultyName(int? f_id)
        {
            string fname = (from n in dd.faculties where n.id==f_id select n.faculty_name).FirstOrDefault();
            return fname;
        }


        [WebMethod]
        public static void printfunction()
        {
             digitalLibEntities dbs = new digitalLibEntities();
                int idnew =int.Parse(HttpContext.Current.Session["id"].ToString());
                var d = dbs.students.Where(a => a.id_student == idnew).FirstOrDefault();
                if (d != null)
                {
                    d.status=5;
                    dbs.SaveChanges();

                }
        }

        
    }
}