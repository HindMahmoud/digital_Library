//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace digital_Library.modals
{
    using System;
    using System.Collections.Generic;
    
    public partial class requestTable
    {
        public int uniqe_ID { get; set; }
        public Nullable<int> student_id { get; set; }
        public string requestId { get; set; }
        public string fawryRefNumber { get; set; }
        public string merchantRefNumber { get; set; }
        public string customerMobile { get; set; }
        public Nullable<double> paymentAmount { get; set; }
        public Nullable<double> orderAmount { get; set; }
        public Nullable<double> fawryFees { get; set; }
        public string orderStatus { get; set; }
        public string paymentMethod { get; set; }
    }
}
