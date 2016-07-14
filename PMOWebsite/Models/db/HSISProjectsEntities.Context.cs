﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PMOWebsite.Models.db
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class HSISProjectsEntities : DbContext
    {
        public HSISProjectsEntities()
            : base("name=HSISProjectsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<tblCategory> tblCategories { get; set; }
        public virtual DbSet<tblFacility> tblFacilities { get; set; }
        public virtual DbSet<tblFeedbackQuestionAnswer> tblFeedbackQuestionAnswers { get; set; }
        public virtual DbSet<tblFeedbackQuestion> tblFeedbackQuestions { get; set; }
        public virtual DbSet<tblHSISPrimaryLead> tblHSISPrimaryLeads { get; set; }
        public virtual DbSet<tblHSISSecondaryLead> tblHSISSecondaryLeads { get; set; }
        public virtual DbSet<tblProjectBudget> tblProjectBudgets { get; set; }
        public virtual DbSet<tblProjectCategory> tblProjectCategories { get; set; }
        public virtual DbSet<tblProjectDate> tblProjectDates { get; set; }
        public virtual DbSet<tblProjectFacility> tblProjectFacilities { get; set; }
        public virtual DbSet<tblProjectFeedback> tblProjectFeedbacks { get; set; }
        public virtual DbSet<tblProjectInformation> tblProjectInformations { get; set; }
        public virtual DbSet<tblProjectPriority> tblProjectPriorities { get; set; }
        public virtual DbSet<tblProjectPurpose> tblProjectPurposes { get; set; }
        public virtual DbSet<tblProjectRequester> tblProjectRequesters { get; set; }
        public virtual DbSet<tblProjectRequestType> tblProjectRequestTypes { get; set; }
        public virtual DbSet<tblProjectResource> tblProjectResources { get; set; }
        public virtual DbSet<tblProjectSize> tblProjectSizes { get; set; }
        public virtual DbSet<tblProjectStatu> tblProjectStatus { get; set; }
        public virtual DbSet<tblProjectStatusUpdate> tblProjectStatusUpdates { get; set; }
        public virtual DbSet<tblResource> tblResources { get; set; }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_Budget_Insert(Nullable<int> projectID, Nullable<int> desiredBudget, Nullable<int> actualBudget)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var desiredBudgetParameter = desiredBudget.HasValue ?
                new ObjectParameter("DesiredBudget", desiredBudget) :
                new ObjectParameter("DesiredBudget", typeof(int));
    
            var actualBudgetParameter = actualBudget.HasValue ?
                new ObjectParameter("ActualBudget", actualBudget) :
                new ObjectParameter("ActualBudget", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Budget_Insert", projectIDParameter, desiredBudgetParameter, actualBudgetParameter);
        }
    
        public virtual int sp_Budget_Update(Nullable<int> projectID, Nullable<int> desiredBudget, Nullable<int> actualBudget)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var desiredBudgetParameter = desiredBudget.HasValue ?
                new ObjectParameter("DesiredBudget", desiredBudget) :
                new ObjectParameter("DesiredBudget", typeof(int));
    
            var actualBudgetParameter = actualBudget.HasValue ?
                new ObjectParameter("ActualBudget", actualBudget) :
                new ObjectParameter("ActualBudget", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Budget_Update", projectIDParameter, desiredBudgetParameter, actualBudgetParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_Dates_Insert(Nullable<int> projectID, Nullable<System.DateTime> schedualedStartDate, Nullable<System.DateTime> schedualedEndDate, Nullable<System.DateTime> actualStartDate, Nullable<System.DateTime> actualEndDate, Nullable<System.DateTime> requestedDate, Nullable<System.DateTime> contactedDate, Nullable<System.DateTime> archiveDate)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var schedualedStartDateParameter = schedualedStartDate.HasValue ?
                new ObjectParameter("SchedualedStartDate", schedualedStartDate) :
                new ObjectParameter("SchedualedStartDate", typeof(System.DateTime));
    
            var schedualedEndDateParameter = schedualedEndDate.HasValue ?
                new ObjectParameter("SchedualedEndDate", schedualedEndDate) :
                new ObjectParameter("SchedualedEndDate", typeof(System.DateTime));
    
            var actualStartDateParameter = actualStartDate.HasValue ?
                new ObjectParameter("ActualStartDate", actualStartDate) :
                new ObjectParameter("ActualStartDate", typeof(System.DateTime));
    
            var actualEndDateParameter = actualEndDate.HasValue ?
                new ObjectParameter("ActualEndDate", actualEndDate) :
                new ObjectParameter("ActualEndDate", typeof(System.DateTime));
    
            var requestedDateParameter = requestedDate.HasValue ?
                new ObjectParameter("RequestedDate", requestedDate) :
                new ObjectParameter("RequestedDate", typeof(System.DateTime));
    
            var contactedDateParameter = contactedDate.HasValue ?
                new ObjectParameter("ContactedDate", contactedDate) :
                new ObjectParameter("ContactedDate", typeof(System.DateTime));
    
            var archiveDateParameter = archiveDate.HasValue ?
                new ObjectParameter("ArchiveDate", archiveDate) :
                new ObjectParameter("ArchiveDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Dates_Insert", projectIDParameter, schedualedStartDateParameter, schedualedEndDateParameter, actualStartDateParameter, actualEndDateParameter, requestedDateParameter, contactedDateParameter, archiveDateParameter);
        }
    
        public virtual int sp_Dates_Update(Nullable<int> projectID, Nullable<System.DateTime> scheduledStartDate, Nullable<System.DateTime> scheduledEndDate, Nullable<System.DateTime> actualStartDate, Nullable<System.DateTime> actualEndDate, Nullable<System.DateTime> requestedDate, Nullable<System.DateTime> contactedDate, Nullable<System.DateTime> archiveDate)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var scheduledStartDateParameter = scheduledStartDate.HasValue ?
                new ObjectParameter("ScheduledStartDate", scheduledStartDate) :
                new ObjectParameter("ScheduledStartDate", typeof(System.DateTime));
    
            var scheduledEndDateParameter = scheduledEndDate.HasValue ?
                new ObjectParameter("ScheduledEndDate", scheduledEndDate) :
                new ObjectParameter("ScheduledEndDate", typeof(System.DateTime));
    
            var actualStartDateParameter = actualStartDate.HasValue ?
                new ObjectParameter("ActualStartDate", actualStartDate) :
                new ObjectParameter("ActualStartDate", typeof(System.DateTime));
    
            var actualEndDateParameter = actualEndDate.HasValue ?
                new ObjectParameter("ActualEndDate", actualEndDate) :
                new ObjectParameter("ActualEndDate", typeof(System.DateTime));
    
            var requestedDateParameter = requestedDate.HasValue ?
                new ObjectParameter("RequestedDate", requestedDate) :
                new ObjectParameter("RequestedDate", typeof(System.DateTime));
    
            var contactedDateParameter = contactedDate.HasValue ?
                new ObjectParameter("ContactedDate", contactedDate) :
                new ObjectParameter("ContactedDate", typeof(System.DateTime));
    
            var archiveDateParameter = archiveDate.HasValue ?
                new ObjectParameter("ArchiveDate", archiveDate) :
                new ObjectParameter("ArchiveDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Dates_Update", projectIDParameter, scheduledStartDateParameter, scheduledEndDateParameter, actualStartDateParameter, actualEndDateParameter, requestedDateParameter, contactedDateParameter, archiveDateParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_Feedback_Insert(Nullable<int> projectID, string feedbackSubmitterName, string feedbackSubmitterEmail, string feedbackSubmitterDepartment, ObjectParameter projectFeedbackID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var feedbackSubmitterNameParameter = feedbackSubmitterName != null ?
                new ObjectParameter("FeedbackSubmitterName", feedbackSubmitterName) :
                new ObjectParameter("FeedbackSubmitterName", typeof(string));
    
            var feedbackSubmitterEmailParameter = feedbackSubmitterEmail != null ?
                new ObjectParameter("FeedbackSubmitterEmail", feedbackSubmitterEmail) :
                new ObjectParameter("FeedbackSubmitterEmail", typeof(string));
    
            var feedbackSubmitterDepartmentParameter = feedbackSubmitterDepartment != null ?
                new ObjectParameter("FeedbackSubmitterDepartment", feedbackSubmitterDepartment) :
                new ObjectParameter("FeedbackSubmitterDepartment", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Feedback_Insert", projectIDParameter, feedbackSubmitterNameParameter, feedbackSubmitterEmailParameter, feedbackSubmitterDepartmentParameter, projectFeedbackID);
        }
    
        public virtual int sp_FeedbackResponces_Insert(Nullable<int> projectFeedbackID, Nullable<int> feedbackQuestionID, Nullable<int> feedbackAnswerRank, string feedbackAnswerOpenEnd)
        {
            var projectFeedbackIDParameter = projectFeedbackID.HasValue ?
                new ObjectParameter("ProjectFeedbackID", projectFeedbackID) :
                new ObjectParameter("ProjectFeedbackID", typeof(int));
    
            var feedbackQuestionIDParameter = feedbackQuestionID.HasValue ?
                new ObjectParameter("FeedbackQuestionID", feedbackQuestionID) :
                new ObjectParameter("FeedbackQuestionID", typeof(int));
    
            var feedbackAnswerRankParameter = feedbackAnswerRank.HasValue ?
                new ObjectParameter("FeedbackAnswerRank", feedbackAnswerRank) :
                new ObjectParameter("FeedbackAnswerRank", typeof(int));
    
            var feedbackAnswerOpenEndParameter = feedbackAnswerOpenEnd != null ?
                new ObjectParameter("FeedbackAnswerOpenEnd", feedbackAnswerOpenEnd) :
                new ObjectParameter("FeedbackAnswerOpenEnd", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_FeedbackResponces_Insert", projectFeedbackIDParameter, feedbackQuestionIDParameter, feedbackAnswerRankParameter, feedbackAnswerOpenEndParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_Project_Category_Insert(Nullable<int> projectID, Nullable<int> categoryID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var categoryIDParameter = categoryID.HasValue ?
                new ObjectParameter("CategoryID", categoryID) :
                new ObjectParameter("CategoryID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Category_Insert", projectIDParameter, categoryIDParameter);
        }
    
        public virtual int sp_Project_Category_Remove(Nullable<int> projectID, Nullable<int> categoryID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var categoryIDParameter = categoryID.HasValue ?
                new ObjectParameter("CategoryID", categoryID) :
                new ObjectParameter("CategoryID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Category_Remove", projectIDParameter, categoryIDParameter);
        }
    
        public virtual int sp_Project_Category_Update(Nullable<int> projectID, Nullable<int> categoryID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var categoryIDParameter = categoryID.HasValue ?
                new ObjectParameter("CategoryID", categoryID) :
                new ObjectParameter("CategoryID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Category_Update", projectIDParameter, categoryIDParameter);
        }
    
        public virtual int sp_Project_Delete(string projectName)
        {
            var projectNameParameter = projectName != null ?
                new ObjectParameter("ProjectName", projectName) :
                new ObjectParameter("ProjectName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Delete", projectNameParameter);
        }
    
        public virtual int sp_Project_Facility_Insert(Nullable<int> projectID, Nullable<int> facilityID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var facilityIDParameter = facilityID.HasValue ?
                new ObjectParameter("FacilityID", facilityID) :
                new ObjectParameter("FacilityID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Facility_Insert", projectIDParameter, facilityIDParameter);
        }
    
        public virtual int sp_Project_Facility_Remove(Nullable<int> projectID, Nullable<int> facilityID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var facilityIDParameter = facilityID.HasValue ?
                new ObjectParameter("FacilityID", facilityID) :
                new ObjectParameter("FacilityID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Facility_Remove", projectIDParameter, facilityIDParameter);
        }
    
        public virtual int sp_Project_Facility_Update(Nullable<int> projectID, Nullable<int> facilityID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var facilityIDParameter = facilityID.HasValue ?
                new ObjectParameter("FacilityID", facilityID) :
                new ObjectParameter("FacilityID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Facility_Update", projectIDParameter, facilityIDParameter);
        }
    
        public virtual int sp_Project_Insert(string name, Nullable<int> primaryLeadID, Nullable<int> secondaryLeadID, Nullable<int> typeID, Nullable<int> sizeID, Nullable<int> requesterID, Nullable<int> priorityID, Nullable<int> statusID, string departmentOfRequest, Nullable<double> laborHours, Nullable<int> rankingScore, string submitter, string fOPALnumber, ObjectParameter projectID)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var primaryLeadIDParameter = primaryLeadID.HasValue ?
                new ObjectParameter("PrimaryLeadID", primaryLeadID) :
                new ObjectParameter("PrimaryLeadID", typeof(int));
    
            var secondaryLeadIDParameter = secondaryLeadID.HasValue ?
                new ObjectParameter("SecondaryLeadID", secondaryLeadID) :
                new ObjectParameter("SecondaryLeadID", typeof(int));
    
            var typeIDParameter = typeID.HasValue ?
                new ObjectParameter("TypeID", typeID) :
                new ObjectParameter("TypeID", typeof(int));
    
            var sizeIDParameter = sizeID.HasValue ?
                new ObjectParameter("SizeID", sizeID) :
                new ObjectParameter("SizeID", typeof(int));
    
            var requesterIDParameter = requesterID.HasValue ?
                new ObjectParameter("RequesterID", requesterID) :
                new ObjectParameter("RequesterID", typeof(int));
    
            var priorityIDParameter = priorityID.HasValue ?
                new ObjectParameter("PriorityID", priorityID) :
                new ObjectParameter("PriorityID", typeof(int));
    
            var statusIDParameter = statusID.HasValue ?
                new ObjectParameter("StatusID", statusID) :
                new ObjectParameter("StatusID", typeof(int));
    
            var departmentOfRequestParameter = departmentOfRequest != null ?
                new ObjectParameter("DepartmentOfRequest", departmentOfRequest) :
                new ObjectParameter("DepartmentOfRequest", typeof(string));
    
            var laborHoursParameter = laborHours.HasValue ?
                new ObjectParameter("LaborHours", laborHours) :
                new ObjectParameter("LaborHours", typeof(double));
    
            var rankingScoreParameter = rankingScore.HasValue ?
                new ObjectParameter("RankingScore", rankingScore) :
                new ObjectParameter("RankingScore", typeof(int));
    
            var submitterParameter = submitter != null ?
                new ObjectParameter("Submitter", submitter) :
                new ObjectParameter("Submitter", typeof(string));
    
            var fOPALnumberParameter = fOPALnumber != null ?
                new ObjectParameter("FOPALnumber", fOPALnumber) :
                new ObjectParameter("FOPALnumber", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Insert", nameParameter, primaryLeadIDParameter, secondaryLeadIDParameter, typeIDParameter, sizeIDParameter, requesterIDParameter, priorityIDParameter, statusIDParameter, departmentOfRequestParameter, laborHoursParameter, rankingScoreParameter, submitterParameter, fOPALnumberParameter, projectID);
        }
    
        public virtual int sp_Project_Resource_Insert(Nullable<int> projectID, Nullable<int> resourceID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var resourceIDParameter = resourceID.HasValue ?
                new ObjectParameter("ResourceID", resourceID) :
                new ObjectParameter("ResourceID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Resource_Insert", projectIDParameter, resourceIDParameter);
        }
    
        public virtual int sp_Project_Resource_Remove(Nullable<int> projectID, Nullable<int> resourceID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var resourceIDParameter = resourceID.HasValue ?
                new ObjectParameter("ResourceID", resourceID) :
                new ObjectParameter("ResourceID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Resource_Remove", projectIDParameter, resourceIDParameter);
        }
    
        public virtual int sp_Project_Resource_Update(Nullable<int> projectID, Nullable<int> resourceID)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var resourceIDParameter = resourceID.HasValue ?
                new ObjectParameter("ResourceID", resourceID) :
                new ObjectParameter("ResourceID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Resource_Update", projectIDParameter, resourceIDParameter);
        }
    
        public virtual int sp_Project_Update(string name, Nullable<int> primaryLeadID, Nullable<int> secondaryLeadID, Nullable<int> typeID, Nullable<int> sizeID, Nullable<int> requesterID, Nullable<int> priorityID, Nullable<int> statusID, string departmentOfRequest, Nullable<double> laborHours, Nullable<int> rankingScore, string submitter, string fOPALnumber, Nullable<int> projectID)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var primaryLeadIDParameter = primaryLeadID.HasValue ?
                new ObjectParameter("PrimaryLeadID", primaryLeadID) :
                new ObjectParameter("PrimaryLeadID", typeof(int));
    
            var secondaryLeadIDParameter = secondaryLeadID.HasValue ?
                new ObjectParameter("SecondaryLeadID", secondaryLeadID) :
                new ObjectParameter("SecondaryLeadID", typeof(int));
    
            var typeIDParameter = typeID.HasValue ?
                new ObjectParameter("TypeID", typeID) :
                new ObjectParameter("TypeID", typeof(int));
    
            var sizeIDParameter = sizeID.HasValue ?
                new ObjectParameter("SizeID", sizeID) :
                new ObjectParameter("SizeID", typeof(int));
    
            var requesterIDParameter = requesterID.HasValue ?
                new ObjectParameter("RequesterID", requesterID) :
                new ObjectParameter("RequesterID", typeof(int));
    
            var priorityIDParameter = priorityID.HasValue ?
                new ObjectParameter("PriorityID", priorityID) :
                new ObjectParameter("PriorityID", typeof(int));
    
            var statusIDParameter = statusID.HasValue ?
                new ObjectParameter("StatusID", statusID) :
                new ObjectParameter("StatusID", typeof(int));
    
            var departmentOfRequestParameter = departmentOfRequest != null ?
                new ObjectParameter("DepartmentOfRequest", departmentOfRequest) :
                new ObjectParameter("DepartmentOfRequest", typeof(string));
    
            var laborHoursParameter = laborHours.HasValue ?
                new ObjectParameter("LaborHours", laborHours) :
                new ObjectParameter("LaborHours", typeof(double));
    
            var rankingScoreParameter = rankingScore.HasValue ?
                new ObjectParameter("RankingScore", rankingScore) :
                new ObjectParameter("RankingScore", typeof(int));
    
            var submitterParameter = submitter != null ?
                new ObjectParameter("Submitter", submitter) :
                new ObjectParameter("Submitter", typeof(string));
    
            var fOPALnumberParameter = fOPALnumber != null ?
                new ObjectParameter("FOPALnumber", fOPALnumber) :
                new ObjectParameter("FOPALnumber", typeof(string));
    
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Project_Update", nameParameter, primaryLeadIDParameter, secondaryLeadIDParameter, typeIDParameter, sizeIDParameter, requesterIDParameter, priorityIDParameter, statusIDParameter, departmentOfRequestParameter, laborHoursParameter, rankingScoreParameter, submitterParameter, fOPALnumberParameter, projectIDParameter);
        }
    
        public virtual int sp_Prupose_Insert(Nullable<int> projectID, string comments, string futureState)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var commentsParameter = comments != null ?
                new ObjectParameter("Comments", comments) :
                new ObjectParameter("Comments", typeof(string));
    
            var futureStateParameter = futureState != null ?
                new ObjectParameter("FutureState", futureState) :
                new ObjectParameter("FutureState", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Prupose_Insert", projectIDParameter, commentsParameter, futureStateParameter);
        }
    
        public virtual int sp_Purpose_Update(Nullable<int> projectID, string comments, string futureState)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var commentsParameter = comments != null ?
                new ObjectParameter("Comments", comments) :
                new ObjectParameter("Comments", typeof(string));
    
            var futureStateParameter = futureState != null ?
                new ObjectParameter("FutureState", futureState) :
                new ObjectParameter("FutureState", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Purpose_Update", projectIDParameter, commentsParameter, futureStateParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_Requester_Update(string name, string email, string phone, ObjectParameter requestID)
        {
            var nameParameter = name != null ?
                new ObjectParameter("Name", name) :
                new ObjectParameter("Name", typeof(string));
    
            var emailParameter = email != null ?
                new ObjectParameter("Email", email) :
                new ObjectParameter("Email", typeof(string));
    
            var phoneParameter = phone != null ?
                new ObjectParameter("Phone", phone) :
                new ObjectParameter("Phone", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Requester_Update", nameParameter, emailParameter, phoneParameter, requestID);
        }
    
        public virtual int sp_StatusUpdate_Insert(Nullable<int> projectID, string projectStatusUpdate, Nullable<System.DateTime> projectStatusUpdateDate)
        {
            var projectIDParameter = projectID.HasValue ?
                new ObjectParameter("ProjectID", projectID) :
                new ObjectParameter("ProjectID", typeof(int));
    
            var projectStatusUpdateParameter = projectStatusUpdate != null ?
                new ObjectParameter("ProjectStatusUpdate", projectStatusUpdate) :
                new ObjectParameter("ProjectStatusUpdate", typeof(string));
    
            var projectStatusUpdateDateParameter = projectStatusUpdateDate.HasValue ?
                new ObjectParameter("ProjectStatusUpdateDate", projectStatusUpdateDate) :
                new ObjectParameter("ProjectStatusUpdateDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_StatusUpdate_Insert", projectIDParameter, projectStatusUpdateParameter, projectStatusUpdateDateParameter);
        }
    
        public virtual int sp_StatusUpdate_Update(Nullable<int> statusUpdatesID, string projectStatusUpdate, Nullable<System.DateTime> projectStatusUpdateDate)
        {
            var statusUpdatesIDParameter = statusUpdatesID.HasValue ?
                new ObjectParameter("StatusUpdatesID", statusUpdatesID) :
                new ObjectParameter("StatusUpdatesID", typeof(int));
    
            var projectStatusUpdateParameter = projectStatusUpdate != null ?
                new ObjectParameter("ProjectStatusUpdate", projectStatusUpdate) :
                new ObjectParameter("ProjectStatusUpdate", typeof(string));
    
            var projectStatusUpdateDateParameter = projectStatusUpdateDate.HasValue ?
                new ObjectParameter("ProjectStatusUpdateDate", projectStatusUpdateDate) :
                new ObjectParameter("ProjectStatusUpdateDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_StatusUpdate_Update", statusUpdatesIDParameter, projectStatusUpdateParameter, projectStatusUpdateDateParameter);
        }
    
        public virtual ObjectResult<string> sp_table_names()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_table_names");
        }
    
        public virtual ObjectResult<string> sp_table_row_names(string tableName)
        {
            var tableNameParameter = tableName != null ?
                new ObjectParameter("TableName", tableName) :
                new ObjectParameter("TableName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_table_row_names", tableNameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    }
}