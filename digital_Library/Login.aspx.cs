using digital_Library.modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digital_Library
{
    public partial class Login : System.Web.UI.Page
    {
        digitalLibEntities db = new digitalLibEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["id"] = null;
            //Response.Redirect("index.aspx");
            //msg.Visible = false;

        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            var allnatinalIds = db.students.Where(a => a.national_id == nationald.Value).FirstOrDefault();
            if (allnatinalIds != null) // already registered
            {

                string newpassword = toEnglishNumber(allnatinalIds.password_student);
                if (pass.Value == allnatinalIds.password_student || pass.Value == newpassword)
                { Session["id"] = allnatinalIds.id_student; Response.Redirect("index.aspx"); }
                else { msg.ForeColor = System.Drawing.Color.Red; msg.Text = "خطأ في الرقم السري"; msg.Visible = true; RegularExpressionValidator5.Visible = false; forget.Visible = true; }
            }
            else { msg.ForeColor = System.Drawing.Color.Red; msg.Text = "لا يوجد حساب مسبق يرجى انشاء حساب جديد"; msg.Visible = true; RegularExpressionValidator5.Visible = false; }
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