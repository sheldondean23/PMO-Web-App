USE HSISProjectsTest
GO 
CREATE PROCEDURE dbo.sp_table_names
	
AS
SET NOCOUNT ON;
SELECT name
FROM sys.Tables
GO

CREATE PROCEDURE dbo.sp_table_row_names
	@TableName nchar(50)
AS
SET NOCOUNT ON;
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableName
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------INSERTS---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dbo.sp_Project_Insert
	@Name NCHAR(55),
	@PrimaryLeadID	INT,
	@SecondaryLeadID INT,
	@TypeID INT,
	@SizeID INT,
	@RequesterID INT,
	@PriorityID INT,
	@StatusID INT,
	@DepartmentOfRequest NCHAR(50),
	@LaborHours FLOAT,
	@RankingScore INT,
	@Submitter NCHAR(30),
	@FOPALnumber NVARCHAR(26),
	@ProjectID INT OUTPUT
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectInformation] ([ProjectName],[HSISPrimaryLeadID],[HSISSecondaryLeadID],[ProjectRequestTypeID],[ProjectSizeID],[ProjectRequesterID],[ProjectPriorityID],[ProjectStatusID],[DepartmentOfRequest],[ProjectLaborHours],[ProjectRankingScore],[ProjectSubmitter],[ProjectFOPALnumber])
	VALUES (@Name,@PrimaryLeadID,@SecondaryLeadID,@TypeID,@SizeID,@RequesterID,@PriorityID,@StatusID,@DepartmentOfRequest,@LaborHours,@RankingScore,@Submitter,@FOPALnumber);

	SELECT @ProjectID = (
							SELECT [ProjectID] 
							FROM [tblProjectInformation] 
							WHERE [ProjectName] = @Name
						)
GO

CREATE PROCEDURE dbo.sp_Project_Resource_Insert
	@ProjectID INT,
	@ResourceID INT
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectResources]([ResourceID],[ProjectID])
	VALUES (@ResourceID,@ProjectID);
GO

CREATE PROCEDURE dbo.sp_Project_Facility_Insert
	@ProjectID INT,
	@FacilityID INT
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectFacilities]([FacilityID],[ProjectID])
	VALUES (@FacilityID,@ProjectID);
GO

CREATE PROCEDURE dbo.sp_Project_Category_Insert
	@ProjectID INT,
	@CategoryID INT
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectCategories]([CategoryID],[ProjectID])
	VALUES (@CategoryID,@ProjectID);
GO

CREATE PROCEDURE dbo.sp_Budget_Insert
	@ProjectID INT,
	@DesiredBudget INT,
	@ActualBudget INT
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectBudget]([ProjectID],[ProjectDesiredBudget],[ProjectActualBudget])
	VALUES (@ProjectID,@ProjectID,@ActualBudget);
GO

CREATE PROCEDURE dbo.sp_Dates_Insert
	@ProjectID INT,
	@SchedualedStartDate DATETIME,
	@SchedualedEndDate DATETIME,
	@ActualStartDate DATETIME,
	@ActualEndDate DATETIME,
	@RequestedDate DATETIME,
	@ContactedDate DATETIME,
	@ArchiveDate DATETIME
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectDates]([ProjectID], [ScheduledStartDate],[ScheduledEndDate],[ActualStartDate],[ActualEndDate],[RequestedDate],[ContactedDate],[ArchiveDate])
	VALUES (@ProjectID,	@SchedualedStartDate,@SchedualedEndDate,@ActualStartDate , @ActualEndDate ,	@RequestedDate ,@ContactedDate ,@ArchiveDate );
GO

CREATE PROCEDURE dbo.sp_Prupose_Insert
	@ProjectID INT,
	@Comments NCHAR(550),
	@FutureState NCHAR(550)
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectPurpose]([ProjectID],[Comments],[FutureState])
	VALUES (@ProjectID,@Comments,@FutureState );
GO

CREATE PROCEDURE dbo.sp_StatusUpdate_Insert
	@ProjectID INT,
	@ProjectStatusUpdate NCHAR(550),
	@ProjectStatusUpdateDate DATETIME
AS
SET NOCOUNT ON;
	INSERT INTO [tblProjectStatusUpdates]([ProjectID],[ProjectStatusUpdate],[ProjectStatusUpdateDate])
	VALUES (@ProjectID,@ProjectStatusUpdate,@ProjectStatusUpdateDate);
GO

