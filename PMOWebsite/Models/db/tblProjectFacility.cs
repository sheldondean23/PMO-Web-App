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
    
    public partial class tblProjectFacility
    {
        public int ConvertionID { get; set; }
        public int FacilityID { get; set; }
        public int ProjectID { get; set; }
    
        public virtual tblFacility tblFacility { get; set; }
        public virtual tblProjectInformation tblProjectInformation { get; set; }
    }
}
