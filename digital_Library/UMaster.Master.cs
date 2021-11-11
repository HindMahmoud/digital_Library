using digital_Library.modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digital_Library
{
    public partial class UMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            digitalLibEntities db = new digitalLibEntities();
            if (Session["userName"] == null)
            {
                Response.Redirect("ULogin.aspx");
            }

        }
    }
}