CREATE PROCEDURE dbo.sp_Feedback_Insert
	@ProjectID INT,
	@FeedbackSubmitterName NVARCHAR(30),
	@FeedbackSubmitterEmail NVARCHAR(35),
	@FeedbackSubmitterDepartment NVARCHAR(35),
	@ProjectFeedbackID INT OUTPUT
AS
SET NOCOUNT ON;
	INSERT INTO tblProjectFeedback(ProjectID,FeedbackSubmitterName,FeedbackSubmitterEmail,FeedbackSubmitterDepartment)
	VALUES (@ProjectID,@FeedbackSubmitterName,@FeedbackSubmitterEmail,@FeedbackSubmitterDepartment);

	SELECT @ProjectFeedbackID = (
							SELECT ProjectFeedbackID 
							FROM tblProjectFeedback 
							WHERE ProjectID = @ProjectID and FeedbackSubmitterName = @FeedbackSubmitterName and FeedbackSubmitterEmail = @FeedbackSubmitterEmail and FeedbackSubmitterDepartment = @FeedbackSubmitterDepartment
								)
GO

CREATE PROCEDURE dbo.sp_FeedbackResponces_Insert
	@ProjectFeedbackID INT,
	@FeedbackQuestionID INT,
	@FeedbackAnswerRank INT,
	@FeedbackAnswerOpenEnd NVARCHAR(550)
AS
SET NOCOUNT ON;
	INSERT INTO tblFeedbackQuestionAnswer(ProjectFeedbackID,FeedbackQuestionID,FeedbackAnswerRank,FeedbackAnswerOpenEnd)
	VALUES (@ProjectFeedbackID,@FeedbackQuestionID,@FeedbackAnswerRank,@FeedbackAnswerOpenEnd);
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------DELETE---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dbo.sp_Project_Delete
	@ProjectName NCHAR(55)
AS
	DECLARE @ProjectID int
	SELECT @ProjectID = (
							SELECT [ProjectID] 
							FROM [tblProjectInformation] 
							WHERE [ProjectName] = @ProjectName
						)
	DELETE FROM tblProjectBudget WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectFacilities  WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectCategories WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectDates    WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectPurpose  WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectStatusUpdates WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectResources WHERE [ProjectID] = @ProjectID
	DELETE FROM tblProjectInformation WHERE [ProjectName] = @ProjectName;
GO

CREATE PROCEDURE dbo.sp_Project_Resource_Remove
	@ProjectID INT,
	@ResourceID INT
AS
SET NOCOUNT ON;
DELETE FROM tblProjectResources WHERE ProjectID = @ProjectID AND ResourceID = @ResourceID
GO

CREATE PROCEDURE dbo.sp_Project_Category_Remove
	@ProjectID INT,
	@CategoryID INT
AS
SET NOCOUNT ON;
DELETE FROM tblProjectCategories WHERE ProjectID = @ProjectID AND CategoryID = @CategoryID
GO

CREATE PROCEDURE dbo.sp_Project_Facility_Remove
	@ProjectID INT,
	@FacilityID INT
AS
SET NOCOUNT ON;
DELETE FROM tblProjectFacilities WHERE ProjectID = @ProjectID AND FacilityID = @FacilityID
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------UPDATE---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].sp_Requester_Update
(
	@Name varchar(30),
	@Email varchar(35),
	@Phone NVARCHAR(17),
	@RequestID int OUTPUT
)
AS
	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM tblProjectRequester WHERE ProjectRequesterName = @Name and ProjectRequesterEmail = @Email and ProjectRequesterPhone = @Phone)
			SELECT @RequestID = (
									SELECT ProjectRequesterID 
									FROM tblProjectRequester 
									WHERE ProjectRequesterName = @Name and ProjectRequesterEmail = @Email and ProjectRequesterPhone = @Phone
								)
	ELSE
			INSERT INTO tblProjectRequester (ProjectRequesterName,ProjectRequesterEmail,ProjectRequesterPhone)
			VALUES (@Name,@Email,@Phone);
			SELECT @RequestID = (
									SELECT ProjectRequesterID 
									FROM tblProjectRequester 
									WHERE ProjectRequesterName = @Name and ProjectRequesterEmail = @Email and ProjectRequesterPhone = @Phone
								)	
GO

CREATE PROCEDURE dbo.sp_Project_Update
	@Name NCHAR(55),
	@PrimaryLeadID	INT,
	@SecondaryLeadID INT,
	@TypeID INT,
	@SizeID INT,
	@RequesterID INT,
	@PriorityID INT,
	@StatusID INT,
	@DepartmentOfRequest NCHAR(50),
	@LaborHours FLOAT,
	@RankingScore INT,
	@Submitter NCHAR(30),
	@FOPALnumber NVARCHAR(26),
	@ProjectID INT 
