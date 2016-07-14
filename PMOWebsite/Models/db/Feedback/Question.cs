using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.Feedback
{
    public class Question
    {
        public Question()
        {}

        public Question(string aquestion)
        {
            question = aquestion;
        }

        private HSISProjectsEntities db = new HSISProjectsEntities();
        public int[] RankChoices = new int[5] { 1, 2, 3, 4, 5 };
        [Required(ErrorMessage = "Please answer the above question!")]
        public string answer { get; set; }
        public string question { get; set; }

        public int? getID()
        {
            return db.tblFeedbackQuestions.Where(q => q.QuestionContent == question).Select(i => i.QuestionID).Single();
        }
    }
}