using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digital_Library
{
    public class fawrypay_request
    {
        public string merchantCode { get; set; }
        public string merchantRefNumber { get; set; }
        public string signature { get; set; }
    }
}