AS
SET NOCOUNT ON;
	UPDATE tblProjectInformation
	SET ProjectName=@Name,HSISPrimaryLeadID=@PrimaryLeadID,HSISSecondaryLeadID=@SecondaryLeadID,ProjectRequestTypeID=@TypeID,ProjectSizeID=@SizeID,ProjectRequesterID=@RequesterID,ProjectPriorityID=@PriorityID,ProjectStatusID=@StatusID,DepartmentOfRequest=@DepartmentOfRequest,ProjectLaborHours=@LaborHours,ProjectRankingScore=@RankingScore,ProjectSubmitter=@Submitter,ProjectFOPALnumber=@FOPALnumber
	WHERE ProjectID=@ProjectID;
GO


CREATE PROCEDURE dbo.sp_Budget_Update
	@ProjectID INT,
	@DesiredBudget INT,
	@ActualBudget INT
AS
	UPDATE tblProjectBudget
	SET tblProjectBudget.ProjectActualBudget =@ActualBudget ,tblProjectBudget.ProjectDesiredBudget =@DesiredBudget
	FROM tblProjectBudget
	INNER JOIN tblProjectInformation ON tblProjectInformation.ProjectID = tblProjectBudget.ProjectID 
	WHERE tblProjectInformation.ProjectID=@ProjectID;
IF @@ROWCOUNT=0
	INSERT INTO [tblProjectBudget]([ProjectID],[ProjectDesiredBudget],[ProjectActualBudget])
	VALUES (@ProjectID,@ProjectID,@ActualBudget);
GO

CREATE PROCEDURE dbo.sp_Dates_Update
	@ProjectID INT,
	@ScheduledStartDate DATETIME,
	@ScheduledEndDate DATETIME,
	@ActualStartDate DATETIME,
	@ActualEndDate DATETIME,
	@RequestedDate DATETIME,
	@ContactedDate DATETIME,
	@ArchiveDate DATETIME
AS
SET NOCOUNT ON;
	UPDATE tblProjectDates
	SET tblProjectDates.ActualEndDate=@ActualEndDate,tblProjectDates.ActualStartDate=@ActualStartDate,tblProjectDates.ArchiveDate=@ArchiveDate,tblProjectDates.ContactedDate=@ContactedDate,tblProjectDates.RequestedDate=@RequestedDate,tblProjectDates.ScheduledEndDate=@ScheduledEndDate,tblProjectDates.ScheduledStartDate=@ScheduledStartDate
	FROM tblProjectDates
	INNER JOIN tblProjectInformation ON tblProjectInformation.ProjectID = tblProjectDates.ProjectID 
	WHERE tblProjectInformation.ProjectID=@ProjectID;
IF @@ROWCOUNT=0
	INSERT INTO [tblProjectDates]([ProjectID], [ScheduledStartDate],[ScheduledEndDate],[ActualStartDate],[ActualEndDate],[RequestedDate],[ContactedDate],[ArchiveDate])
	VALUES (@ProjectID,	@ScheduledStartDate,@ScheduledEndDate,@ActualStartDate , @ActualEndDate ,	@RequestedDate ,@ContactedDate ,@ArchiveDate );
GO

CREATE PROCEDURE dbo.sp_Purpose_Update
	@ProjectID INT,
	@Comments NCHAR(550),
	@FutureState NCHAR(550)
AS
SET NOCOUNT ON;
	UPDATE tblProjectPurpose
	SET tblProjectPurpose.FutureState=@FutureState,tblProjectPurpose.Comments=@Comments
	FROM tblProjectPurpose
	INNER JOIN tblProjectInformation ON tblProjectInformation.ProjectID = tblProjectPurpose.ProjectID 
	WHERE tblProjectInformation.ProjectID=@ProjectID;
IF @@ROWCOUNT=0
	INSERT INTO [tblProjectPurpose]([ProjectID],[Comments],[FutureState])
	VALUES (@ProjectID,@Comments,@FutureState );
GO

CREATE PROCEDURE dbo.sp_Project_Resource_Update
	@ProjectID INT,
	@ResourceID INT
AS
SET NOCOUNT ON;
DECLARE @ResourceMiddleID INT SELECT 
@ResourceMiddleID = (SELECT tblProjectResources.ConvertionID  FROM tblProjectResources WHERE tblProjectResources.ProjectID=@ProjectID AND tblProjectResources.ResourceID=@ResourceID)
	IF (@ResourceMiddleID IS NULL)
		INSERT INTO [tblProjectResources]([ResourceID],[ProjectID])
		VALUES (@ResourceID,@ProjectID);
