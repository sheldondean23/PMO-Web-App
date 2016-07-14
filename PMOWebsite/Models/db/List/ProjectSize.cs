using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class ProjectSize
    {
        public int id { get; set; }
        [DisplayName("Project Size")]
        public string name { get; set; }
    }
}