using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace digital_Library
{
    public class CallBackRequest
    {
        [JsonProperty("requestId")]
        public string requestId { get; set; }
        [JsonProperty("fawryRefNumber")]
        public string fawryRefNumber { get; set; }
        [JsonProperty("merchantRefNumber")]
        public string merchantRefNumber { get; set; }
        [JsonProperty("customerMobile")]
        public string customerMobile { get; set; }
        [JsonProperty("customerMail")]
        public string  customerMail { get; set; }
        [JsonProperty("paymentAmount")]
        public float paymentAmount { get; set; }
        [JsonProperty("orderAmount")]
        public float orderAmount { get; set; }
        [JsonProperty("fawryFees")]
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