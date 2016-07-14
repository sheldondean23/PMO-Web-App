using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db
{
    public class ProjetToAdd
    {
        [Required]
        [Display(Name = "Project Name")]
        public string ProjectName { get; set; }
        [Required]
        [Display(Name = "Primary Lead*")]
        public string HSISPrimaryLead { get; set; }
        [Required]
        [Display(Name = "Request Type*")]
        public string ProjectRequestType { get; set; }
        [Display(Name = "Size")]
        public string ProjectSize { get; set; }
        [Required]
        [Display(Name = "Requester Name*")]
        public string ProjectRequesterName { get; set; }
        [Required]
        [Display(Name = "Requester Email*")]
        public string ProjectRequesterEmail { get; set; }
        [Required]
        [Display(Name = "Requester Phone*")]
        public int ProjectRequesterPhone { get; set; }
        [Required]
        [Display(Name = "Priority*")]
        public string ProjectPriority { get; set; }
        [Required]
        [Display(Name = "Status*")]
        public string ProjectStatus { get; set; }
        [Display(Name = "Resorces")]
        public string ProjectResorces { get; set; }
        [Required]
        [Display(Name = "Department Of Request*")]
        public string DepartmentOfRequest { get; set; }
        [Display(Name = "Labor Hours")]
        public Nullable<int> ProjectLaborHours { get; set; }
        [Required]
        [Display(Name = "Ranking Score*")]
        public Nullable<int> ProjectRankingScore { get; set; }
        [Required]
        [Display(Name = "Submitter*")]
        public string ProjectSubmitter { get; set; }
        [Display(Name = "Schedualed Start Date")]
        public Nullable<System.DateTime> SchedualedStartDate { get; set; }
        [Display(Name = "Schedualed End Date")]
        public Nullable<System.DateTime> SchedualedEndDate { get; set; }
        [Display(Name = "Actual Start Date")]
        public Nullable<System.DateTime> ActualStartDate { get; set; }
        [Display(Name = "Actual End Date")]
        public Nullable<System.DateTime> ActualEndDate { get; set; }
        [Required]
        [Display(Name = "Requested Date*")]
        public System.DateTime RequestedDate { get; set; }
        [Display(Name = "Contacted Date")]
        public Nullable<System.DateTime> ContactedDate { get; set; }
        [Display(Name = "Archive Date")]
        public Nullable<System.DateTime> ArchiveDate { get; set; }
        [Required]
        [Display(Name = "Comments*")]
        public string Comments { get; set; }
        [Required]
        [Display(Name = "Future State*")]
        public string FutureState { get; set; }
        [Required]
        [Display(Name = "Desired Budget*")]
        public int ProjectDesiredBudget { get; set; }
        [Display(Name = "Actual Budget")]
        public Nullable<int> ProjectActualBudget { get; set; }
        [Required]
        [Display(Name = "Facilities*")]
        public IEnumerable<string> Facilities { get; set; }
        [Required]
        [Display(Name = "Categories*")]
        public IEnumerable<string> Categories { get; set; }
    }
}