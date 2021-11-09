using digital_Library.modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digital_Library
{
    public partial class ULogin : System.Web.UI.Page
    {
        digitalLibEntities db = new digitalLibEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userName"] = null;
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            var allusers = db.users.Where(a => a.name == fname.Value).FirstOrDefault();
            if (allusers != null)
            {
                if (pass.Value == allusers.password)
                { Session["userName"] = allusers.name;Response.Redirect("dashboard.aspx"); }
                else { errorlbl.Text = "خطأ في الرقم السري"; errorlbl.Visible = true; }
            }
            else { errorlbl.Text = "خطأ في اسم المستخدم"; errorlbl.Visible = true; }


        }
    }
}