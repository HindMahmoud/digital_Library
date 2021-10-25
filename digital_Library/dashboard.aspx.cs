using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using digital_Library.modals;

namespace digital_Library
{
    public partial class dashboard : System.Web.UI.Page
    {
        digitalLibEntities dn = new digitalLibEntities();
       public List<student> all = new List<student>();
        protected void Page_Load(object sender, EventArgs e)
        {
             all = (from m in dn.students select m).ToList();

        }
    }
}