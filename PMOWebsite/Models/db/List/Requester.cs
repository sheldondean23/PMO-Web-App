using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class Requester
    {
        public int id { get; set; }
        [Required(ErrorMessage = " Requester Name is required!")]
        [DisplayName("Requester Name")]
        public string name { get; set; }
        [Required(ErrorMessage = " Requester Email is required!")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [DisplayName("Requester Email")]
        public string email { get; set; }
        [Required(ErrorMessage = " Requester Phone Number is required!")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Please enter a valid phone number")]
        [DisplayName("Requester Phone Number")]
        public string phone { get; set; }
    }
}