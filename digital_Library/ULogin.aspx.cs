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
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userName"] = null;
        }

        protected void confirm_Click(object sender, EventArgs e)
        {

        }
    }
}