GO

CREATE PROCEDURE dbo.sp_Project_Facility_Update
	@ProjectID INT,
	@FacilityID INT
AS
SET NOCOUNT ON;
DECLARE @FacilityMiddleID INT SELECT 
@FacilityMiddleID = (SELECT tblProjectFacilities.ConvertionID  FROM tblProjectFacilities WHERE tblProjectFacilities.ProjectID=@ProjectID AND tblProjectFacilities.FacilityID=@FacilityID)
	IF (@FacilityMiddleID IS NULL)
		INSERT INTO [tblProjectFacilities]([FacilityID],[ProjectID])
		VALUES (@FacilityID,@ProjectID);
GO

CREATE PROCEDURE dbo.sp_Project_Category_Update
	@ProjectID INT,
	@CategoryID INT
AS
SET NOCOUNT ON;
DECLARE @CategoryMiddleID INT SELECT 
@CategoryMiddleID = (SELECT tblProjectCategories.ConvertionID  FROM tblProjectCategories WHERE tblProjectCategories.ProjectID=@ProjectID AND tblProjectCategories.CategoryID=@CategoryID)
	IF (@CategoryMiddleID IS NULL)
		INSERT INTO tblProjectCategories([CategoryID],[ProjectID])
		VALUES (@CategoryID,@ProjectID);
GO

CREATE PROCEDURE dbo.sp_StatusUpdate_Update
	@StatusUpdatesID INT,
	@ProjectStatusUpdate NCHAR(550),
	@ProjectStatusUpdateDate DATETIME
AS
SET NOCOUNT ON;
	UPDATE tblProjectStatusUpdates
	SET ProjectStatusUpdate=@ProjectStatusUpdate,ProjectStatusUpdateDate=@ProjectStatusUpdateDate
	WHERE ProjectStatusUpdatesID = @StatusUpdatesID;
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------SELECT----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE dbo.sp_All_of_one_Project
	@ProjectName NCHAR(55)
AS
SET NOCOUNT ON;
SELECT tblProjectRequester.ProjectRequesterEmail,tblProjectRequester.ProjectRequesterName,tblProjectRequester.ProjectRequesterPhone,tblProjectInformation.ProjectName,tblProjectInformation.DepartmentOfRequest,tblProjectInformation.ProjectSubmitter,
		tblProjectInformation.ProjectRankingScore,tblProjectInformation.ProjectLaborHours,tblProjectPurpose.Comments,tblProjectPurpose.FutureState,tblProjectBudget.ProjectActualBudget,tblProjectBudget.ProjectDesiredBudget,
		tblProjectRequestType.ProjectRequestTypeName,tblHSISPrimaryLead.PrimaryLeadName,tblHSISSecondaryLead.SecondaryLeadName,tblProjectSize.ProjectSizeName,tblProjectPriority.PriorityName,tblProjectStatus.StatusName,tblProjectDates.ActualEndDate,tblProjectDates.ActualStartDate,
		tblProjectDates.ArchiveDate,tblProjectDates.ContactedDate,tblProjectDates.ScheduledEndDate,tblProjectDates.ScheduledStartDate,tblProjectDates.RequestedDate 
FROM tblProjectInformation
LEFT JOIN tblProjectRequester ON tblProjectRequester.ProjectRequesterID = tblProjectInformation.ProjectRequesterID 
LEFT JOIN tblProjectPurpose ON tblProjectPurpose.ProjectID = tblProjectInformation.ProjectID 
LEFT JOIN tblProjectBudget ON tblProjectBudget.ProjectID = tblProjectInformation.ProjectID 
LEFT JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID 
LEFT JOIN tblProjectRequestType ON tblProjectRequestType.ProjectRequestTypeID = tblProjectInformation.ProjectRequestTypeID 
LEFT JOIN tblHSISPrimaryLead ON tblHSISPrimaryLead.PrimaryLeadID = tblProjectInformation.HSISPrimaryLeadID  
LEFT JOIN tblHSISSecondaryLead ON tblHSISSecondaryLead.SecondaryLeadID = tblProjectInformation.HSISSecondaryLeadID 
LEFT JOIN tblProjectSize ON tblProjectSize.ProjectSizeID = tblProjectInformation.ProjectSizeID 
LEFT JOIN tblProjectPriority ON tblProjectPriority.PriorityID = tblProjectInformation.ProjectPriorityID 
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
WHERE tblProjectInformation.ProjectName = @ProjectName
GO

