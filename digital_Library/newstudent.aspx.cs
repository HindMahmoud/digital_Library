using digital_Library.modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digital_Library
{
    public partial class newstudent : System.Web.UI.Page
    {
        digitalLibEntities db = new digitalLibEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["id"] = null;
        }

        protected void Newconfirm_Click(object sender, EventArgs e)
        {
            var allnatinalIds = db.students.Where(a => a.national_id == nationalId.Value).FirstOrDefault();
            if (allnatinalIds != null) // already registered
            {
                msg.Text = "هذالرقم القومي موجود بالفعل";
                msg.Visible = true; RegularExpressionValidator5.Visible = false;

            }
            else
            {
                string newnational = toEnglishNumber(nationalId.Value);
                student s = new student
                {
                    national_id = newnational,
                    password_student = pass.Value,
                    phone=phonetxt.Value,
                    name_student=nametxt.Value

                };
                db.students.Add(s);
                db.SaveChanges();
                Session["id"] = s.id_student;
                Response.Redirect("index.aspx");
            }

        }
        public string toEnglishNumber(string input)
        {
            string EnglishNumbers = "";

            for (int i = 0; i < input.Length; i++)
            {
                if (Char.IsDigit(input[i]))
                {
                    EnglishNumbers += char.GetNumericValue(input, i);
                }
                else
                {
                    EnglishNumbers += input[i].ToString();
                }
            }
            return EnglishNumbers;
        }

    }
}