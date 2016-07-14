using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class ProjectHSISs
    {
        public int id { get; set; }
        [DisplayName("HSIS Primary Lead")]
        public string name { get; set; }
    }
}