using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PMOWebsite.Models.db;
using PMOWebsite.Services;
using PMOWebsite.Models.db.List;
using PMOWebsite.Models;
using System.Data.Entity.Core.Objects;
using PMOWebsite.Models.db.Feedback;
using MvcFlashMessages;
using System.ComponentModel;
using System.Reflection;

namespace PMOWebsite.Controllers
{ 
    public class ProjectsController : Controller
    {
        //private HSISProjectsTestEntities db = new HSISProjectsTestEntities();
        private HSISProjectsEntities db = new HSISProjectsEntities();
        private ProjectService service = new ProjectService();
        // GET: Projects
        public ActionResult Index(string list)
        {
            var projects = service.fillProjectList();
            string[] sort = projects.Select(p => p.projectName).ToArray();
            for (int i = 0; i < sort.Count(); i++)
            {
                sort[i] = sort[i].ToUpper().Substring(0,1);
            }
            Session["Filter"] = sort.Distinct().OrderBy(f=>f).ToArray();
            if (list == null)
            {
                return View(projects.OrderBy(p => p.projectName));
            }
            return View(projects.Where(p=>p.projectName.StartsWith(list))
                .OrderBy(p => p.projectName));
        }

        // GET: Projects/Details/5
        public ActionResult Details(int id)
        {
            var projects = service.fillProjectList();
            return View(projects.Where(p => p.projectID == id).Single());
        }

        // GET: Projects/Create
        public ActionResult Create()
        {
            Session["ProjectRequestType"] = service.geProjectRequestType();
            Session["ProjectPriority"] = service.getProjectPriority();
            ProjectList a = new ProjectList();
            a.AvaliableCategories = (from categories in db.tblCategories
                                     select new Category
                                     {
                                         id = categories.CategoryID,
                                         name = categories.CategoryName
                                     }).DefaultIfEmpty().ToList();
            a.AvaliableFacilities = (from facilities in db.tblFacilities
                                     select new Facility
                                     {
                                         id = facilities.FacitityID,
                                         name = facilities.FacitityName
                                     }).DefaultIfEmpty().ToList();
            return View(a);
        }

