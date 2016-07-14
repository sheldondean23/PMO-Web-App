using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class ProjectStatus
    {
        public int id { get; set; }
        [Required(ErrorMessage = "Project Status is required!")]
        [DisplayName("Project Status")]
        public string name { get; set; }
    }
}