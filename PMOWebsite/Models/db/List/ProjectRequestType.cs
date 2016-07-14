using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class ProjectRequestType
    {
        public int id { get; set; }
        [Required(ErrorMessage = "Request Type is required!")]
        [DisplayName("Project Request Type")]
        public string name { get; set; }
    }
}