        // POST: Projects/Create
        [HttpPost]
        public ActionResult Create(ProjectList projectToAdd)
        {
            projectToAdd.requestedDate = DateTime.Now;
            ObjectParameter requesterID = new ObjectParameter("RequestID", typeof(int?));
            ObjectParameter projectID = new ObjectParameter("ProjectID", typeof(int?));
            try
            {
                db.sp_Requester_Update(projectToAdd.requester.name, projectToAdd.requester.email, projectToAdd.requester.phone, requesterID);
                db.SaveChanges();
                db.sp_Project_Insert(projectToAdd.projectName, null, null, projectToAdd.projectRequestType.id, null, Convert.ToInt32(requesterID.Value), projectToAdd.projectPriority.id, null, projectToAdd.departmentOFRequest, projectToAdd.laborHr, projectToAdd.ranking, projectToAdd.projectSubmitter,null, projectID);
                db.SaveChanges();
                db.sp_Budget_Insert(Convert.ToInt32(projectID.Value), projectToAdd.desiredBudget, projectToAdd.actualBudget);
                db.SaveChanges();
                db.sp_Dates_Insert(Convert.ToInt32(projectID.Value), projectToAdd.scheduledStartDate, projectToAdd.scheduledEndDate, projectToAdd.actualStartDate, projectToAdd.actualEndDate, projectToAdd.requestedDate, projectToAdd.contactedDate, projectToAdd.archiveDate);
                db.SaveChanges();
                db.sp_Purpose_Update(Convert.ToInt32(projectID.Value), projectToAdd.currentState, projectToAdd.futureState);
                db.SaveChanges();
                foreach (string id in projectToAdd.CategoryIDs)
                {
                    db.sp_Project_Category_Insert(Convert.ToInt32(projectID.Value), Convert.ToInt32(id));
                    db.SaveChanges();
                }
                foreach (string id in projectToAdd.FacilityIDs)
                {
                    db.sp_Project_Facility_Insert(Convert.ToInt32(projectID.Value), Convert.ToInt32(id));
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                var message = e.Message;
                this.Flash("error", "There was an error adding the project request! Please contact HSIS PMO Office.");
                return RedirectToAction("Create");
            }
        }

        // GET: Projects/Lifecycle/
        public ActionResult StatusUpdateAdd(int id)
        {
            StatusUpdate newStatusUpdate = new StatusUpdate();
            newStatusUpdate.ProjectId = id;
            return View(newStatusUpdate);
        }

        // POST: Projects/Edit/5
        [HttpPost]
        public ActionResult StatusUpdateAdd(StatusUpdate newStatusUpdate)
        {
            newStatusUpdate.date = DateTime.Now;
            try
            {
                db.sp_StatusUpdate_Insert(newStatusUpdate.ProjectId, newStatusUpdate.update, newStatusUpdate.date);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                var message = e.Message;
                this.Flash("error", "There was an error adding the status update! Please contact HSIS PMO Office.");
                return RedirectToAction("StatusUpdateAdd");
            }
        }

        // GET: Projects/Edit/5
        public ActionResult Edit(int id)
        {
            Session["HSISPrimaryLead"] = service.getHSISPrimaryLead();
            Session["ProjectRequestType"] = service.geProjectRequestType();
            Session["ProjectSize"] = service.getProjectSize();
            Session["ProjectPriority"] = service.getProjectPriority();
            Session["ProjectStatus"] = service.getProjectStatus();
            var projects = service.fillProjectList();
            return View(projects.Where(p => p.projectID == id).Single());
        }

        // POST: Projects/Edit/5
        [HttpPost]
        public ActionResult Edit(ProjectList projectToUpdate)
        {
            try
            {
                ObjectParameter requesterID = new ObjectParameter("RequestID", typeof(double?));

                db.sp_Requester_Update(projectToUpdate.requester.name, projectToUpdate.requester.email, projectToUpdate.requester.phone, requesterID);
                db.SaveChanges();
                db.sp_Project_Update(projectToUpdate.projectName, projectToUpdate.hsisPrimaryLead.id, projectToUpdate.hsisSecondaryLead.id, projectToUpdate.projectRequestType.id, projectToUpdate.projectSize.id, Convert.ToInt32(requesterID.Value), projectToUpdate.projectPriority.id, projectToUpdate.projectStatus.id, projectToUpdate.departmentOFRequest, projectToUpdate.laborHr, projectToUpdate.ranking, projectToUpdate.projectSubmitter,null, projectToUpdate.projectID);
                db.SaveChanges();
                db.sp_Budget_Update(projectToUpdate.projectID, projectToUpdate.desiredBudget, projectToUpdate.actualBudget);
                db.SaveChanges();
                db.sp_Dates_Update(projectToUpdate.projectID, projectToUpdate.scheduledStartDate, projectToUpdate.scheduledEndDate, projectToUpdate.actualStartDate, projectToUpdate.actualEndDate, projectToUpdate.requestedDate, projectToUpdate.contactedDate, projectToUpdate.archiveDate);
                db.SaveChanges();
                db.sp_Purpose_Update(projectToUpdate.projectID, projectToUpdate.currentState, projectToUpdate.futureState);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                var message = e.Message;
                this.Flash("error", "There was an error updating the project! Please contact HSIS PMO Office.");
                return RedirectToAction("Edit");
            }
        }

        // GET: Projects/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Projects/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Projects/HowTo/
        public ActionResult HowTo()
        {
            return View();
        }

        // GET: Projects/Lifecycle/
        public ActionResult Lifecycle()
        {
            return View();
        }

        // GET: Projects/Feedback/
        public ActionResult Feedback(int? id)
        {
            Feedback newFeedback = new Feedback();
            newFeedback.Question1 = new Question("Scope, completion criteria, and goals were clearly defined.");
            newFeedback.Question2 = new Question("The team, stakeholders, and yourself were kept informed of project status/progress.");
            newFeedback.Question3 = new Question("When issues were encountered, the issue was brought to light quickly, discussed openly with the team in a manner that allowed the best alternative to be implemented.");
            newFeedback.Question4 = new Question("The schedule provided the product/service in a timeframe that met the department needs/requirements.");
            newFeedback.Question5 = new Question("The original schedule developed during the Planning phase was largely accurate and followed throughout the execution of the project.");
            newFeedback.Question6 = new Question("The product/solution delivered at the end of the project matched the original requirements and scope.");
            newFeedback.Question7 = new Question("The stakeholders and end users of the product were satisfied with the product.");
            newFeedback.Question8 = new Question("The training provided was appropriate and adequate for this product.");
            newFeedback.Question9 = new Question("How could we improve our project management services in the future?");

            if (id == null)
            {
                return View(newFeedback);
            }
            var project = db.tblProjectInformations.Where(i => i.ProjectID == id).Select(n => n.ProjectName).Single();
            newFeedback.ProjectName = project.Trim();
            newFeedback.ProjectID = id;
            return View(newFeedback);
        }

        // POST: Projects/Feedback/
        [HttpPost]
        public ActionResult Feedback(Feedback filledFeedback)
        {
            ObjectParameter feedbackID = new ObjectParameter("ProjectFeedbackID", typeof(int?));
            try
            {
                if (filledFeedback.ProjectID == null)
            {
                int projectID = db.tblProjectInformations.Where(n => n.ProjectName == filledFeedback.ProjectName).Select(i => i.ProjectID).Single();
                db.sp_Feedback_Insert(projectID, filledFeedback.SubmitterName, filledFeedback.SubmitterEmail, filledFeedback.Department, feedbackID);
                db.SaveChanges();
            }
            else
            {
                db.sp_Feedback_Insert(filledFeedback.ProjectID, filledFeedback.SubmitterName, filledFeedback.SubmitterEmail, filledFeedback.Department, feedbackID);
                db.SaveChanges();
            }

            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question1.getID(), Convert.ToInt16(filledFeedback.Question1.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question2.getID(), Convert.ToInt16(filledFeedback.Question2.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question3.getID(), Convert.ToInt16(filledFeedback.Question3.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question4.getID(), Convert.ToInt16(filledFeedback.Question4.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question5.getID(), Convert.ToInt16(filledFeedback.Question5.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question6.getID(), Convert.ToInt16(filledFeedback.Question6.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question7.getID(), Convert.ToInt16(filledFeedback.Question7.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question8.getID(), Convert.ToInt16(filledFeedback.Question8.answer), null);
            db.sp_FeedbackResponces_Insert(Convert.ToInt16(feedbackID.Value), filledFeedback.Question9.getID(), null,filledFeedback.Question9.answer);
            db.SaveChanges();
            }
            catch (Exception e)
            {
                var message = e.Message;
                this.Flash("error", "There was an error leaving feedback! Please contact HSIS PMO Office.");
                return RedirectToAction("Index");
            }

            this.Flash("success", "Thank you for submiting your feedback!");
            return RedirectToAction("Index");
        }

        // GET: Projects/Autocomplete/
        public ActionResult Autocomplete(string term)
        {
            var projects = service.fillProjectList();
            string[] items = projects.OrderBy(p => p.projectName).Select(p => p.projectName.Trim()).ToArray();

            var filteredItems = items.Where(
        item => item.IndexOf(term, StringComparison.InvariantCultureIgnoreCase) >= 0
        );
            return Json(filteredItems, JsonRequestBehavior.AllowGet);
        }

        //[Route("GetSelectedFilter/{id?}"), HttpGet]
        //public ActionResult GetSelectedFilter(string id)
        //{
        //    Session["SelectedFilter"] = id;
        //    return RedirectToAction("Index");
        //}
    }
}
