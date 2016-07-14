using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class ProjectList
    {
        public int projectID { get; set; }
        [DisplayName("Project Size")]
        public ProjectSize projectSize { get; set; }
        [Required(ErrorMessage = "Project Status is required!")]
        [DisplayName("Project Status")]
        public ProjectStatus projectStatus { get; set; }
        [Required(ErrorMessage = "HSIS Primary Lead is required")]
        [DisplayName("HSIS Primary Lead")]
        public ProjectHSISp hsisPrimaryLead { get; set; }
        [DisplayName( "HSIS Primary Lead")]
        public ProjectHSISs hsisSecondaryLead { get; set; }
        [DisplayName("Project Priority")]
        public ProjectPriority projectPriority { get; set; }
        [Required(ErrorMessage = "Request Type is required!")]
        [DisplayName("Project Request Type")]
        public ProjectRequestType projectRequestType { get; set; }
        [Required(ErrorMessage = "Project Name is Required!")]
        [DisplayName("Project Name")]
        public string projectName { get; set; }
        [DisplayName("Project Resources")]
        public string projectResouces { get; set; }
        [Required(ErrorMessage = "Department of Request is required!")]
        [DisplayName("Department of Request")]
        public string departmentOFRequest { get; set; }
        [Required(ErrorMessage = "Project Submitter is required!")]
        [DisplayName("Project Submitter")]
        public string projectSubmitter { get; set; }
        [Required(ErrorMessage = "Current State is required!")]
        [DisplayName("Current State")]
        public string currentState { get; set; }
        [Required(ErrorMessage = "Future State is required!")]
        [DisplayName("Future State")]
        public string futureState { get; set; }
        [DisplayName("All Status Updates")]
        public List<StatusUpdate> statusUpdates { get; set; }
        [DisplayName("Most recent Status Update")]
        public string mostResentuUpdate { get; set; }
        [Required(ErrorMessage = "Project Requester is required!")]
        [DisplayName("Project Requester")]
        public Requester requester { get; set; }
        [Required(ErrorMessage = "Project Labor Hours is required!")]
        [DisplayName("Project Labor Hours")]
        public Nullable<double> laborHr { get; set; }
        [Required(ErrorMessage = "Project Ranking is required!")]
        [DisplayName("Project Ranking")]
        public Nullable<int> ranking { get; set; }
        [Required(ErrorMessage = "Desired Budget is required!")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Please enter a valid number")]
        [DisplayName("Desired Budget")]
        public Nullable<int> desiredBudget { get; set; }
        [DisplayName("Actual Budget")]
        public virtual Nullable<int> actualBudget { get; set; }
        [DisplayName("Most Recent Status Update")]
        public Nullable<System.DateTime> statusUpdatedate { get; set; }
        [DisplayName("Scheduled Start Date")]
        public Nullable<System.DateTime> scheduledStartDate { get; set; }
        [DisplayName("Scheduled End Date")]
        public Nullable<System.DateTime> scheduledEndDate { get; set; }
        [DisplayName("Actual Start Date")]
        public Nullable<System.DateTime> actualStartDate { get; set; }
        [DisplayName("Actual End Date")]
        public Nullable<System.DateTime> actualEndDate { get; set; }
        [Required(ErrorMessage = "Requested Date is required!")]
        [DisplayName("Requested Date")]
        public Nullable<System.DateTime> requestedDate { get; set; }
        [DisplayName("Contacted Date")]
        public Nullable<System.DateTime> contactedDate { get; set; }
        [DisplayName("Archive Date")]
        public Nullable<System.DateTime> archiveDate { get; set; }
        [DisplayName("Facilities")]
        public IList<Facility> AvaliableFacilities { get; set; }
        [DisplayName("Categories")]
        public IList<Category> AvaliableCategories { get; set; }
        [Required(ErrorMessage = "Facilities is required!")]
        [DisplayName("Affected Facilities")]
        public IList<Facility> SelectedFacilities { get; set; }
        [Required(ErrorMessage = "Categories is required!")]
        [DisplayName("Affected Categories")]
        public IList<Category> SelectedCategories { get; set; }

        //Helpers
        public string[] CategoryIDs { get; set; }
        public string[] FacilityIDs { get; set; }
    }
    
}