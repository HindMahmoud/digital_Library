using digital_Library.modals;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;


namespace digital_Library
{
   
    public class VController : ApiController
    {
        digitalLibEntities db = new digitalLibEntities();

        // GET api/<controller>
        public string Get(string merchent_ref_num,string signture)
        {
            string replacedtxt = merchent_ref_num.Replace("\"", "");
            string replacedtxt2 = signture.Replace("\"", "");
            PostJson("https://atfawry.fawrystaging.com/ECommerceWeb/Fawry/payments/status/v2", new fawrypay_request
            {
                merchantCode = "rfM9nzFIxkyj6XXRxrDE/g==",
                merchantRefNumber = replacedtxt,
                signature = replacedtxt2
            });

            return "";
        }
        private static void PostJson(string uri, fawrypay_request postParameters)
        {
            string postData = JsonConvert.SerializeObject(postParameters);
            byte[] bytes = Encoding.UTF8.GetBytes(postData);
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(uri);
            httpWebRequest.Method = "GET";
            httpWebRequest.ContentLength = bytes.Length;
            httpWebRequest.ContentType = "text/json";
            using (Stream requestStream = httpWebRequest.GetRequestStream())
            {
                requestStream.Write(bytes, 0, bytes.Count());
            }
            var httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            if (httpWebResponse.StatusCode != HttpStatusCode.OK)
            {
                string message = String.Format("GET failed. Received HTTP {0}", httpWebResponse.StatusCode);
                throw new ApplicationException(message);
            }
        }
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //string ss = s.merchantRefNumber;
        //String[] spearator = { "'" };
        //String[] strlist = ss.Split(spearator,
        //StringSplitOptions.RemoveEmptyEntries);
        //string replacedtxt = ss.Replace("\"", "");
        //String str = replacedtxt;
        //string orderstatusReplacedtxt = s.orderStatus.Replace("\"", "");

        //}

        [HttpPost]
        public HttpResponseMessage Post()//فاضل بس اعرف امتي يرجع new ,وامتي يرجع paid
        {
           
            Dictionary<string, bool> operations = new Dictionary<string, bool>()
            {
                { "success",true}
             
            };
            try
            {
              String json=  HttpContext.Current.Request.QueryString["CallBackRequest"].ToString();
                CallBackRequest s = JsonConvert.DeserializeObject <CallBackRequest> (json);
                 var message = Request.CreateResponse(HttpStatusCode.OK, operations);
                 var MerchentNumber = (from m in db.merchent_ref_number where m.merchent_ref_num == s.merchantRefNumber select m).FirstOrDefault();
                if (MerchentNumber != null)
                {
                    switch (s.orderStatus)
                    {
                        case "PAID":
                            {
                                if (MerchentNumber.PaidStatus != "PAID")
                                {
                                    createNewRequest(MerchentNumber.merchent_ref_num, s.requestId, s.paymentAmount, s.orderAmount, s.fawryFees, s.orderStatus, s.paymentMethod);
                                    break;
                                }
                                else
                                {
                                    break;
                                }

                            }

                        default:
                            {
                                createNewRequest(MerchentNumber.merchent_ref_num, s.requestId, s.paymentAmount, s.orderAmount, s.fawryFees, s.orderStatus, s.paymentMethod);
                                break;
                            }

                    }
                    return message;
                }
                else
                {
                    return message;
                }
              
            }
            catch (Exception ex)
            {
                var badmessage = Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
                return badmessage;
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