using digital_Library.modals;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace digital_Library
{
   
    public class VController : ApiController
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
        // public bool Post([FromUri]string paidStatus,[FromUri] string requestId, [FromUri]string merchantRefNum,[FromUri] string messageSignature, [FromUri]float paymentAmountvar,[FromUri] float orderAmountvar, [FromUri]float fawryFeesvar,[FromUri] string paymentMethodvar)
//         else
//                { return Request.CreateErrorResponse(HttpStatusCode.NotFound, "the response is already paid"); }
//}
//                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "the studnet is not found"); 
//            }
[HttpPost]
        // public HttpResponseMessage Post([FromUri]requestCallBack s)
        public void Post([FromUri] WebClient sj)
        {
            Dictionary<string, bool> operations = new Dictionary<string, bool>()
            {
                { "success",true}
            };

            try
            {

                //var values = JsonConvert.DeserializeObject<Dictionary<CallBackRequest, string>>(sj);
                var json = sj.DownloadString("url");
                digitalLibEntities db = new digitalLibEntities();

                var message = Request.CreateResponse(HttpStatusCode.OK, operations);
            }
            //    string ss = s.merchantRefNumber;

            //    String[] spearator = { "'" };
            //    String[] strlist = ss.Split(spearator,
            //  StringSplitOptions.RemoveEmptyEntries);
            //    string replacedtxt = ss.Replace("\"", "");
            //    String str = replacedtxt;
            //    string orderstatusReplacedtxt = s.orderStatus.Replace("\"", "");
            //    var MerchentNumber = (from m in db.merchent_ref_number where m.merchent_ref_num == str select m).FirstOrDefault();
            //    if (MerchentNumber != null)
            //    {
            //        switch (orderstatusReplacedtxt)
            //        {
            //            case "PAID":
            //                {
            //                    if (MerchentNumber.PaidStatus != "PAID")
            //                    {
            //                        createNewRequest(MerchentNumber.merchent_ref_num, s.requestId, s.paymentAmount, s.orderAmount, s.fawryFees, orderstatusReplacedtxt, s.paymentMethod);

            //                        break;

            //                    }
            //                    else
            //                    {
            //                        break;
            //                    }

            //                }

            //            default:
            //                {
            //                    createNewRequest(MerchentNumber.merchent_ref_num, s.requestId, s.paymentAmount, s.orderAmount, s.fawryFees, orderstatusReplacedtxt, s.paymentMethod);
            //                    break;
            //                }

            //        }
            //       /* return true;*///message;//true;
            //    }
            //    else
            //    {
            //        /*return false;*///Request.CreateErrorResponse(HttpStatusCode.NotFound, "the student is not found");
            //    }

            //}


            catch (Exception ex)
            {
                var badmessage = Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
                // return false;//badmessage;
            }
           
        }

       

        public void createNewRequest(string merchentNumber,string req,float pay,float orderamount,float fees,string orderstat,string paymethod)
        {
            digitalLibEntities db = new digitalLibEntities();
            {
                var customstu = db.merchent_ref_number.Where(a => a.merchent_ref_num == merchentNumber).FirstOrDefault();
                if (customstu != null)
                {
                    var t = db.students.Where(a => a.id_student == customstu.id_stu).FirstOrDefault();

                    if (orderstat == "PAID")
                    {
                        t.status = 0;
                        t.Flag_pay = true;
                        customstu.date_pay = DateTime.Now.ToString();
                        db.SaveChanges();
                    }
                    customstu.PaidStatus =orderstat;
                    requestTable newreq = new requestTable
                    {
                        student_id = t.id_student,
                        requestId = req,
                        fawryRefNumber = customstu.refNumber_fawry,
                        merchantRefNumber = customstu.merchent_ref_num,
                        customerMobile = t.phone,
                        paymentAmount = pay,
                        orderAmount = orderamount,
                        fawryFees = fees,
                        orderStatus = orderstat,
                        paymentMethod = paymethod,
                        

                    };
                    db.requestTables.Add(newreq);
                    db.SaveChanges();
                } }
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