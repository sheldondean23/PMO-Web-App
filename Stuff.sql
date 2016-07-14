
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
VALUES ('Administrative'), ('Clininal Impact'), ('Compliance/Regulatory'), ('Construction') , ('Financial Impact')
, ('Prrequisite'), ('Unity');

INSERT INTO [tblFacitities] ([FacitityName])
VALUES ('Children''s and Women''s'), ('Mitchell Cancer Institute'), ('Health Services Foundation'), ('Medical Center'), ('Strada Patient Care Center');

INSERT INTO tblProjectPriority([PriorityName])
VALUES ('High'), ('Medium'), ('Low');

INSERT INTO [tblProjectStatus] ([StatusName])
VALUES ('Behind Schedule'), ('Closed'), ('Complete'), ('In Progress'), ('Not Started'), ('On Hold')
, ('Pending'), ('Pending Budget'), ('Postponed');

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
INSERT INTO HSISProjectsTest.dbo.tblProjectStatusUpdates([ProjectID],[ProjectStatusUpdate],[ProjectStatusUpdateDate])
SELECT [ProjectID]
      ,[ProjectStatusUpdate]
      ,[ProjectStatusUpdateDate]
  FROM [HSISProjectsInport].[dbo].[tblProjectStatusUpdates$];

select * from tblProjectInformation
right outer JOIN tblHSISPrimaryLead
ON tblProjectInformation.HSISPrimaryLeadID=tblHSISPrimaryLead.PrimaryLeadID 
  where  tblHSISPrimaryLead.PrimaryLeadName = 'Casie Crawford'

SELECT [PrimaryLeadID]
      ,[PrimaryLeadName]
  FROM [HSISProjects].[dbo].[tblHSISPrimaryLead]
  where  tblHSISPrimaryLead.PrimaryLeadName is not null 

  DECLARE @ProjectID int
	SELECT @ProjectID = (
							SELECT [ProjectID] 
							FROM [tblProjectInformation] 
							WHERE [ProjectName] = 'Fix TAB                                                '
							)
  select tblProjectInformation.ProjectName, DATEDIFF(day, tblProjectDates.SchedualedStartDate,tblProjectDates.SchedualedEndDate) as 'Project Lengh'
  from tblProjectInformation
  inner join tblProjectDates on tblProjectInformation.ProjectID = tblProjectDates.ProjectID 
  where tblProjectDates.SchedualedStartDate > #2014# 
  