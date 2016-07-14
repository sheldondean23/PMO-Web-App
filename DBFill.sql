INSERT INTO tblHSISPrimaryLead (PrimaryLeadName)
VALUES ('Casie Crawford'),('Mamie Phillips'),('Louis Wright'),('Vernon Coleman'),('Tom Kennedy'),
('Terry Dees-Kolenich'),('Rosemary White'),('Robbie Tacon'),('Richard Swansburg'),('Pamela Gilbert')
,('HSIS Team'),('Hardy Demeranville'),('DeDe Sanogo'),('David Roberts'),('Daniel Day');

INSERT INTO tblHSISSecondaryLead(SecondaryLeadName)
VALUES ('Casie Crawford'),('Mamie Phillips'),('Louis Wright'),('Vernon Coleman'),('Tom Kennedy'),
('Terry Dees-Kolenich'),('Rosemary White'),('Robbie Tacon'),('Richard Swansburg'),('Pamela Gilbert')
,('HSIS Team'),('Hardy Demeranville'),('DeDe Sanogo'),('David Roberts'),('Daniel Day');

INSERT INTO tblProjectSize (ProjectSizeName)
VALUES ('Small'),('Medium'),('Large');

INSERT INTO [tblProjectRequestType] ([ProjectRequestTypeName])
VALUES  ('New'), ('Software'), ('Upgrade'), ('Phase'), ('Enhancement'), ('Fix'), ('Problem'), ('Other');

INSERT INTO [tblCategories] ([CategoryName])
VALUES ('Administrative'), ('Clinical Impact'), ('Compliance/Regulatory'), ('Construction') , ('Financial Impact')
, ('Prerequisite'), ('Unity');

INSERT INTO tblFacilities([FacitityName])
VALUES ('Ambulatory Services'),('Children''s and Women''s'), ('Mitchell Cancer Institute'), ('Health Services Foundation'), ('Medical Center'), ('Strada Patient Care Center');

INSERT INTO tblProjectPriority([PriorityName])
VALUES ('High'), ('Medium'), ('Low');

INSERT INTO [tblProjectStatus] ([StatusName])
VALUES ('Archived'), ('Behind Schedule'), ('Closed'), ('Complete'), ('In Progress'), ('Not Started'), ('On Hold')
, ('Pending'), ('Pending Budget'), ('Postponed');

INSERT INTO tblResources(ResourceName)
VALUES ('Lab'),('Radiology'),('Pharmacy'),('Nursing'),('Infrastructure'),
('Hardware'),('Rev Cycle'),('Data Analytics');
INSERT INTO tblProjectRequester (ProjectRequesterName,ProjectRequesterEmail,ProjectRequesterPhone) VALUES 
								('N/A','N/A','0'),
								('Beth Anderson', 'aeanderson@health.southalabama.edu', '2514717110'),
								('Traci Jones', 'tjones@health.southalabama.edu','2514459164'),
								('Lisa Mestas', 'lmestas@health.southalabama.edu', '2202297730'),
								('David Fulton', 'dfulton@health.southalabama.edu', '2514705823'),
								('Robert Smith', 'rcsmith@health.southalabama.edu', '2514131630'),
								('Linda Hudson','lhudson@health.southalabama.edu', '2514705802'),
								('Thad Phillips','tphillips@health.southalabama.edu','2514717621'),
								('Mark Lauteren', 'mlauteren@health.southalabama.edu', '2514343675'),
								('Owen Bailey','obailey@health.southalabama.edu', '2514151601'),
								('Garry Adkins', 'gadkins@health.southalabama.edu', '2514343675'),
								('Lisa Wilson', 'lwilson@health.southalabama.edu', '2514717619'),
								('Yolanda Topin', 'ytopin@health.southalabama.edu', '2514717747'),
								('Jennifer Shariat-Zadeh', 'jshariat@health.southalabama.edu', '2514158631'),
								('Belinda Gee', 'bgee@health.southalabama.edu','2514151657'),
								('Greg House', 'ghouse@health.southalbama.edu', '2514712778'),
								('DeDe Sanogo', 'tsanogo@health.southalabama.edu', '653453'),
								('Sheri Salas', 'ssalas@health.southalabama.edu', '2514717669'),
								('Lawrence Gardner', 'lgardner@health.southalabama.edu', '2514717191'),
								('Casie Crawford', 'ccrawford@health.southalabama.edu', '2514151078'),
								('Scott Pridgen', 'spridgen@health.southalabama.edu', '2514177679'),
								('Pam Gilbert', 'peglibert@health.southalabama.edu', '2514059915'),
								('Dianne Bass', 'dbass@health.southalabama.edu', '2514717350');
								

