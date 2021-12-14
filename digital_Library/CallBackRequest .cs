using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace digital_Library
{
    public class CallBackRequest
    {
        public string requestId { get; set; }
        public string fawryRefNumber { get; set; }
        public string merchantRefNumber { get; set; }
        public string customerMobile { get; set; }
        public string  customerMail { get; set; }
        public float paymentAmount { get; set; }
        public float orderAmount { get; set; }
        public float fawryFees { get; set; }
        public string shippingFees { get; set; }
        public string orderStatus { get; set; }
        public string paymentMethod { get; set; }
        public string messageSignature { get; set; }
        public string orderExpiryDate { get; set; }
        public itemDetails[] orderItems { get; set; }
        public threeDSInfo[] threeDSInfo { get; set; }
        public invoiceInfo[] invoiceInfo { get; set; }

    }
}