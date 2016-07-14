using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class StatusUpdate
    {
        public int ProjectId { get; set; }
        [DisplayName("Update Date")]
        public Nullable<System.DateTime> date { get; set; }
        [Required(ErrorMessage = "Status Update is Required!")]
        [DisplayName("Status Update")]
        public string update { get; set; }
    }
}