set ANSI_WARNINGS  OFF
INSERT INTO [HSISProjectsTest].[dbo].[tblProjectInformation] ([ProjectName],[HSISPrimaryLeadID],[HSISSecondaryLeadID],[ProjectRequestTypeID],[ProjectSizeID],[ProjectRequesterID],[ProjectPriorityID],[ProjectStatusID],[DepartmentOfRequest],[ProjectLaborHours],[ProjectRankingScore],[ProjectSubmitter])
SELECT [ProjectName]
      ,[HSISPrimaryLeadID]
      ,[HSISSecondaryLeadID]
      ,[ProjectRequestTypeID]
      ,[ProjectSizeID]
      ,[ProjectRequesterID]
      ,[ProjectPriorityID]
      ,[ProjectStatusID]
      ,[DepartmentOfRequest]
      ,[ProjectLaborHours]
      ,[ProjectRankingScore]
      ,[ProjectSubmitter]
  FROM [HSISProjectsInport].[dbo].[tblProjectInformation$]

  set ANSI_WARNINGS  OFF
  INSERT INTO [HSISProjectsTest].[dbo].[tblProjectFacilities]([FacilityID],[ProjectID])
  SELECT [FacitityID]
      ,[ProjectID]
  FROM [HSISProjectsInport].[dbo].[tblSystemFacilities$]

  set ANSI_WARNINGS  OFF
  INSERT INTO [HSISProjectsTest].[dbo].[tblProjectCategories]([CategoryID],[ProjectID])
  SELECT [CategoryID]
      ,[ProjectID]
  FROM [HSISProjectsInport].[dbo].[tblProjectCategories$]

  set ANSI_WARNINGS  OFF
  INSERT INTO [HSISProjectsTest].[dbo].[tblProjectBudget]([ProjectID],[ProjectDesiredBudget],[ProjectActualBudget])
  SELECT [ProjectID]
      ,[ProjectDesiredBudget]
      ,[ProjectActualBudget]
  FROM [HSISProjectsInport].[dbo].[tblProjectBudget$]

  set ANSI_WARNINGS  OFF
  INSERT INTO [tblProjectDates]([ProjectID], [ScheduledStartDate],[ScheduledEndDate],[ActualStartDate],[ActualEndDate],[RequestedDate],[ContactedDate],[ArchiveDate])
  SELECT [ProjectID]
      ,[SchedualedStartDate]
      ,[SchedualedEndDate]
      ,[ActualStartDate]
      ,[ActualEndDate]
      ,[RequestedDate]
      ,[ContactedDate]
      ,[ArchiveDate]
  FROM [HSISProjectsInport].[dbo].[tblProjectDates$]

  set ANSI_WARNINGS  OFF
  INSERT INTO [tblProjectPurpose]([ProjectID],[Comments],[FutureState])
  SELECT [ProjectID]
      ,[Comments]
      ,[FutureState]
  FROM [HSISProjectsInport].[dbo].[tblProjectPurpose$]

  set ANSI_WARNINGS  OFF
  INSERT INTO [tblProjectStatusUpdates]([ProjectID],[ProjectStatusUpdate],[ProjectStatusUpdateDate])
  SELECT [ProjectID]
      ,[ProjectStatusUpdate]
      ,[ProjectStatusUpdateDate]
  FROM [HSISProjectsInport].[dbo].[tblProjectStatusUpdates$]