CREATE PROCEDURE sp_Project_Status_Updates
		@PorjectName NVARCHAR(55)
AS
SET NOCOUNT ON

	SELECT ProjectStatusUpdatesID,ProjectStatusUpdate AS 'Status Updates',ProjectStatusUpdateDate
	FROM tblProjectStatusUpdates
	inner join tblProjectInformation on tblProjectStatusUpdates.ProjectID = tblProjectInformation.ProjectID
	WHERE tblProjectInformation.ProjectName = @PorjectName 
	ORDER BY ProjectStatusUpdateDate DESC

GO

CREATE PROCEDURE dbo.sp_All_of_one_Project_facility
	@ProjectName NCHAR(55)
AS
SET NOCOUNT ON;
DECLARE @ProjectID int
	SELECT @ProjectID = (
							SELECT [ProjectID] 
							FROM [tblProjectInformation] 
							WHERE [ProjectName] = @ProjectName
						)
	SELECT  tblFacitities.FacitityName FROM tblFacitities
	INNER JOIN tblSystemFacilities ON tblSystemFacilities.FacitityID = tblFacitities.FacitityID 
	WHERE tblSystemFacilities.ProjectID  = @ProjectID
GO

CREATE PROCEDURE dbo.sp_All_of_one_Project_category
	@ProjectName NCHAR(55)
AS
SET NOCOUNT ON;
DECLARE @ProjectID int
	SELECT @ProjectID = (
							SELECT [ProjectID] 
							FROM [tblProjectInformation] 
							WHERE [ProjectName] = @ProjectName
						)
	SELECT  tblCategories.CategoryName FROM tblCategories
	INNER JOIN tblProjectCategories ON tblProjectCategories.CategoryID = tblCategories.CategoryID 
	WHERE tblProjectCategories.ProjectID  = @ProjectID
GO

CREATE PROCEDURE dbo.sp_Project_List
	
AS
SET NOCOUNT ON;
SELECT tblProjectRequester.ProjectRequesterEmail,tblProjectRequester.ProjectRequesterName,tblProjectRequester.ProjectRequesterPhone,tblProjectInformation.ProjectName,tblProjectInformation.DepartmentOfRequest,tblProjectInformation.ProjectSubmitter,tblProjectInformation.ProjectResorces,
		tblProjectInformation.ProjectRankingScore,tblProjectInformation.ProjectLaborHours,tblProjectPurpose.Comments,tblProjectPurpose.FutureState,tblProjectBudget.ProjectActualBudget,tblProjectBudget.ProjectDesiredBudget,
		tblProjectRequestType.ProjectRequestTypeName,tblHSISPrimaryLead.PrimaryLeadName,tblHSISSecondaryLead.SecondaryLeadName,tblProjectSize.ProjectSizeName,tblProjectPriority.PriorityName,tblProjectStatus.StatusName,tblProjectDates.ActualEndDate,tblProjectDates.ActualStartDate,
		tblProjectDates.ArchiveDate,tblProjectDates.ContactedDate,tblProjectDates.SchedualedEndDate,tblProjectDates.SchedualedStartDate,tblProjectDates.RequestedDate 
FROM tblProjectInformation
LEFT JOIN tblProjectRequester ON tblProjectRequester.ProjectRequesterID = tblProjectInformation.ProjectRequesterID 
LEFT JOIN tblProjectPurpose ON tblProjectPurpose.ProjectID = tblProjectInformation.ProjectID 
LEFT JOIN tblProjectBudget ON tblProjectBudget.ProjectID = tblProjectInformation.ProjectID 
LEFT JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID 
LEFT JOIN tblProjectRequestType ON tblProjectRequestType.ProjectRequestTypeID = tblProjectInformation.ProjectRequestTypeID 
LEFT JOIN tblHSISPrimaryLead ON tblHSISPrimaryLead.PrimaryLeadID = tblProjectInformation.HSISPrimaryLeadID 
LEFT JOIN tblHSISSecondaryLead ON tblHSISSecondaryLead.SecondaryLeadID = tblProjectInformation.HSISSecondaryLeadID 
LEFT JOIN tblProjectSize ON tblProjectSize.ProjectSizeID = tblProjectInformation.ProjectSizeID 
LEFT JOIN tblProjectPriority ON tblProjectPriority.PriorityID = tblProjectInformation.ProjectPriorityID 
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID 
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------TRIGGERS------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
