using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using digital_Library.modals;


namespace digital_Library
{
    public class ValuesController1 : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post(int paidStatus,int paymentID,string merchantRefNum,string messageSignature)
        {
            digitalLibEntities db = new digitalLibEntities();
            var customstu = (from m in db.students where m.refnumber==merchantRefNum select m).FirstOrDefault();
            if (customstu == null)
            {

            } 
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}