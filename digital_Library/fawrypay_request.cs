using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digital_Library
{
    public class fawrypay_request
    {
        public string merchantCode { get; set; }
        public string merchantRefNum { get; set; }
        public string signature { get; set; }
        public string customerName { get; set; }
        public string customerMobile { get; set; }
        public string customerEmail { get; set; }
        public string customerProfileId { get; set; }
        public string amount { get; set; }
        public string paymentExpiry { get; set; }
        public string currencyCode { get; set; }
        public string language { get; set; }
        public ChargeItems chargeItems;
         public string payment_method { get; set; }
        public string description { get; set; }
    }
}