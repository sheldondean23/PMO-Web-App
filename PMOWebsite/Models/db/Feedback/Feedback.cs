using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.Feedback
{
    public class Feedback
    {
        public int? ProjectID { get; set; }
        [Required(ErrorMessage = "Please enter a project name!")]
        public string ProjectName { get; set; }
        [Required(ErrorMessage = "Please enter a project submitter name!")]
        public string SubmitterName { get; set; }
        [Required(ErrorMessage = "Please enter a project submitter email!")]
        [EmailAddress]
        public string SubmitterEmail { get; set; }
        [Required(ErrorMessage = "Please enter the department of the submitter!")]
        public string Department { get; set; }
        public Question Question1 { get; set; }
        public Question Question2 { get; set; }
        public Question Question3 { get; set; }
        public Question Question4 { get; set; }
        public Question Question5 { get; set; }
        public Question Question6 { get; set; }
        public Question Question7 { get; set; }
        public Question Question8 { get; set; }
        public Question Question9 { get; set; }
    }
}