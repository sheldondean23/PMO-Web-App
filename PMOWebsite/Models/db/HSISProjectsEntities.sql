
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/12/2016 14:04:13
-- Generated from EDMX file: C:\Users\J00459735\Desktop\PMOWebsite\PMOWebsite\Models\db\HSISProjectsEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HSISProjects];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__tblFeedba__Feedb__3552E9B6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblFeedbackQuestionAnswer] DROP CONSTRAINT [FK__tblFeedba__Feedb__3552E9B6];
GO
IF OBJECT_ID(N'[dbo].[FK__tblFeedba__Proje__345EC57D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblFeedbackQuestionAnswer] DROP CONSTRAINT [FK__tblFeedba__Proje__345EC57D];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Categ__51300E55]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectCategories] DROP CONSTRAINT [FK__tblProjec__Categ__51300E55];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Facil__4C6B5938]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectFacilities] DROP CONSTRAINT [FK__tblProjec__Facil__4C6B5938];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__HSISP__3D2915A8]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__HSISP__3D2915A8];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__HSISS__3E1D39E1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__HSISS__3E1D39E1];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__308E3499]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectFeedback] DROP CONSTRAINT [FK__tblProjec__Proje__308E3499];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__3F115E1A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__Proje__3F115E1A];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__40058253]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__Proje__40058253];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__40F9A68C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__Proje__40F9A68C];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__41EDCAC5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__Proje__41EDCAC5];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__42E1EEFE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectInformation] DROP CONSTRAINT [FK__tblProjec__Proje__42E1EEFE];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__46B27FE2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectResources] DROP CONSTRAINT [FK__tblProjec__Proje__46B27FE2];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__4B7734FF]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectFacilities] DROP CONSTRAINT [FK__tblProjec__Proje__4B7734FF];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__503BEA1C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectCategories] DROP CONSTRAINT [FK__tblProjec__Proje__503BEA1C];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__540C7B00]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectBudget] DROP CONSTRAINT [FK__tblProjec__Proje__540C7B00];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__56E8E7AB]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectPurpose] DROP CONSTRAINT [FK__tblProjec__Proje__56E8E7AB];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__59C55456]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectDates] DROP CONSTRAINT [FK__tblProjec__Proje__59C55456];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Proje__5CA1C101]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectStatusUpdates] DROP CONSTRAINT [FK__tblProjec__Proje__5CA1C101];
GO
IF OBJECT_ID(N'[dbo].[FK__tblProjec__Resou__47A6A41B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProjectResources] DROP CONSTRAINT [FK__tblProjec__Resou__47A6A41B];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[tblCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblCategories];
GO
IF OBJECT_ID(N'[dbo].[tblFacilities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblFacilities];
GO
IF OBJECT_ID(N'[dbo].[tblFeedbackQuestionAnswer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblFeedbackQuestionAnswer];
GO
IF OBJECT_ID(N'[dbo].[tblFeedbackQuestions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblFeedbackQuestions];
GO
IF OBJECT_ID(N'[dbo].[tblHSISPrimaryLead]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblHSISPrimaryLead];
GO
IF OBJECT_ID(N'[dbo].[tblHSISSecondaryLead]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblHSISSecondaryLead];
GO
IF OBJECT_ID(N'[dbo].[tblProjectBudget]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectBudget];
GO
IF OBJECT_ID(N'[dbo].[tblProjectCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectCategories];
GO
IF OBJECT_ID(N'[dbo].[tblProjectDates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectDates];
GO
IF OBJECT_ID(N'[dbo].[tblProjectFacilities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectFacilities];
GO
IF OBJECT_ID(N'[dbo].[tblProjectFeedback]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectFeedback];
GO
IF OBJECT_ID(N'[dbo].[tblProjectInformation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectInformation];
GO
IF OBJECT_ID(N'[dbo].[tblProjectPriority]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectPriority];
GO
IF OBJECT_ID(N'[dbo].[tblProjectPurpose]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectPurpose];
GO
IF OBJECT_ID(N'[dbo].[tblProjectRequester]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectRequester];
GO
IF OBJECT_ID(N'[dbo].[tblProjectRequestType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectRequestType];
GO
IF OBJECT_ID(N'[dbo].[tblProjectResources]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectResources];
GO
IF OBJECT_ID(N'[dbo].[tblProjectSize]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectSize];
GO
IF OBJECT_ID(N'[dbo].[tblProjectStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectStatus];
GO
IF OBJECT_ID(N'[dbo].[tblProjectStatusUpdates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProjectStatusUpdates];
GO
IF OBJECT_ID(N'[dbo].[tblResources]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblResources];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'tblCategories'
CREATE TABLE [dbo].[tblCategories] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblFacilities'
CREATE TABLE [dbo].[tblFacilities] (
    [FacitityID] int IDENTITY(1,1) NOT NULL,
    [FacitityName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblFeedbackQuestionAnswers'
CREATE TABLE [dbo].[tblFeedbackQuestionAnswers] (
    [FeedbackQuestionAnswerID] int IDENTITY(1,1) NOT NULL,
    [ProjectFeedbackID] int  NOT NULL,
    [FeedbackQuestionID] int  NOT NULL,
    [FeedbackAnswerRank] int  NULL,
    [FeedbackAnswerOpenEnd] nvarchar(500)  NULL
);
GO

-- Creating table 'tblFeedbackQuestions'
CREATE TABLE [dbo].[tblFeedbackQuestions] (
    [QuestionID] int IDENTITY(1,1) NOT NULL,
    [QuestionContent] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'tblHSISPrimaryLeads'
CREATE TABLE [dbo].[tblHSISPrimaryLeads] (
    [PrimaryLeadID] int IDENTITY(1,1) NOT NULL,
    [PrimaryLeadName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblHSISSecondaryLeads'
CREATE TABLE [dbo].[tblHSISSecondaryLeads] (
    [SecondaryLeadID] int IDENTITY(1,1) NOT NULL,
    [SecondaryLeadName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblProjectBudgets'
CREATE TABLE [dbo].[tblProjectBudgets] (
    [ProjectBudgetID] int IDENTITY(1,1) NOT NULL,
    [ProjectID] int  NOT NULL,
    [ProjectDesiredBudget] int  NULL,
    [ProjectActualBudget] int  NULL
);
GO

-- Creating table 'tblProjectCategories'
CREATE TABLE [dbo].[tblProjectCategories] (
    [ConvertionID] int IDENTITY(1,1) NOT NULL,
    [CategoryID] int  NOT NULL,
    [ProjectID] int  NOT NULL
);
GO

-- Creating table 'tblProjectDates'
CREATE TABLE [dbo].[tblProjectDates] (
    [ProjectDatesID] int IDENTITY(1,1) NOT NULL,
    [ProjectID] int  NOT NULL,
    [ScheduledStartDate] datetime  NULL,
    [ScheduledEndDate] datetime  NULL,
    [ActualStartDate] datetime  NULL,
    [ActualEndDate] datetime  NULL,
    [RequestedDate] datetime  NULL,
    [ContactedDate] datetime  NULL,
    [ArchiveDate] datetime  NULL
);
GO

-- Creating table 'tblProjectFacilities'
CREATE TABLE [dbo].[tblProjectFacilities] (
    [ConvertionID] int IDENTITY(1,1) NOT NULL,
    [FacilityID] int  NOT NULL,
    [ProjectID] int  NOT NULL
);
GO

-- Creating table 'tblProjectFeedbacks'
CREATE TABLE [dbo].[tblProjectFeedbacks] (
    [ProjectFeedbackID] int IDENTITY(1,1) NOT NULL,
    [ProjectID] int  NOT NULL,
    [FeedbackSubmitterName] nvarchar(30)  NULL,
    [FeedbackSubmitterEmail] nvarchar(35)  NOT NULL,
    [FeedbackSubmitterDepartment] nvarchar(35)  NOT NULL
);
GO

-- Creating table 'tblProjectInformations'
CREATE TABLE [dbo].[tblProjectInformations] (
    [ProjectID] int IDENTITY(1,1) NOT NULL,
    [ProjectName] nvarchar(55)  NOT NULL,
    [HSISPrimaryLeadID] int  NULL,
    [HSISSecondaryLeadID] int  NULL,
    [ProjectRequestTypeID] int  NOT NULL,
    [ProjectSizeID] int  NULL,
    [ProjectRequesterID] int  NOT NULL,
    [ProjectPriorityID] int  NULL,
    [ProjectStatusID] int  NULL,
    [DepartmentOfRequest] nvarchar(50)  NOT NULL,
    [ProjectLaborHours] float  NULL,
    [ProjectRankingScore] int  NULL,
    [ProjectSubmitter] nvarchar(30)  NOT NULL,
    [ProjectFOPALnumber] nvarchar(26)  NULL
);
GO

-- Creating table 'tblProjectPriorities'
CREATE TABLE [dbo].[tblProjectPriorities] (
    [PriorityID] int IDENTITY(1,1) NOT NULL,
    [PriorityName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblProjectPurposes'
CREATE TABLE [dbo].[tblProjectPurposes] (
    [ProjectPurposeID] int IDENTITY(1,1) NOT NULL,
    [ProjectID] int  NOT NULL,
    [Comments] nvarchar(500)  NULL,
    [FutureState] nvarchar(500)  NULL
);
GO

-- Creating table 'tblProjectRequesters'
CREATE TABLE [dbo].[tblProjectRequesters] (
    [ProjectRequesterID] int IDENTITY(1,1) NOT NULL,
    [ProjectRequesterName] nvarchar(30)  NOT NULL,
    [ProjectRequesterEmail] nvarchar(35)  NOT NULL,
    [ProjectRequesterPhone] nvarchar(17)  NOT NULL
);
GO

-- Creating table 'tblProjectRequestTypes'
CREATE TABLE [dbo].[tblProjectRequestTypes] (
    [ProjectRequestTypeID] int IDENTITY(1,1) NOT NULL,
    [ProjectRequestTypeName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblProjectResources'
CREATE TABLE [dbo].[tblProjectResources] (
    [ConvertionID] int IDENTITY(1,1) NOT NULL,
    [ResourceID] int  NOT NULL,
    [ProjectID] int  NOT NULL
);
GO

-- Creating table 'tblProjectSizes'
CREATE TABLE [dbo].[tblProjectSizes] (
    [ProjectSizeID] int IDENTITY(1,1) NOT NULL,
    [ProjectSizeName] nvarchar(10)  NULL
);
GO

-- Creating table 'tblProjectStatus'
CREATE TABLE [dbo].[tblProjectStatus] (
    [StatusID] int IDENTITY(1,1) NOT NULL,
    [StatusName] nvarchar(30)  NULL
);
GO

-- Creating table 'tblProjectStatusUpdates'
CREATE TABLE [dbo].[tblProjectStatusUpdates] (
    [ProjectStatusUpdatesID] int IDENTITY(1,1) NOT NULL,
    [ProjectID] int  NOT NULL,
    [ProjectStatusUpdate] nvarchar(500)  NULL,
    [ProjectStatusUpdateDate] datetime  NOT NULL
);
GO

-- Creating table 'tblResources'
CREATE TABLE [dbo].[tblResources] (
    [ResourceID] int IDENTITY(1,1) NOT NULL,
    [ResourceName] nvarchar(30)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [CategoryID] in table 'tblCategories'
ALTER TABLE [dbo].[tblCategories]
ADD CONSTRAINT [PK_tblCategories]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [FacitityID] in table 'tblFacilities'
ALTER TABLE [dbo].[tblFacilities]
ADD CONSTRAINT [PK_tblFacilities]
    PRIMARY KEY CLUSTERED ([FacitityID] ASC);
GO

-- Creating primary key on [FeedbackQuestionAnswerID] in table 'tblFeedbackQuestionAnswers'
ALTER TABLE [dbo].[tblFeedbackQuestionAnswers]
ADD CONSTRAINT [PK_tblFeedbackQuestionAnswers]
    PRIMARY KEY CLUSTERED ([FeedbackQuestionAnswerID] ASC);
GO

-- Creating primary key on [QuestionID] in table 'tblFeedbackQuestions'
ALTER TABLE [dbo].[tblFeedbackQuestions]
ADD CONSTRAINT [PK_tblFeedbackQuestions]
    PRIMARY KEY CLUSTERED ([QuestionID] ASC);
GO

-- Creating primary key on [PrimaryLeadID] in table 'tblHSISPrimaryLeads'
ALTER TABLE [dbo].[tblHSISPrimaryLeads]
ADD CONSTRAINT [PK_tblHSISPrimaryLeads]
    PRIMARY KEY CLUSTERED ([PrimaryLeadID] ASC);
GO

-- Creating primary key on [SecondaryLeadID] in table 'tblHSISSecondaryLeads'
ALTER TABLE [dbo].[tblHSISSecondaryLeads]
ADD CONSTRAINT [PK_tblHSISSecondaryLeads]
    PRIMARY KEY CLUSTERED ([SecondaryLeadID] ASC);
GO

-- Creating primary key on [ProjectBudgetID] in table 'tblProjectBudgets'
ALTER TABLE [dbo].[tblProjectBudgets]
ADD CONSTRAINT [PK_tblProjectBudgets]
    PRIMARY KEY CLUSTERED ([ProjectBudgetID] ASC);
GO

-- Creating primary key on [ConvertionID] in table 'tblProjectCategories'
ALTER TABLE [dbo].[tblProjectCategories]
ADD CONSTRAINT [PK_tblProjectCategories]
    PRIMARY KEY CLUSTERED ([ConvertionID] ASC);
GO

-- Creating primary key on [ProjectDatesID] in table 'tblProjectDates'
ALTER TABLE [dbo].[tblProjectDates]
ADD CONSTRAINT [PK_tblProjectDates]
    PRIMARY KEY CLUSTERED ([ProjectDatesID] ASC);
GO

-- Creating primary key on [ConvertionID] in table 'tblProjectFacilities'
ALTER TABLE [dbo].[tblProjectFacilities]
ADD CONSTRAINT [PK_tblProjectFacilities]
    PRIMARY KEY CLUSTERED ([ConvertionID] ASC);
GO

-- Creating primary key on [ProjectFeedbackID] in table 'tblProjectFeedbacks'
ALTER TABLE [dbo].[tblProjectFeedbacks]
ADD CONSTRAINT [PK_tblProjectFeedbacks]
    PRIMARY KEY CLUSTERED ([ProjectFeedbackID] ASC);
GO

-- Creating primary key on [ProjectID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [PK_tblProjectInformations]
    PRIMARY KEY CLUSTERED ([ProjectID] ASC);
GO

-- Creating primary key on [PriorityID] in table 'tblProjectPriorities'
ALTER TABLE [dbo].[tblProjectPriorities]
ADD CONSTRAINT [PK_tblProjectPriorities]
    PRIMARY KEY CLUSTERED ([PriorityID] ASC);
GO

-- Creating primary key on [ProjectPurposeID] in table 'tblProjectPurposes'
ALTER TABLE [dbo].[tblProjectPurposes]
ADD CONSTRAINT [PK_tblProjectPurposes]
    PRIMARY KEY CLUSTERED ([ProjectPurposeID] ASC);
GO

-- Creating primary key on [ProjectRequesterID] in table 'tblProjectRequesters'
ALTER TABLE [dbo].[tblProjectRequesters]
ADD CONSTRAINT [PK_tblProjectRequesters]
    PRIMARY KEY CLUSTERED ([ProjectRequesterID] ASC);
GO

-- Creating primary key on [ProjectRequestTypeID] in table 'tblProjectRequestTypes'
ALTER TABLE [dbo].[tblProjectRequestTypes]
ADD CONSTRAINT [PK_tblProjectRequestTypes]
    PRIMARY KEY CLUSTERED ([ProjectRequestTypeID] ASC);
GO

-- Creating primary key on [ConvertionID] in table 'tblProjectResources'
ALTER TABLE [dbo].[tblProjectResources]
ADD CONSTRAINT [PK_tblProjectResources]
    PRIMARY KEY CLUSTERED ([ConvertionID] ASC);
GO

-- Creating primary key on [ProjectSizeID] in table 'tblProjectSizes'
ALTER TABLE [dbo].[tblProjectSizes]
ADD CONSTRAINT [PK_tblProjectSizes]
    PRIMARY KEY CLUSTERED ([ProjectSizeID] ASC);
GO

-- Creating primary key on [StatusID] in table 'tblProjectStatus'
ALTER TABLE [dbo].[tblProjectStatus]
ADD CONSTRAINT [PK_tblProjectStatus]
    PRIMARY KEY CLUSTERED ([StatusID] ASC);
GO

-- Creating primary key on [ProjectStatusUpdatesID] in table 'tblProjectStatusUpdates'
ALTER TABLE [dbo].[tblProjectStatusUpdates]
ADD CONSTRAINT [PK_tblProjectStatusUpdates]
    PRIMARY KEY CLUSTERED ([ProjectStatusUpdatesID] ASC);
GO

-- Creating primary key on [ResourceID] in table 'tblResources'
ALTER TABLE [dbo].[tblResources]
ADD CONSTRAINT [PK_tblResources]
    PRIMARY KEY CLUSTERED ([ResourceID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryID] in table 'tblProjectCategories'
ALTER TABLE [dbo].[tblProjectCategories]
ADD CONSTRAINT [FK__tblProjec__Categ__51300E55]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[tblCategories]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Categ__51300E55'
CREATE INDEX [IX_FK__tblProjec__Categ__51300E55]
ON [dbo].[tblProjectCategories]
    ([CategoryID]);
GO

-- Creating foreign key on [FacilityID] in table 'tblProjectFacilities'
ALTER TABLE [dbo].[tblProjectFacilities]
ADD CONSTRAINT [FK__tblProjec__Facil__4C6B5938]
    FOREIGN KEY ([FacilityID])
    REFERENCES [dbo].[tblFacilities]
        ([FacitityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Facil__4C6B5938'
CREATE INDEX [IX_FK__tblProjec__Facil__4C6B5938]
ON [dbo].[tblProjectFacilities]
    ([FacilityID]);
GO

-- Creating foreign key on [FeedbackQuestionID] in table 'tblFeedbackQuestionAnswers'
ALTER TABLE [dbo].[tblFeedbackQuestionAnswers]
ADD CONSTRAINT [FK__tblFeedba__Feedb__3552E9B6]
    FOREIGN KEY ([FeedbackQuestionID])
    REFERENCES [dbo].[tblFeedbackQuestions]
        ([QuestionID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblFeedba__Feedb__3552E9B6'
CREATE INDEX [IX_FK__tblFeedba__Feedb__3552E9B6]
ON [dbo].[tblFeedbackQuestionAnswers]
    ([FeedbackQuestionID]);
GO

-- Creating foreign key on [ProjectFeedbackID] in table 'tblFeedbackQuestionAnswers'
ALTER TABLE [dbo].[tblFeedbackQuestionAnswers]
ADD CONSTRAINT [FK__tblFeedba__Proje__345EC57D]
    FOREIGN KEY ([ProjectFeedbackID])
    REFERENCES [dbo].[tblProjectFeedbacks]
        ([ProjectFeedbackID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblFeedba__Proje__345EC57D'
CREATE INDEX [IX_FK__tblFeedba__Proje__345EC57D]
ON [dbo].[tblFeedbackQuestionAnswers]
    ([ProjectFeedbackID]);
GO

-- Creating foreign key on [HSISPrimaryLeadID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__HSISP__3D2915A8]
    FOREIGN KEY ([HSISPrimaryLeadID])
    REFERENCES [dbo].[tblHSISPrimaryLeads]
        ([PrimaryLeadID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__HSISP__3D2915A8'
CREATE INDEX [IX_FK__tblProjec__HSISP__3D2915A8]
ON [dbo].[tblProjectInformations]
    ([HSISPrimaryLeadID]);
GO

-- Creating foreign key on [HSISSecondaryLeadID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__HSISS__3E1D39E1]
    FOREIGN KEY ([HSISSecondaryLeadID])
    REFERENCES [dbo].[tblHSISSecondaryLeads]
        ([SecondaryLeadID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__HSISS__3E1D39E1'
CREATE INDEX [IX_FK__tblProjec__HSISS__3E1D39E1]
ON [dbo].[tblProjectInformations]
    ([HSISSecondaryLeadID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectBudgets'
ALTER TABLE [dbo].[tblProjectBudgets]
ADD CONSTRAINT [FK__tblProjec__Proje__540C7B00]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__540C7B00'
CREATE INDEX [IX_FK__tblProjec__Proje__540C7B00]
ON [dbo].[tblProjectBudgets]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectCategories'
ALTER TABLE [dbo].[tblProjectCategories]
ADD CONSTRAINT [FK__tblProjec__Proje__503BEA1C]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__503BEA1C'
CREATE INDEX [IX_FK__tblProjec__Proje__503BEA1C]
ON [dbo].[tblProjectCategories]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectDates'
ALTER TABLE [dbo].[tblProjectDates]
ADD CONSTRAINT [FK__tblProjec__Proje__59C55456]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__59C55456'
CREATE INDEX [IX_FK__tblProjec__Proje__59C55456]
ON [dbo].[tblProjectDates]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectFacilities'
ALTER TABLE [dbo].[tblProjectFacilities]
ADD CONSTRAINT [FK__tblProjec__Proje__4B7734FF]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__4B7734FF'
CREATE INDEX [IX_FK__tblProjec__Proje__4B7734FF]
ON [dbo].[tblProjectFacilities]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectFeedbacks'
ALTER TABLE [dbo].[tblProjectFeedbacks]
ADD CONSTRAINT [FK__tblProjec__Proje__308E3499]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__308E3499'
CREATE INDEX [IX_FK__tblProjec__Proje__308E3499]
ON [dbo].[tblProjectFeedbacks]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectRequestTypeID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__Proje__3F115E1A]
    FOREIGN KEY ([ProjectRequestTypeID])
    REFERENCES [dbo].[tblProjectRequestTypes]
        ([ProjectRequestTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__3F115E1A'
CREATE INDEX [IX_FK__tblProjec__Proje__3F115E1A]
ON [dbo].[tblProjectInformations]
    ([ProjectRequestTypeID]);
GO

-- Creating foreign key on [ProjectSizeID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__Proje__40058253]
    FOREIGN KEY ([ProjectSizeID])
    REFERENCES [dbo].[tblProjectSizes]
        ([ProjectSizeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__40058253'
CREATE INDEX [IX_FK__tblProjec__Proje__40058253]
ON [dbo].[tblProjectInformations]
    ([ProjectSizeID]);
GO

-- Creating foreign key on [ProjectRequesterID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__Proje__40F9A68C]
    FOREIGN KEY ([ProjectRequesterID])
    REFERENCES [dbo].[tblProjectRequesters]
        ([ProjectRequesterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__40F9A68C'
CREATE INDEX [IX_FK__tblProjec__Proje__40F9A68C]
ON [dbo].[tblProjectInformations]
    ([ProjectRequesterID]);
GO

-- Creating foreign key on [ProjectPriorityID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__Proje__41EDCAC5]
    FOREIGN KEY ([ProjectPriorityID])
    REFERENCES [dbo].[tblProjectPriorities]
        ([PriorityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__41EDCAC5'
CREATE INDEX [IX_FK__tblProjec__Proje__41EDCAC5]
ON [dbo].[tblProjectInformations]
    ([ProjectPriorityID]);
GO

-- Creating foreign key on [ProjectStatusID] in table 'tblProjectInformations'
ALTER TABLE [dbo].[tblProjectInformations]
ADD CONSTRAINT [FK__tblProjec__Proje__42E1EEFE]
    FOREIGN KEY ([ProjectStatusID])
    REFERENCES [dbo].[tblProjectStatus]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__42E1EEFE'
CREATE INDEX [IX_FK__tblProjec__Proje__42E1EEFE]
ON [dbo].[tblProjectInformations]
    ([ProjectStatusID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectResources'
ALTER TABLE [dbo].[tblProjectResources]
ADD CONSTRAINT [FK__tblProjec__Proje__46B27FE2]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__46B27FE2'
CREATE INDEX [IX_FK__tblProjec__Proje__46B27FE2]
ON [dbo].[tblProjectResources]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectPurposes'
ALTER TABLE [dbo].[tblProjectPurposes]
ADD CONSTRAINT [FK__tblProjec__Proje__56E8E7AB]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__56E8E7AB'
CREATE INDEX [IX_FK__tblProjec__Proje__56E8E7AB]
ON [dbo].[tblProjectPurposes]
    ([ProjectID]);
GO

-- Creating foreign key on [ProjectID] in table 'tblProjectStatusUpdates'
ALTER TABLE [dbo].[tblProjectStatusUpdates]
ADD CONSTRAINT [FK__tblProjec__Proje__5CA1C101]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[tblProjectInformations]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Proje__5CA1C101'
CREATE INDEX [IX_FK__tblProjec__Proje__5CA1C101]
ON [dbo].[tblProjectStatusUpdates]
    ([ProjectID]);
GO

-- Creating foreign key on [ResourceID] in table 'tblProjectResources'
ALTER TABLE [dbo].[tblProjectResources]
ADD CONSTRAINT [FK__tblProjec__Resou__47A6A41B]
    FOREIGN KEY ([ResourceID])
    REFERENCES [dbo].[tblResources]
        ([ResourceID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblProjec__Resou__47A6A41B'
CREATE INDEX [IX_FK__tblProjec__Resou__47A6A41B]
ON [dbo].[tblProjectResources]
    ([ResourceID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------