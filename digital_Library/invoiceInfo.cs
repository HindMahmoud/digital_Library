using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digital_Library
{
    public class invoiceInfo
    { public string number;
        public string businessRefNumber;
        public DateTime? dueDate { get; set; }
        public string expiryDate { get; set; }
    }
}