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
    
    public partial class tblProjectResource
    {
        public int ConvertionID { get; set; }
        public int ResourceID { get; set; }
        public int ProjectID { get; set; }
    
        public virtual tblProjectInformation tblProjectInformation { get; set; }
        public virtual tblResource tblResource { get; set; }
    }
}
