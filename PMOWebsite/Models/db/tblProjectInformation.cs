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
    
    public partial class tblProjectInformation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblProjectInformation()
        {
            this.tblProjectBudgets = new HashSet<tblProjectBudget>();
            this.tblProjectCategories = new HashSet<tblProjectCategory>();
            this.tblProjectDates = new HashSet<tblProjectDate>();
            this.tblProjectFacilities = new HashSet<tblProjectFacility>();
            this.tblProjectFeedbacks = new HashSet<tblProjectFeedback>();
            this.tblProjectResources = new HashSet<tblProjectResource>();
            this.tblProjectPurposes = new HashSet<tblProjectPurpose>();
            this.tblProjectStatusUpdates = new HashSet<tblProjectStatusUpdate>();
        }
    
        public int ProjectID { get; set; }
        public string ProjectName { get; set; }
        public Nullable<int> HSISPrimaryLeadID { get; set; }
        public Nullable<int> HSISSecondaryLeadID { get; set; }
        public int ProjectRequestTypeID { get; set; }
        public Nullable<int> ProjectSizeID { get; set; }
        public int ProjectRequesterID { get; set; }
        public Nullable<int> ProjectPriorityID { get; set; }
        public Nullable<int> ProjectStatusID { get; set; }
        public string DepartmentOfRequest { get; set; }
        public Nullable<double> ProjectLaborHours { get; set; }
        public Nullable<int> ProjectRankingScore { get; set; }
        public string ProjectSubmitter { get; set; }
        public string ProjectFOPALnumber { get; set; }
    
        public virtual tblHSISPrimaryLead tblHSISPrimaryLead { get; set; }
        public virtual tblHSISSecondaryLead tblHSISSecondaryLead { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectBudget> tblProjectBudgets { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectCategory> tblProjectCategories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectDate> tblProjectDates { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectFacility> tblProjectFacilities { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectFeedback> tblProjectFeedbacks { get; set; }
        public virtual tblProjectRequestType tblProjectRequestType { get; set; }
        public virtual tblProjectSize tblProjectSize { get; set; }
        public virtual tblProjectRequester tblProjectRequester { get; set; }
        public virtual tblProjectPriority tblProjectPriority { get; set; }
        public virtual tblProjectStatu tblProjectStatu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectResource> tblProjectResources { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectPurpose> tblProjectPurposes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblProjectStatusUpdate> tblProjectStatusUpdates { get; set; }
    }
}
