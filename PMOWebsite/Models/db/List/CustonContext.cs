using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace PMOWebsite.Models.db.List
{
    public class CustonContext
    {
        public CustonContext()
        {
            //HSISProjectsTestEntities db = new HSISProjectsTestEntities();
            HSISProjectsEntities db = new HSISProjectsEntities();
            var car = (from pList in db.tblProjectInformations
                       join r in db.tblProjectRequesters on pList.ProjectRequesterID equals r.ProjectRequesterID into rp
                       from arequester in rp.DefaultIfEmpty()
                       join p in db.tblProjectPurposes on pList.ProjectID equals p.ProjectID into purp
                       from purpose in purp.DefaultIfEmpty()
                       join b in db.tblProjectBudgets on pList.ProjectID equals b.ProjectID into bud
                       from budget in bud.DefaultIfEmpty()
                       join d in db.tblProjectDates on pList.ProjectID equals d.ProjectID into adate
                       from dates in adate.DefaultIfEmpty()
                       join rt in db.tblProjectRequestTypes on pList.ProjectRequestTypeID equals rt.ProjectRequestTypeID into re
                       from request in re.DefaultIfEmpty()
                       join pr in db.tblHSISPrimaryLeads on pList.HSISPrimaryLeadID equals pr.PrimaryLeadID into prime
                       from primary in prime.DefaultIfEmpty()
                       join sec in db.tblHSISSecondaryLeads on pList.HSISSecondaryLeadID equals sec.SecondaryLeadID into second
                       from secondary in second.DefaultIfEmpty()
                       join s in db.tblProjectSizes on pList.ProjectSizeID equals s.ProjectSizeID into sizes
                       from size in sizes.DefaultIfEmpty()
                       join pri in db.tblProjectPriorities on pList.ProjectPriorityID equals pri.PriorityID into priorities
                       from proporty in priorities.DefaultIfEmpty()
                       join stat in db.tblProjectStatus on pList.ProjectStatusID equals stat.StatusID into statuses
                       from status in statuses.DefaultIfEmpty()
                       select new ProjectList
                       {
                           projectID = pList.ProjectID,
                           projectName = pList.ProjectName,
                           departmentOFRequest = pList.DepartmentOfRequest,
                           projectSubmitter = pList.ProjectSubmitter,
                           ranking = pList.ProjectRankingScore,
                           laborHr = pList.ProjectLaborHours,
                           currentState = purpose.Comments,
                           futureState = purpose.FutureState,
                           actualBudget = budget.ProjectActualBudget,
                           desiredBudget = budget.ProjectDesiredBudget,
                           actualEndDate = dates.ActualEndDate,
                           actualStartDate = dates.ActualStartDate,
                           archiveDate = dates.ArchiveDate,
                           contactedDate = dates.ContactedDate,
                           scheduledEndDate = dates.ScheduledEndDate,
                           scheduledStartDate = dates.ScheduledStartDate,
                           requestedDate = dates.RequestedDate,
                           mostResentuUpdate = (db.tblProjectStatusUpdates.Where(s => s.ProjectID == pList.ProjectID).OrderByDescending(d => d.ProjectStatusUpdateDate).Select(s => s.ProjectStatusUpdate)).FirstOrDefault(),
                           projectRequestType = (from r in re
                                                 select new ProjectRequestType
                                                 {
                                                     id = r.ProjectRequestTypeID,
                                                     name = r.ProjectRequestTypeName
                                                 }).FirstOrDefault(),
                           hsisPrimaryLead = (from p in prime
                                              select new ProjectHSISp
                                              {
                                                  id = p.PrimaryLeadID,
                                                  name = p.PrimaryLeadName
                                              }).FirstOrDefault(),
                           hsisSecondaryLead = (from s in second
                                                select new ProjectHSISs
                                                {
                                                    id = s.SecondaryLeadID,
                                                    name = s.SecondaryLeadName
                                                }).FirstOrDefault(),
                           projectSize = (from s in sizes
                                          select new ProjectSize
                                          {
                                              id = s.ProjectSizeID,
                                              name = s.ProjectSizeName
                                          }).FirstOrDefault(),
                           projectPriority = (from p in priorities
                                              select new ProjectPriority
                                              {
                                                  id = p.PriorityID,
                                                  name = p.PriorityName
                                              }).FirstOrDefault(),
                           projectStatus = (from s in statuses
                                            select new ProjectStatus
                                            {
                                                id = s.StatusID,
                                                name = s.StatusName
                                            }).FirstOrDefault(),
                           requester = (from p in db.tblProjectInformations
                                        join r in db.tblProjectRequesters on p.ProjectRequesterID equals r.ProjectRequesterID
                                        where r.ProjectRequesterID == arequester.ProjectRequesterID
                                        select new Requester
                                        {
                                            id = r.ProjectRequesterID,
                                            name = r.ProjectRequesterName,
                                            phone = r.ProjectRequesterPhone,
                                            email = r.ProjectRequesterEmail
                                        }).FirstOrDefault(),
                           AvaliableCategories = (from categories in db.tblCategories
                                                  select new Category
                                                  {
                                                      id = categories.CategoryID,
                                                      name = categories.CategoryName
                                                  }).DefaultIfEmpty().ToList(),
                           AvaliableFacilities = (from facilities in db.tblFacilities
                                                  select new Facility
                                                  {
                                                      id = facilities.FacitityID,
                                                      name = facilities.FacitityName
                                                  }).DefaultIfEmpty().ToList(),
                           SelectedCategories = (from c in db.tblCategories
                                                 join bridge in db.tblProjectCategories on c.CategoryID equals bridge.CategoryID
                                                 where bridge.ProjectID == pList.ProjectID
                                                 select new Category
                                                 {
                                                     id = c.CategoryID,
                                                     name = c.CategoryName
                                                 }).ToList(),
                           SelectedFacilities = (from f in db.tblFacilities
                                                 join bridge in db.tblProjectFacilities on f.FacitityID equals bridge.FacilityID
                                                 where bridge.ProjectID == pList.ProjectID
                                                 select new Facility
                                                 {
                                                     id = f.FacitityID,
                                                     name = f.FacitityName
                                                 }).ToList(),
                           statusUpdates = (from su in db.tblProjectStatusUpdates
                                            where su.ProjectID == pList.ProjectID
                                            select new StatusUpdate
                                            {
                                                update = su.ProjectStatusUpdate,
                                                date = su.ProjectStatusUpdateDate
                                            }).ToList()
                       });
        }
        public virtual DataTable All { get; set; }
    }
}