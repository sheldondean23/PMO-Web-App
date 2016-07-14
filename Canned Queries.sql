SELECT DISTINCT ProjectName 
		,(STUFF((SELECT CAST(', ' + CategoryName AS VARCHAR(MAX)) 
         FROM tblProjectCategories 
		 INNER JOIN tblCategories ON tblCategories.CategoryID = tblProjectCategories.CategoryID
         WHERE (tblProjectCategories.ProjectID = tblProjectInformation.ProjectID) 
         FOR XML PATH ('')), 1, 2, '')) AS Categories
,PrimaryLeadName,ScheduledStartDate,ScheduledEndDate,StatusName
		,(STUFF((SELECT CAST(', ' + FacitityName AS VARCHAR(MAX)) 
				 FROM tblProjectFacilities 
				 INNER JOIN tblFacilities ON tblFacilities.FacitityID = tblProjectFacilities.FacilityID
				 WHERE (tblProjectFacilities.ProjectID = tblProjectInformation.ProjectID) 
				 FOR XML PATH ('')), 1, 2, '')) AS Facilities
,ProjectActualBudget,ActualEndDate AS 'Go Live Date',ProjectRequestTypeName, ProjectRankingScore,ProjectSizeName
		,(STUFF((SELECT CAST(', ' + ResourceName AS VARCHAR(MAX)) 
				 FROM tblProjectResources 
				 INNER JOIN tblResources ON tblResources.ResourceID = tblProjectResources.ResourceID
				 WHERE (tblProjectResources.ProjectID = tblProjectInformation.ProjectID) 
				 FOR XML PATH ('')), 1, 2, '')) AS Resources
FROM tblProjectInformation
LEFT JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblProjectBudget ON tblProjectBudget.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblHSISPrimaryLead ON tblHSISPrimaryLead.PrimaryLeadID = tblProjectInformation.HSISPrimaryLeadID
LEFT JOIN tblProjectRequestType ON tblProjectRequestType.ProjectRequestTypeID = tblProjectInformation.ProjectRequestTypeID
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
LEFT JOIN tblProjectSize ON tblProjectSize.ProjectSizeID = tblProjectInformation.ProjectSizeID
WHERE StatusName <> 'Closed' AND StatusName <> 'Complete' AND StatusName <> 'Archived'
ORDER BY ProjectName



SELECT DISTINCT ProjectName
		,(STUFF((SELECT CAST(', ' + CategoryName AS VARCHAR(MAX)) 
				FROM tblProjectCategories 
				INNER JOIN tblCategories ON tblCategories.CategoryID = tblProjectCategories.CategoryID
				WHERE (tblProjectCategories.ProjectID = tblProjectInformation.ProjectID) 
				FOR XML PATH ('')), 1, 2, '')) AS Categories
, ScheduledStartdate, ScheduledEndDate, ActualStartDate, ActualEndDate 
FROM tblProjectInformation
LEFT JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
WHERE StatusName <> 'Closed' AND StatusName <> 'Complete' AND StatusName <> 'Archived'
ORDER BY ProjectName


--Use "HH" for Hours and "DD" for Days
SELECT ProjectName,RequestedDate,ContactedDate, DATEDIFF(HH,RequestedDate,ContactedDate) AS 'Response Time'
FROM tblProjectInformation
LEFT JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
WHERE StatusName <> 'Closed' AND StatusName <> 'Complete' AND StatusName <> 'Archived'
ORDER BY ProjectName


SELECT ProjectName, ProjectDesiredBudget
,ProjectActualBudget
FROM tblProjectInformation
LEFT JOIN tblProjectBudget ON tblProjectBudget.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
WHERE StatusName <> 'Closed' AND StatusName <> 'Complete' AND StatusName <> 'Archived'
ORDER BY ProjectName

SELECT ProjectName,RequestedDate
,ContactedDate
FROM tblProjectInformation
INNER JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
WHERE StatusName <> 'Closed' AND StatusName <> 'Complete' AND StatusName <> 'Archived'
ORDER BY ProjectName

SELECT DISTINCT PrimaryLeadName ,ProjectName 
		,(STUFF((SELECT CAST(', ' + CategoryName AS VARCHAR(MAX)) 
				FROM tblProjectCategories 
				INNER JOIN tblCategories ON tblCategories.CategoryID = tblProjectCategories.CategoryID
				WHERE (tblProjectCategories.ProjectID = tblProjectInformation.ProjectID) 
				FOR XML PATH ('')), 1, 2, '')) AS Categories
, ScheduledStartDate, ScheduledEndDate ,ProjectRequestTypeName, StatusName
		,(STUFF((SELECT CAST(', ' + FacitityName AS VARCHAR(MAX)) 
				FROM tblProjectFacilities 
				INNER JOIN tblFacilities ON tblFacilities.FacitityID = tblProjectFacilities.FacilityID
				WHERE (tblProjectFacilities.ProjectID = tblProjectInformation.ProjectID) 
				FOR XML PATH ('')), 1, 2, '')) AS Facilities
, ProjectRankingScore,ProjectSizeName,ActualEndDate
		,(STUFF((SELECT CAST(', ' + ResourceName AS VARCHAR(MAX)) 
				FROM tblProjectResources 
				INNER JOIN tblResources ON tblResources.ResourceID = tblProjectResources.ResourceID
				WHERE (tblProjectResources.ProjectID = tblProjectInformation.ProjectID) 
				FOR XML PATH ('')), 1, 2, '')) AS Resources
FROM tblProjectInformation
LEFT JOIN tblProjectDates ON tblProjectDates.ProjectID = tblProjectInformation.ProjectID
LEFT JOIN tblHSISPrimaryLead ON tblHSISPrimaryLead.PrimaryLeadID = tblProjectInformation.HSISPrimaryLeadID
LEFT JOIN tblProjectRequestType ON tblProjectRequestType.ProjectRequestTypeID = tblProjectInformation.ProjectRequestTypeID
LEFT JOIN tblProjectStatus ON tblProjectStatus.StatusID = tblProjectInformation.ProjectStatusID
LEFT JOIN tblProjectSize ON tblProjectSize.ProjectSizeID = tblProjectInformation.ProjectSizeID
WHERE StatusName <> 'Closed' AND StatusName <> 'Complete' AND StatusName <> 'Archived'
ORDER BY ProjectName

SELECT LTRIM(RTRIM(ProjectStatusUpdate)) AS 'Status Update',ProjectStatusUpdateDate
FROM tblProjectInformation
LEFT JOIN tblProjectStatusUpdates on tblProjectStatusUpdates.ProjectID = tblProjectInformation.ProjectID
WHERE tblProjectInformation.ProjectName = '%%'
ORDER BY ProjectStatusUpdateDate DESC