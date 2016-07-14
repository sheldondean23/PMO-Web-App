
USE master
DROP DATABASE HSISProjectsTest
GO
CREATE DATABASE HSISProjectsTest
USE HSISProjectsTest

SET NOCOUNT ON

CREATE TABLE [dbo].[tblHSISPrimaryLead]
(
 [PrimaryLeadID]			INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [PrimaryLeadName]			NVARCHAR(30) NOT NULL, --Lead Name--
)
GO
CREATE TABLE [dbo].[tblHSISSecondaryLead]
(
 [SecondaryLeadID]			INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [SecondaryLeadName]		NVARCHAR(30) NOT NULL, --Lead Name--
)
GO
CREATE TABLE [dbo].[tblProjectRequestType]
(
 [ProjectRequestTypeID]		INT IDENTITY(0,1) PRIMARY KEY, --ID--
 [ProjectRequestTypeName]	NVARCHAR(30) NOT NULL, --New, Software Upgrade, Phase, Enhancement, Fix, Problem, Other--
)
GO
CREATE TABLE [dbo].[tblProjectSize]
(
 [ProjectSizeID]			INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectSizeName]			NVARCHAR(10) NOT NULL, --Small, Medium, Large--
)
GO
CREATE TABLE [dbo].[tblProjectRequester]
(
 [ProjectRequesterID]		INT IDENTITY(0,1) PRIMARY KEY, --ID--
 [ProjectRequesterName]		NVARCHAR(30) NOT NULL, --Requester Name--
 [ProjectRequesterEmail]	NVARCHAR(35) NOT NULL, --Requester Email--
 [ProjectRequesterPhone]	NVARCHAR(17) NOT NULL, --Requester Phone Extention--
 CONSTRAINT [UQ_tblProjectRequestor_ProjectRequestorName_ProjectRequestorEmail_ProjectRequestorPhone] UNIQUE NONCLUSTERED ([ProjectRequesterName] ASC, [ProjectRequesterEmail] ASC, [ProjectRequesterPhone] ASC),
)
GO
CREATE TABLE [dbo].[tblCategories]
(
 [CategoryID]				INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [CategoryName]				NVARCHAR(30) NOT NULL, --Administrative, Clinical Impact, Compliance/Regulatory, Construction , Financial Impact, Prerequisite, Unity--
)
GO
CREATE TABLE [dbo].[tblFacilities]
(
 [FacitityID]				INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [FacitityName]				NVARCHAR(30) NOT NULL, --Children's and Women's, Mitchell Cancer Institute, Health Services Foundation, Medical Center, Strada Patient Care Center--
)
GO
CREATE TABLE [dbo].[tblResources]
(
 [ResourceID]				INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ResourceName]				NVARCHAR(30) NOT NULL, --Lab,Radiology,Pharmacy,Nursing,Infrastructure,Hardware,Rev Cycle,Data Analytics--
)
GO
CREATE TABLE [dbo].[tblProjectPriority]
(
 [PriorityID]				INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [PriorityName]				NVARCHAR(30) NOT NULL, --High, Medium, Low--
)
GO
CREATE TABLE [dbo].[tblProjectStatus]
(
 [StatusID]					INT IDENTITY(1,1) PRIMARY KEY,
 [StatusName]				NVARCHAR(30) NOT NULL, --Behind Schedule, Closed, Complete, In Progress, Not Started, On Hold, Pending, Pending Budget, Postponed--
)
GO
CREATE TABLE [dbo].[tblFeedbackQuestions]
(
 [QuestionID]				INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [QuestionContent]			NVARCHAR(500) NOT NULL, --Content of Question--
)
GO
CREATE TABLE [dbo].[tblProjectInformation]
(
 [ProjectID]				INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectName]				NVARCHAR(55) NOT NULL, --Project Name--
 [HSISPrimaryLeadID]		INT, --ID of Primary Lead--
 [HSISSecondaryLeadID]		INT, --ID of Secondary Lead--
 [ProjectRequestTypeID]		INT NOT NULL, --ID of Request Type--
 [ProjectSizeID]			INT, --ID of Size--
 [ProjectRequesterID]		INT NOT NULL, --ID of Requestor--
 [ProjectPriorityID]		INT, --ID of Priority--
 [ProjectStatusID]			INT, --ID of Status--
 [DepartmentOfRequest]		NVARCHAR(50) NOT NULL, --Department Of Request--
 [ProjectLaborHours]		FLOAT, --Labor in Hours--
 [ProjectRankingScore]		INT, --Ranking Score--
 [ProjectSubmitter]			NVARCHAR(30) NOT NULL, --Submitter--

 FOREIGN KEY ([HSISPrimaryLeadID]) REFERENCES [dbo].[tblHSISPrimaryLead] ([PrimaryLeadID]),
 FOREIGN KEY ([HSISSecondaryLeadID]) REFERENCES [dbo].[tblHSISSecondaryLead] ([SecondaryLeadID]),
 FOREIGN KEY ([ProjectRequestTypeID]) REFERENCES [dbo].[tblProjectRequestType] ([ProjectRequestTypeID]),
 FOREIGN KEY ([ProjectSizeID]) REFERENCES [dbo].[tblProjectSize] ([ProjectSizeID]),
 FOREIGN KEY ([ProjectRequesterID]) REFERENCES [dbo].[tblProjectRequester] ([ProjectRequesterID]),
 FOREIGN KEY ([ProjectPriorityID]) REFERENCES [dbo].[tblProjectPriority] ([PriorityID]),
 FOREIGN KEY ([ProjectStatusID]) REFERENCES [dbo].[tblProjectStatus] ([StatusID]),
 CONSTRAINT [UQ_tblProjectInformation_ProjectName] UNIQUE  ([ProjectName]),
)
GO
CREATE TABLE [dbo].[tblProjectResources]
(
 [ConvertionID]				INT IDENTITY(1,1) PRIMARY KEY,
 [ResourceID]				INT NOT NULL, --ID of Resource--
 [ProjectID]				INT NOT NULL, --ID of Project--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
 FOREIGN KEY ([ResourceID]) REFERENCES [dbo].[tblResources] ([ResourceID]),
 CONSTRAINT [UQ_tblProjectResources_ResourceID_ProjectID] UNIQUE NONCLUSTERED ([ResourceID] ASC, [ProjectID] ASC),
)
GO
CREATE TABLE [dbo].[tblProjectFacilities]
(
 [ConvertionID]				INT IDENTITY(1,1) PRIMARY KEY,
 [FacilityID]				INT NOT NULL, --ID of Facility--
 [ProjectID]				INT NOT NULL, --ID of Project--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
 FOREIGN KEY ([FacilityID]) REFERENCES [dbo].[tblFacilities] ([FacitityID]),
 CONSTRAINT [UQ_tblSystemFacilities_FacilityID_ProjectID] UNIQUE NONCLUSTERED ([FacilityID] ASC, [ProjectID] ASC),
)
GO
CREATE TABLE [dbo].[tblProjectCategories]
(
 [ConvertionID]				INT IDENTITY(1,1) PRIMARY KEY,
 [CategoryID]				INT NOT NULL, --ID of Category--
 [ProjectID]				INT NOT NULL, --ID of Project--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
 FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[tblCategories] ([CategoryID]),
 CONSTRAINT [UQ_tblProjectCategories_CategoryID_ProjectID] UNIQUE NONCLUSTERED ([CategoryID] ASC, [ProjectID] ASC),
)
GO
CREATE TABLE [dbo].[tblProjectBudget]
(
 [ProjectBudgetID]			INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectID]				INT NOT NULL, --ID of Project--
 [ProjectDesiredBudget]		INT, --Budget Desired--
 [ProjectActualBudget]		INT, --Actual Budget--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
)
GO
CREATE TABLE [dbo].[tblProjectPurpose]
(
 [ProjectPurposeID]			INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectID]				INT NOT NULL, --ID of Project--
 [Comments]					VARCHAR(500) NOT NULL, --Comments--
 [FutureState]				VARCHAR(500) NOT NULL, --FutureState--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
)
GO
CREATE TABLE [dbo].[tblProjectDates]
(
 [ProjectDatesID]			INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectID]				INT NOT NULL, --ID of Project--
 [ScheduledStartDate]		DATETIME, --Scheduled Start Date--
 [ScheduledEndDate]			DATETIME, --Scheduled End Date--
 [ActualStartDate]			DATETIME, --Actual Start Date--
 [ActualEndDate]			DATETIME, --Actual End Date--
 [RequestedDate]			DATETIME, --Date Requested--
 [ContactedDate]			DATETIME, --Date Contacted--
 [ArchiveDate]				DATETIME, --Date Archived--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
)
GO
CREATE TABLE [dbo].[tblProjectStatusUpdates]
(
 [ProjectStatusUpdatesID]	INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectID]				INT NOT NULL, --ID of Project--
 [ProjectStatusUpdate]		NVARCHAR(500) NOT NULL, --Status Update--
 [ProjectStatusUpdateDate]	DATETIME NOT NULL, --Time of Status Update--
 
 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
)
GO
CREATE TABLE [dbo].[tblProjectFeedback]
(
 [ProjectFeedbackID]		INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectID]				INT NOT NULL, --ID of Project--
 [FeedbackSubmitterName]	NVARCHAR(30) NOT NULL, --Name of Submitter--
 [FeedbackSubmitterEmail]	NVARCHAR(35) NOT NULL, --Email of Submitter--
 [FeedbackSubmitterDepartment]	NVARCHAR(35) NOT NULL, --Department of Submitter--

 FOREIGN KEY ([ProjectID]) REFERENCES [dbo].[tblProjectInformation] ([ProjectID]),
 CONSTRAINT [UQ_tblProjectFeedback] UNIQUE NONCLUSTERED ([ProjectID] ASC, [FeedbackSubmitterName] ASC, [FeedbackSubmitterEmail] ASC, [FeedbackSubmitterDepartment] ASC)
)
GO
CREATE TABLE [dbo].[tblFeedbackQuestionAnswer]
(
 [FeedbackQuestionAnswerID]	INT IDENTITY(1,1) PRIMARY KEY, --ID--
 [ProjectFeedbackID]		INT NOT NULL, --ID of Project--
 [FeedbackQuestionID]		INT NOT NULL, --ID of Question--
 [FeedbackAnswerRank]		INT CHECK([FeedbackAnswerRank] BETWEEN 1 AND 5), --Answer to question as a rank--
 [FeedbackAnswerOpenEnd]	NVARCHAR(500), --Answer to question as open ended--
 FOREIGN KEY ([ProjectFeedbackID]) REFERENCES [dbo].[tblProjectFeedback] ([ProjectFeedbackID]),
 FOREIGN KEY ([FeedbackQuestionID]) REFERENCES [dbo].[tblFeedbackQuestions] ([QuestionID]),
)
GO
CREATE TABLE [dbo].[tblAudit]
(
 [Type]						CHAR(1),
 [TableName]				VARCHAR(128),
 [PK]						INT, 
 [FieldName]				VARCHAR(128), 
 [OldValue]					VARCHAR(1000), 
 [NewValue]					VARCHAR(1000), 
 [UpdateDate]				DATETIME, 
 [UserName]					VARCHAR(128)
)
GO
CREATE INDEX index_tblAudit_TableName ON tblAudit (TableName)