using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class ProjectHSISp
    {
        public int id { get; set; }
        [Required(ErrorMessage = "HSIS Primary Lead is required")]
        [DisplayName("HSIS Primary Lead")]
        public string name { get; set; }
    }
}