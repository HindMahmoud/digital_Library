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
    public partial class dashboard : System.Web.UI.Page
    {
        digitalLibEntities dn = new digitalLibEntities();
       public List<student> all = new List<student>();
        protected void Page_Load(object sender, EventArgs e)
        {
             all = (from m in dn.students select m).ToList();

        }

        [WebMethod]
        public static void finalAcceptStuFun(int[] stuIDs)
        {
            digitalLibEntities db = new digitalLibEntities();
            for (int i = 0; i < stuIDs.Length; i++)
            {
                int id = stuIDs[i];
                var acceptedstu = (from d in db.students where d.id_student == id select d).FirstOrDefault();
                if (acceptedstu != null)
                {
                    acceptedstu.status = 4;
                    db.SaveChanges();
                }
            }

        }

   }
}