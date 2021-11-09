using digital_Library.modals;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace digital_Library
{
    public partial class RejectedStu : System.Web.UI.Page
    {
        digitalLibEntities dn = new digitalLibEntities();
        public List<student> rejectStutends = new List<student>();
        protected void Page_Load(object sender, EventArgs e)
        {
            rejectStutends = (from m in dn.students where m.status == 3&&m.student_file!=null select m).ToList();
        }

        protected void btn_ServerClick(object sender, EventArgs e)
        {

        }
    }
}