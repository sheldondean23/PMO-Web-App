//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PMOWebsite.Models.db
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblProjectPurpose
    {
        public int ProjectPurposeID { get; set; }
        public int ProjectID { get; set; }
        public string Comments { get; set; }
        public string FutureState { get; set; }
    
        public virtual tblProjectInformation tblProjectInformation { get; set; }
    }
}