CREATE DATABASE SCOPED CREDENTIAL [SqlUs1ClinoneTestCredential] WITH IDENTITY = N'ClinTrialAdmin', SECRET = '';  
GO
CREATE EXTERNAL DATA SOURCE [DbCtaDataSource] WITH (TYPE = RDBMS, LOCATION = N'sql-us1-clinone-test.database.windows.net', CREDENTIAL = [SqlUs1ClinoneTestCredential], DATABASE_NAME = N'db-cta-test1')
GO
CREATE EXTERNAL DATA SOURCE [DbCtcDataSource] WITH (TYPE = RDBMS, LOCATION = N'sql-us1-clinone-test.database.windows.net', CREDENTIAL = [SqlUs1ClinoneTestCredential], DATABASE_NAME = N'db-ctc-test1')
GO


/****** Object:  Schema [cta]    Script Date: 10/19/2023 10:05:04 AM ******/
CREATE SCHEMA [cta]
GO
/****** Object:  Schema [ctc]    Script Date: 10/19/2023 10:05:04 AM ******/
CREATE SCHEMA [ctc]
GO
/****** Object:  Schema [dev]    Script Date: 10/19/2023 10:05:04 AM ******/
CREATE SCHEMA [dev]
GO
/****** Object:  Schema [scratch]    Script Date: 10/19/2023 10:05:04 AM ******/
CREATE SCHEMA [scratch]
GO
/****** Object:  Schema [TEST]    Script Date: 10/19/2023 10:05:04 AM ******/
CREATE SCHEMA [TEST]
GO

/****** Object:  Table [cta].[tblReferringSpecialist]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblReferringSpecialist]
(
	[ReferringSpecialistID] [int] NOT NULL,
	[FirstName] [nvarchar](32) NOT NULL,
	[LastName] [nvarchar](32) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PhoneCell] [nvarchar](24) NULL,
	[PhoneWork] [nvarchar](24) NULL,
	[PhoneHome] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[NpiID] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferringSpecialistGuid] [uniqueidentifier] NOT NULL,
	[HasAttemptedNpiLookupUsingApi] [bit] NOT NULL,
	[IsReferringSpecialistEmailConfirm] [bit] NOT NULL,
	[MiddleName] [nvarchar](32) NULL,
	[ProviderSource] [nvarchar](256) NULL,
	[PacID] [nvarchar](256) NULL,
	[Suffix] [nvarchar](256) NULL,
	[Gender] [nvarchar](256) NULL,
	[Credential] [nvarchar](256) NULL,
	[MedicalSchoolName] [nvarchar](256) NULL,
	[GraduationYear] [nvarchar](256) NULL,
	[Age] [int] NULL,
	[PrimaryTaxonomy] [nvarchar](256) NULL,
	[MedicalProcedures] [decimal](18, 0) NULL,
	[IsKeyOpinionLeader] [bit] NULL,
	[KeyOpinionLeaderPrimaryIndication] [nvarchar](1024) NULL,
	[KeyOpinionLeaderSecondaryIndication] [nvarchar](1024) NULL,
	[HasParticipatedInClinicalTrials] [bit] NULL,
	[RoleName] [nvarchar](128) NULL,
	[ClinicalActivityPercentile] [float] NULL,
	[ClinicalActivityLevel] [nvarchar](16) NULL,
	[TelehealthScore] [nvarchar](1) NULL,
	[TelehealthAdoption] [nvarchar](16) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblReferringSpecialist')
GO
/****** Object:  Table [cta].[tblReferringSpecialistTag]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblReferringSpecialistTag]
(
	[ReferringSpecialistTagID] [int] NOT NULL,
	[ReferringSpecialistID] [int] NOT NULL,
	[SpecialistTagID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblReferringSpecialistTag')
GO
/****** Object:  Table [cta].[tblSpecialistTag]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblSpecialistTag]
(
	[SpecialistTagID] [int] NOT NULL,
	[Tag] [nvarchar](128) NOT NULL,
	[IsSpecialty] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblSpecialistTag')
GO
/****** Object:  Table [cta].[tblReferringSpecialistAddress]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblReferringSpecialistAddress]
(
	[ReferringSpecialistAddressID] [int] NOT NULL,
	[ReferringSpecialistID] [int] NOT NULL,
	[Facility] [nvarchar](512) NULL,
	[AddressLine1] [varchar](512) NULL,
	[AddressLine2] [varchar](512) NULL,
	[City] [varchar](256) NULL,
	[GoverningDistrict] [varchar](512) NULL,
	[Zip] [varchar](32) NULL,
	[CountryID] [int] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsPartiallyGeocoded] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](16) NULL,
	[IsPhoneNumberDoNotCall] [bit] NULL,
	[FaxNumber] [nvarchar](16) NULL,
	[DefHcLocationID] [int] NULL,
	[DefHcLocationAddressID] [int] NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblReferringSpecialistAddress')
GO
/****** Object:  View [scratch].[vw_SpecialistReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [scratch].[vw_SpecialistReporting] as
SELECT 
DISTINCT	 
	 LOWER(S.Email)			AS Email
	,SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) AS [Domain]
	,S.FirstName				AS FirstName
	,S.LastName				AS LastName
	,ST.Tag					AS Specialty
	,S.ReferringSpecialistID
	,A.CountryID 
		  
FROM [cta].[tblReferringSpecialist] S 
LEFT JOIN [cta].[tblReferringSpecialistTag] T ON (T.ReferringSpecialistID=S.ReferringSpecialistID AND T.IsDeleted=0)
JOIN [cta].[tblSpecialistTag] ST ON (ST.SpecialistTagID=T.SpecialistTagID)
JOIN [cta].tblReferringSpecialistAddress A on A.ReferringSpecialistID = S.ReferringSpecialistID
WHERE 0=0
--Exclude demo & Non production specialists
	AND SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) NOT LIKE '%ClinOne%' --Exlcude ClinOne Emails
	AND S.FirstName NOT LIKE '%ClinOne%' --Exclude ClinOne names
	AND ST.IsSpecialty=1 --Include Specialites Only
	AND ST.IsDeleted = 0 --Exclude Deleted Specialties
	AND ST.Tag NOT LIKE '%demo%' --Exclude demo Tags
	AND ST.Tag NOT LIKE '%Clinone%' --exclude ClinOne tags
	AND A.IsPrimary = 1 --Primary Addresses Only
	AND A.IsDeleted = 0 --Exclude Deleted Addresses
	
GO
/****** Object:  Table [cta].[tblReferStudyStudyUrl]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblReferStudyStudyUrl]
(
	[ReferStudyStudyUrlID] [int] NOT NULL,
	[UserSessionID] [int] NOT NULL,
	[StudyID] [int] NULL,
	[SiteStudyID] [int] NULL,
	[ReferralPath] [varchar](2083) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[ReferringSpecialistID] [int] NULL,
	[CampaignDate] [datetime] NULL,
	[Source] [nvarchar](256) NULL,
	[IsDeleted] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'tblReferStudyStudyUrl')
GO
/****** Object:  Table [cta].[tblReferStudyReferralSubmit ]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblReferStudyReferralSubmit ]
(
	[ReferStudyReferralSubmitID] [int] NOT NULL,
	[UserSessionID] [int] NOT NULL,
	[StudyID] [int] NULL,
	[SiteStudyID] [int] NULL,
	[ReferringSpecialistID] [int] NULL,
	[ReferredToEmail] [nvarchar](256) NULL,
	[ReferralPath] [varchar](4096) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CampaignDate] [date] NULL,
	[CampaignSource] [varchar](150) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'tblReferStudyReferralSubmit ')
GO
/****** Object:  Table [cta].[tbldocumentversion]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tbldocumentversion]
(
	[DocumentVersionID] [int] NOT NULL,
	[DocumentID] [int] NOT NULL,
	[VersionName] [nvarchar](32) NOT NULL,
	[FileExtensionID] [int] NOT NULL,
	[LanguageID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[FileStoreGuid] [nvarchar](128) NOT NULL,
	[DocumentVersionGuid] [uniqueidentifier] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tbldocumentversion ')
GO
/****** Object:  Table [cta].[tbldocument]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tbldocument]
(
	[DocumentID] [int] NOT NULL,
	[DocumentTypeID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[UseForAllSites] [bit] NOT NULL,
	[InternalDescription] [nvarchar](256) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tbldocument')
GO
/****** Object:  Table [cta].[tblWistiaVideo]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblWistiaVideo]
(
	[WistiaVideoID] [int] NOT NULL,
	[StudyWistiaProjectID] [int] NOT NULL,
	[VideoID] [nvarchar](128) NOT NULL,
	[VideoName] [nvarchar](256) NOT NULL,
	[VideoDuration] [float] NULL,
	[VideoThumbnailUrl] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UseForAllSites] [bit] NOT NULL,
	[VideoTypeID] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[VideoDescription] [nvarchar](512) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblWistiaVideo')
GO
/****** Object:  Table [dbo].[LandingPageEvents]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandingPageEvents](
	[EventID] [int] NULL,
	[EventType] [varchar](100) NULL,
	[CreatedDateUTC] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ISDeleted] [bit] NULL,
	[StudyID] [int] NULL,
	[ReferringSpecialistID] [int] NULL,
	[DocumentVersionID] [int] NULL,
	[UserSessionID] [int] NULL,
	[ViewedPercentage] [decimal](18, 2) NULL,
	[StudyWistiaProjectID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cta].[tblStudy]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblStudy]
(
	[StudyID] [int] NOT NULL,
	[StudyClientTypeID] [int] NOT NULL,
	[SponsorName] [nvarchar](256) NULL,
	[ProtocolNumber] [nvarchar](128) NOT NULL,
	[IsDemo] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[StudyNickname] [nvarchar](128) NULL,
	[StudyGuid] [uniqueidentifier] NOT NULL,
	[StudyStatusID] [int] NOT NULL,
	[IsConnectEnabled] [bit] NOT NULL,
	[ConnectStatusID] [int] NULL,
	[CustomConfiguration] [varchar](max) NULL,
	[IsSoeEnabled] [bit] NOT NULL,
	[StudyAdminStatusID] [int] NOT NULL,
	[IsWebsiteDownloadDocumentEnabled] [bit] NOT NULL,
	[IsStudyManagerForumPostOnlyEnabled] [bit] NOT NULL,
	[IsAutoEmailRegisterEnabled] [bit] NOT NULL,
	[IsAutoEmailUtilizeEnabled] [bit] NOT NULL,
	[IsAutoEmailStudyPerformanceEnabled] [bit] NOT NULL,
	[IsAutoEmailStudyDocumentVersionEnabled] [bit] NOT NULL,
	[IsAutoEmailStudyContentEnabled] [bit] NOT NULL,
	[IsAeEnabled] [bit] NOT NULL,
	[IsMDReferralEnabled] [bit] NOT NULL,
	[ReferringSpecialistCount] [int] NOT NULL,
	[IsPatientConciergeEnabled] [bit] NOT NULL,
	[IsLmsEnabled] [bit] NOT NULL,
	[CanStudyManagersAccessMetrics] [bit] NOT NULL,
	[OrganizationID] [int] NULL,
	[ModifiedReason] [nvarchar](512) NULL,
	[IsConsentEnabled] [bit] NOT NULL,
	[IsEproEnabled] [bit] NOT NULL,
	[IsDosingEnabled] [bit] NOT NULL,
	[IsPatientRideEnabled] [bit] NOT NULL,
	[IsSoePreScreeningEnabled] [bit] NOT NULL,
	[IsVideoChatEnabled] [bit] NOT NULL,
	[IsPatientConciergeDocumentsEnabled] [bit] NOT NULL,
	[IsPatientVoiceEnabled] [bit] NOT NULL,
	[IsPatientStatusManagementReadOnly] [bit] NOT NULL,
	[IsAutoEmailAdditionalStudiesEnabled] [bit] NOT NULL,
	[IsCommunityEnabled] [bit] NOT NULL,
	[IsCriteriaEnabled] [bit] NOT NULL,
	[IsResourcesEnabled] [bit] NOT NULL,
	[IsStudyPersonnelEnabled] [bit] NOT NULL,
	[IsVendorsEnabled] [bit] NOT NULL,
	[IsEducatePatientsEnabled] [bit] NOT NULL,
	[IsVirtualVisitEnabled] [bit] NOT NULL,
	[IsSecureMessagingEnabled] [bit] NOT NULL,
	[IsAskAQuestionEnabled] [bit] NOT NULL,
	[IsDosingCalendarEnabled] [bit] NOT NULL,
	[IsPatientRidePatientScheduleEnabled] [bit] NOT NULL,
	[IsShareWithFamilyEnabled] [bit] NOT NULL,
	[IsVisitScheduleNotificationEnabled] [bit] NOT NULL,
	[IsAccessCodeEnabled] [bit] NOT NULL,
	[IsAutoRefillBisEnabled] [bit] NOT NULL,
	[IsConnectedDevicesEnabled] [bit] NOT NULL,
	[MDReferralVersionID] [int] NOT NULL,
	[IsMDReferralEnabledFinal] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblStudy')
GO
/****** Object:  View [scratch].[vw_StudyReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [scratch].[vw_StudyReporting] as 
--Used for Study Reporting for DS-43

SELECT
 S.StudyID
,S.SponsorName
,S.ProtocolNumber
,CAST(S.CreatedDate as DATE) as CreatedDate
,S.IsDeleted
,S.StudyNickname
,S.OrganizationID
,S.MDReferralVersionID
,S.IsMDReferralEnabledFinal
,S.StudyClientTypeID
FROM cta.tblstudy S
WHERE 0=0
--Exclude Demos
AND S.IsDemo = 0
--Exclude ClinOne Sponsor names
AND S.SponsorName NOT LIKE '%ClinOne%'
--Premium Studies Only
AND S.StudyClientTypeID = 1
--Exclude Test Sponsors
AND S.sponsorname NOT LIKE '%test%'
--Exlcude ClinOne Organization ID but allow null Organization IDs since it's an optional field
AND (S.OrganizationID NOT IN( 38) OR S.OrganizationID IS NULL)


GO
/****** Object:  View [scratch].[vw_LandingPageActivityReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [scratch].[vw_LandingPageActivityReporting] as 
--Reporting View for TA Engagement Report

WITH Docs as (
--Details for documents downloaded from the study landing page
SELECT
 V.DocumentVersionID
,V.DocumentID
,D.Name
FROM cta.tbldocumentversion V
JOIN cta.tblDocument D on D.DocumentID = V.DocumentID
WHERE 0=0

)

--CTE To combine the different tables in a reportable format
--Document Downloads, Videos, Optional Link Views, Referral Submits
,Activity as (
--Document Downloads
SELECT
 L.EventID as ID
,'Download Document' as Type
,L.CreatedDateUTC
,L.StudyID
,L.ReferringSpecialistID
,L.UserSessionID
,D.Name as Detail
FROM [dbo].[LandingPageEvents] L
JOIN Docs D on D.DocumentVersionID = L.DocumentVersionID
JOIN scratch.vw_SpecialistReporting s on S.ReferringSpecialistID = L.ReferringSpecialistID
JOIN scratch.vw_StudyReporting ST on St.StudyID = L.StudyID
WHERE 0=0
AND L.IsDeleted = 0

UNION
--Video Views
SELECT
 L.EventID as ID
,'View Video' as Type
,L.CreatedDateUTC
,L.StudyID
,L.ReferringSpecialistID
,L.UserSessionID
,W.VideoName as Detail
FROM [dbo].[LandingPageEvents] L
JOIN cta.tblWistiaVideo W on W.StudyWistiaProjectID = L.StudyWistiaProjectID
JOIN scratch.vw_SpecialistReporting s on S.ReferringSpecialistID = L.ReferringSpecialistID
JOIN scratch.vw_StudyReporting ST on St.StudyID = L.StudyID
WHERE 0=0
AND L.IsDeleted = 0

UNION
--Optional Link Views
SELECT
 R.ReferStudyStudyUrlID as ID
,'Optional Link View' as Type
,R.CreatedDateUtc
,R.StudyID
,R.ReferringSpecialistID
,R.UserSessionID
,R.ReferralPath as Detail
FROM cta.tblReferStudyStudyUrl R
JOIN scratch.vw_SpecialistReporting s on S.ReferringSpecialistID = R.ReferringSpecialistID
JOIN scratch.vw_StudyReporting ST on St.StudyID = R.StudyID
WHERE 0=0
AND r.IsDeleted = 0

UNION 
--Referral Submits
SELECT
 R.ReferStudyReferralSubmitID as ID
,'Referral Submit' as Type
,R.CreatedDateUtc
,R.StudyID
,R.ReferringSpecialistID
,R.UserSessionID
,'N/A' as Detail

FROM cta.[tblReferStudyReferralSubmit ] R
JOIN scratch.vw_SpecialistReporting s on S.ReferringSpecialistID = R.ReferringSpecialistID
JOIN scratch.vw_StudyReporting ST on St.StudyID = R.StudyID
WHERE 0=0
AND r.IsDeleted = 0
)

--Final Query to join referringspecialistaddress to be able to filter activities by country
SELECT
 A.ID
,A.Type
,A.CreatedDateUTC
,A.StudyID
,A.ReferringSpecialistID
,A.UserSessionID
,A.Detail
,S.CountryID
FROM Activity A
--Join Primary specialist address that is not deleted
JOIN cta.tblReferringSpecialistAddress S on S.ReferringSpecialistID = A.ReferringSpecialistID
WHERE 0=0
AND S.IsPrimary = 1
AND S.IsDeleted = 0
GO
/****** Object:  Table [cta].[tblReferStudyView]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblReferStudyView]
(
	[ReferStudyViewID] [int] NOT NULL,
	[UserSessionID] [int] NOT NULL,
	[StudyID] [int] NULL,
	[SiteStudyID] [int] NULL,
	[ReferringSpecialistID] [int] NULL,
	[ReferralPath] [varchar](4096) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CampaignDate] [date] NULL,
	[Source] [varchar](150) NULL,
	[SpecialistTagId] [int] NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'tblReferStudyView')
GO
/****** Object:  Table [scratch].[SentEmailsPerStudyPerEmail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scratch].[SentEmailsPerStudyPerEmail](
	[Email] [varchar](100) NOT NULL,
	[StudyID] [int] NOT NULL,
	[SentEmails] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [scratch].[EmailReportingTA]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scratch].[EmailReportingTA](
	[SentEmailID] [int] NULL,
	[Email] [varchar](100) NULL,
	[SentEmailTypeID] [int] NULL,
	[WasSuccessful] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[OpenedCount] [int] NULL,
	[ClickedCount] [int] NULL,
	[IsBounced] [bit] NULL,
	[IsMarkedSpam] [bit] NULL,
	[IsUnsubscribed] [bit] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [cta].[TblUserSession]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[TblUserSession]
(
	[UserSessionID] [int] NOT NULL,
	[AppTypeID] [int] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[Language] [nvarchar](128) NULL,
	[IPAddress] [varchar](128) NULL,
	[Browser] [varchar](1024) NULL,
	[AppVersion] [varchar](16) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Duration] [time](3) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'TblUserSession ')
GO
/****** Object:  Table [scratch].[tblSentEmailClickDetail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scratch].[tblSentEmailClickDetail](
	[SentEmailClickDetailID] [int] NOT NULL,
	[SentEmailID] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Url] [varchar](5000) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [scratch].[vw_BotActivityLogic]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [scratch].[vw_BotActivityLogic] as 
WITH ClickDetailDistinct as (
SELECT
DISTINCT
 A.SentEmailID
,A.Url
--Categorizing Clicks based on Bill's supplied URLs
--NonStudyClicks
,CASE WHEN
	A.Url IN (
 'https://clinone.com'
,'https://www.clinone.com' 
,'https://clinone.com/privacy' 
,'https://www.linkedin.com/company/clinone' 
) OR A.Url LIKE '%Unsubscribe%' THEN 1
ELSE 0
	END AS 'NonStudyURLsClicked'
--Study Clicks (not used, just for discovery purposes)
,CASE WHEN A.Url LIKE '%Study%' THEN 1 ELSE 0 END AS 'StudyURLsCLicked'

FROM scratch.tblSentEmailClickDetail A
--Try to only look at nonstudy links clicked the same day as the email was sent
JOIN scratch.EmailReportingTA B ON B.SentEmailID=A.SentEmailID AND CAST(A.CreatedDateUtc as date) = CAST(B.CreatedDate as date)
WHERE 0=0
AND A.Isdeleted = 0
--Limiting to last 400 days since TA Engagment is for the past year currently
AND CAST(B.CreatedDate as date) >= DATEADD( DAY , -400, GETDATE() )
--Test case
--AND A.SentEmailID = 6590631
)

,EmailClickTimings as (
--Only look at nonstudyurl clicks
--get click timings for first and last nonstudy url click for each email that occurred on the same day as the email was sent
SELECT
 A.SentEmailID
,B.Email
,B.CreatedDate
,MIN(A.CreatedDateUTC) as FirstClick
,MAX(A.CreatedDateUTC) as LastClick
,DATEDIFF(SECOND, MIN(B.CreatedDate),MIN(A.CreatedDateUTC) ) as DurationBetweenEmailSentandFirstClickSeconds
,DATEDIFF(SECOND, MIN(A.CreatedDateUTC),MAX(A.CreatedDateUTC) ) as DurationBetweenFirstClickLastClickSeconds

FROM scratch.tblSentEmailClickDetail A
JOIN scratch.EmailReportingTA B ON B.SentEmailID = A.SentEmailID AND CAST(A.CreatedDateUtc as date) = CAST(B.CreatedDate as date)
WHERE 0=0
AND A.Isdeleted = 0
--Limiting to last 400 days since TA Engagment is for the past year currently
AND CAST(B.CreatedDate as date) >= DATEADD( DAY , -400, GETDATE() )
--Test case
--AND B.SentEmailID = 6590631
AND (A.Url IN (
 'https://clinone.com'
,'https://www.clinone.com' 
,'https://clinone.com/privacy' 
,'https://www.linkedin.com/company/clinone' 
) OR A.Url LIKE '%Unsubscribe%' )

GROUP BY A.SentEmailID,B.Email,B.CreatedDate

)

,AggregateClicks as (
--Aggregate links per click category
SELECT
  D.SentEmailID
,SUM( D.NonStudyURLsClicked ) as NonStudyURLsClicked
-- >=5 not study links means potential bot activity
-- call this possible bot
--if it is in the same session then it is likely bot
,CASE WHEN SUM(D.NonStudyURLsClicked ) >= 5 THEN 1 ELSE 0 END AS PossibleBot
,SUM( D.StudyURLsClicked ) as StudyURLsClicked

FROM ClickDetailDistinct D 
WHERE 0=0
GROUP BY D.SentEmailID
)

----This CTE for identifying if a specialist has every been emailed for a study, if they haven't then it is likely bot activity
--,SentEmailsPerStudyPerEmail as (
-- SELECT
--    E.Email
--  ,T.StudyID
--  ,COUNT(E.SentEmailID) as SentEmails
--  FROM scratch.EmailReportingTA E 
--  JOIN scratch.EmailStudyBridge T on T.SentEmailID = E.SentEmailID 
--  WHERE 0=0
--  GROUP BY 
--   E.Email
--  ,T.StudyID
--)


SELECT
 A.SentEmailID
,T.CreatedDate as EmailSentDateTime
,T.Email
,A.NonStudyURLsClicked
,A.StudyURLsClicked
,A.PossibleBot -- See notes above
,T.FirstClick
,T.LastClick 
,T.DurationBetweenEmailSentandFirstClickSeconds
,T.DurationBetweenFirstClickLastClickSeconds
,V.ReferStudyViewID
,V.CreatedDateUtc as 'Study View Created'
,V.StudyID
,V.UserSessionID
,U.CreatedDateUtc as SessionDateTime
,E.SentEmails
--If a session or view happened between the first and last nonstudy url click of possible bot activity on email then it is likely a bot view
--adding logic for if a specialist was never sent an email for a study then it is likely a bot (sentemails is null)
,CASE WHEN A.PossibleBot = 1 AND V.CreatedDateUtc BETWEEN T.FirstClick and T.LastClick THEN 1 WHEN E.SentEmails IS NULL THEN 1 ELSE 0 END AS 'LikelyBot'
FROM AggregateClicks A 
JOIN EmailClickTimings T on T.SentEmailID = A.SentEmailID
--Join to study views that ocurred on the same day as a sent email to the same referring specialist
JOIN cta.tblReferringSpecialist S on S.Email = T.Email
JOIN cta.tblReferStudyView V on V.ReferringSpecialistID = S.ReferringSpecialistID AND CAST(V.CreatedDateUtc as date) = CAST(T.FirstClick as DATE) 
JOIN cta.TblUserSession U on U.UserSessionID = V.UserSessionID
--Count if a specialist has received an email for the study they viewed
LEFT JOIN scratch.SentEmailsPerStudyPerEmail E on E.Email = T.Email AND E.StudyID = V.StudyID
WHERE 0=0

GO
/****** Object:  Table [TEST].[EmailReportingTA]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[EmailReportingTA](
	[SentEmailID] [int] NULL,
	[Email] [varchar](100) NULL,
	[SentEmailTypeID] [int] NULL,
	[WasSuccessful] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[OpenedCount] [int] NULL,
	[ClickedCount] [int] NULL,
	[IsBounced] [bit] NULL,
	[IsMarkedSpam] [bit] NULL,
	[IsUnsubscribed] [bit] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TEST].[SentEmailsPerStudyPerEmail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[SentEmailsPerStudyPerEmail](
	[Email] [varchar](100) NOT NULL,
	[StudyID] [int] NOT NULL,
	[SentEmails] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TEST].[tblSentEmailClickDetail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[tblSentEmailClickDetail](
	[SentEmailClickDetailID] [int] NOT NULL,
	[SentEmailID] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Url] [varchar](5000) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [TEST].[vw_BotActivityLogic]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [TEST].[vw_BotActivityLogic] as 
WITH ClickDetailDistinct as (
SELECT
DISTINCT
 A.SentEmailID
,A.Url
--Categorizing Clicks based on Bill's supplied URLs
--NonStudyClicks
,CASE WHEN
	A.Url IN (
 'https://clinone.com'
,'https://www.clinone.com' 
,'https://clinone.com/privacy' 
,'https://www.linkedin.com/company/clinone' 
) OR A.Url LIKE '%Unsubscribe%' THEN 1
ELSE 0
	END AS 'NonStudyURLsClicked'
--Study Clicks (not used, just for discovery purposes)
,CASE WHEN A.Url LIKE '%Study%' THEN 1 ELSE 0 END AS 'StudyURLsCLicked'

FROM test.tblSentEmailClickDetail A
--Try to only look at nonstudy links clicked the same day as the email was sent
JOIN test.EmailReportingTA B ON B.SentEmailID=A.SentEmailID AND CAST(A.CreatedDateUtc as date) = CAST(B.CreatedDate as date)
WHERE 0=0
AND A.Isdeleted = 0
--Limiting to last 400 days since TA Engagment is for the past year currently
AND CAST(B.CreatedDate as date) >= DATEADD( DAY , -400, GETDATE() )
--Test case
--AND A.SentEmailID = 6590631
)

,EmailClickTimings as (
--Only look at nonstudyurl clicks
--get click timings for first and last nonstudy url click for each email that occurred on the same day as the email was sent
SELECT
 A.SentEmailID
,B.Email
,B.CreatedDate
,MIN(A.CreatedDateUTC) as FirstClick
,MAX(A.CreatedDateUTC) as LastClick
,DATEDIFF(SECOND, MIN(B.CreatedDate),MIN(A.CreatedDateUTC) ) as DurationBetweenEmailSentandFirstClickSeconds
,DATEDIFF(SECOND, MIN(A.CreatedDateUTC),MAX(A.CreatedDateUTC) ) as DurationBetweenFirstClickLastClickSeconds

FROM test.tblSentEmailClickDetail A
JOIN test.EmailReportingTA B ON B.SentEmailID = A.SentEmailID AND CAST(A.CreatedDateUtc as date) = CAST(B.CreatedDate as date)
WHERE 0=0
AND A.Isdeleted = 0
--Limiting to last 400 days since TA Engagment is for the past year currently
AND CAST(B.CreatedDate as date) >= DATEADD( DAY , -400, GETDATE() )
--Test case
--AND B.SentEmailID = 6590631
AND (A.Url IN (
 'https://clinone.com'
,'https://www.clinone.com' 
,'https://clinone.com/privacy' 
,'https://www.linkedin.com/company/clinone' 
) OR A.Url LIKE '%Unsubscribe%' )

GROUP BY A.SentEmailID,B.Email,B.CreatedDate

)

,AggregateClicks as (
--Aggregate links per click category
SELECT
  D.SentEmailID
,SUM( D.NonStudyURLsClicked ) as NonStudyURLsClicked
-- >=5 not study links means potential bot activity
-- call this possible bot
--if it is in the same session then it is likely bot
,CASE WHEN SUM(D.NonStudyURLsClicked ) >= 5 THEN 1 ELSE 0 END AS PossibleBot
,SUM( D.StudyURLsClicked ) as StudyURLsClicked

FROM ClickDetailDistinct D 
WHERE 0=0
GROUP BY D.SentEmailID
)

----This CTE for identifying if a specialist has every been emailed for a study, if they haven't then it is likely bot activity
--,SentEmailsPerStudyPerEmail as (
-- SELECT
--    E.Email
--  ,T.StudyID
--  ,COUNT(E.SentEmailID) as SentEmails
--  FROM scratch.EmailReportingTA E 
--  JOIN scratch.EmailStudyBridge T on T.SentEmailID = E.SentEmailID 
--  WHERE 0=0
--  GROUP BY 
--   E.Email
--  ,T.StudyID
--)


SELECT
 A.SentEmailID
,T.CreatedDate as EmailSentDateTime
,T.Email
,A.NonStudyURLsClicked
,A.StudyURLsClicked
,A.PossibleBot -- See notes above
,T.FirstClick
,T.LastClick 
,T.DurationBetweenEmailSentandFirstClickSeconds
,T.DurationBetweenFirstClickLastClickSeconds
,V.ReferStudyViewID
,V.CreatedDateUtc as 'Study View Created'
,V.StudyID
,V.UserSessionID
,U.CreatedDateUtc as SessionDateTime
,E.SentEmails
--If a session or view happened between the first and last nonstudy url click of possible bot activity on email then it is likely a bot view
--adding logic for if a specialist was never sent an email for a study then it is likely a bot (sentemails is null)
,CASE WHEN A.PossibleBot = 1 AND V.CreatedDateUtc BETWEEN T.FirstClick and T.LastClick THEN 1 WHEN E.SentEmails IS NULL THEN 1 ELSE 0 END AS 'LikelyBot'
FROM AggregateClicks A 
JOIN EmailClickTimings T on T.SentEmailID = A.SentEmailID
--Join to study views that ocurred on the same day as a sent email to the same referring specialist
JOIN cta.tblReferringSpecialist S on S.Email = T.Email
JOIN cta.tblReferStudyView V on V.ReferringSpecialistID = S.ReferringSpecialistID AND CAST(V.CreatedDateUtc as date) = CAST(T.FirstClick as DATE) 
JOIN cta.TblUserSession U on U.UserSessionID = V.UserSessionID
--Count if a specialist has received an email for the study they viewed
LEFT JOIN test.SentEmailsPerStudyPerEmail E on E.Email = T.Email AND E.StudyID = V.StudyID
WHERE 0=0

GO
/****** Object:  View [TEST].[vw_StudyReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TEST].[vw_StudyReporting] as 
--Used for Study Reporting for DS-43

SELECT
 S.StudyID
,S.SponsorName
,S.ProtocolNumber
,CAST(S.CreatedDate as DATE) as CreatedDate
,S.IsDeleted
,S.StudyNickname
,S.OrganizationID
,S.MDReferralVersionID
,S.IsMDReferralEnabledFinal
,S.StudyClientTypeID
FROM cta.tblstudy S
WHERE 0=0
--Exclude Demos
AND S.IsDemo = 0
--Exclude ClinOne Sponsor names
AND S.SponsorName NOT LIKE '%ClinOne%'
--Premium Studies Only
AND S.StudyClientTypeID = 1
--Exclude Test Sponsors
AND S.sponsorname NOT LIKE '%test%'
--Exlcude ClinOne Organization ID but allow null Organization IDs since it's an optional field
AND (S.OrganizationID NOT IN( 38) OR S.OrganizationID IS NULL)


GO
/****** Object:  View [scratch].[vw_EmailsReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [scratch].[vw_EmailsReporting] as 
SELECT [SentEmailID]
      ,[Email]
      ,CAST([CreatedDate] as DATE) as [CreatedDate]
      ,[OpenedCount]
      ,[ClickedCount]
      
FROM [scratch].[EmailReportingTA]
WHERE 0=0
GO
/****** Object:  Table [cta].[tblSentEmail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblSentEmail]
(
	[SentEmailID] [int] NOT NULL,
	[SentEmailTypeID] [int] NOT NULL,
	[ToEmailAddress] [nvarchar](256) NOT NULL,
	[FromEmailAddress] [nvarchar](256) NOT NULL,
	[WasSuccessful] [bit] NOT NULL,
	[ToCTAUserID] [int] NULL,
	[EmailItemID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[SendGridMessageID] [nvarchar](250) NULL,
	[OpenedCount] [int] NULL,
	[ClickedCount] [int] NULL,
	[IsBounced] [bit] NULL,
	[IsMarkedSpam] [bit] NULL,
	[IsUnsubscribed] [bit] NULL,
	[ForumPostID] [int] NULL,
	[InitialOpenedDateUtc] [date] NULL,
	[MetaData] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[UniqueIpAddressCount] [int] NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblSentEmail ')
GO
/****** Object:  View [TEST].[vw_EmailBridgeTable]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Created at: 2022-06-08 13:57:19.990
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: Bridge Table For Email Study RelationShips
--Have to parse study and sitestudy ids from json column

CREATE VIEW [TEST].[vw_EmailBridgeTable] as 
--limit to required columns for extracting Json
WITH Emails as (
SELECT 
	   E.[SentEmailID]
      ,E.[MetaData]
FROM [cta].[tblSentEmail] E
WHERE 0=0
--Research newsletter & CustomResearchNewsletters email types
  AND SentEmailTypeID IN (23,47)
--metadata needs to be not null for cross apply below to work
  AND MetaData IS NOT NULL
  
  )

--OpenJson function to extract to column and rows for each study/sitestudy
SELECT
 [SentEmailID]
,List.StudyID
,List.SiteStudyID
FROM Emails T
CROSS APPLY OPENJSON( [Metadata],'$.ReferralStudyIDs' )
WITH (
		StudyID int '$.StudyID',
		SiteStudyId int '$.SiteStudyID'
) as List
--limit to required studies for TA Engagment reporting
JOIN [test].[vw_StudyReporting] STU ON STU.StudyID=List.StudyID
WHERE 0=0
--extra check to ensure there is json in the metadata column
AND ISJSON(Metadata) > 0

GO
/****** Object:  View [TEST].[vw_EmailsReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [TEST].[vw_EmailsReporting] as 
SELECT [SentEmailID]
      ,[Email]
      ,CAST([CreatedDate] as DATE) as [CreatedDate]
      ,[OpenedCount]
      ,[ClickedCount]
      
FROM [test].[EmailReportingTA]
WHERE 0=0
GO
/****** Object:  Table [cta].[lk_EventType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[lk_EventType]
(
	[EventTypeID] [int] NOT NULL,
	[EventType] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_EventType ')
GO
/****** Object:  Table [cta].[tblEvent]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblEvent]
(
	[EventID] [int] NOT NULL,
	[EventTypeID] [int] NULL,
	[EventData] [nvarchar](max) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'tblEvent ')
GO
/****** Object:  View [TEST].[vw_LandingPageActivities]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Created at: 2022-08-09 19:38:32.631
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: Add in Details about landing page assets
--Stored in view for potential maintenance
--Scratch.EtlLandingPageEvents stored proc inserts this data to table

CREATE VIEW [TEST].[vw_LandingPageActivities] as
--Only include columns with event detail
--Parses Json Column
SELECT
 E.EventID
,T.EventType
,E.CreatedDateUTC
,E.CreatedBy
,E.IsDeleted
,List.StudyID
,List.ReferringSpecialistID
,List.DocumentVersionID
,List.UserSessionID
,List.ViewedPercentage
,List.StudyWistiaProjectID
FROM cta.tblevent E
JOIN cta.lk_EventType T on T.EventTypeID = E.EventTypeID
--Json function to parse data
CROSS APPLY OPENJSON( E.EventData )
WITH (
		StudyID int '$.StudyID',
		ReferringSpecialistID int '$.ReferringSpecialistID',
		DocumentVersionID int '$.DocumentVersionID',
		UserSessionID int '$.UserSessionID',
		ViewedPercentage decimal(18,2) '$.ViewedPercentage',
		StudyWistiaProjectID int '$.StudyWistiaProjectID'
) as List




GO
/****** Object:  View [TEST].[vw_SpecialistReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [TEST].[vw_SpecialistReporting] as
SELECT 
DISTINCT	 
	 LOWER(S.Email)			AS Email
	,SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) AS [Domain]
	,S.FirstName				AS FirstName
	,S.LastName				AS LastName
	,ST.Tag					AS Specialty
	,S.ReferringSpecialistID
	,A.CountryID 
		  
FROM [cta].[tblReferringSpecialist] S 
LEFT JOIN [cta].[tblReferringSpecialistTag] T ON (T.ReferringSpecialistID=S.ReferringSpecialistID AND T.IsDeleted=0)
JOIN [cta].[tblSpecialistTag] ST ON (ST.SpecialistTagID=T.SpecialistTagID)
JOIN [cta].tblReferringSpecialistAddress A on A.ReferringSpecialistID = S.ReferringSpecialistID
WHERE 0=0
--Exclude demo & Non production specialists
	AND SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) NOT LIKE '%ClinOne%' --Exlcude ClinOne Emails
	AND S.FirstName NOT LIKE '%ClinOne%' --Exclude ClinOne names
	AND ST.IsSpecialty=1 --Include Specialites Only
	AND ST.IsDeleted = 0 --Exclude Deleted Specialties
	AND ST.Tag NOT LIKE '%demo%' --Exclude demo Tags
	AND ST.Tag NOT LIKE '%Clinone%' --exclude ClinOne tags
	AND A.IsPrimary = 1 --Primary Addresses Only
	AND A.IsDeleted = 0 --Exclude Deleted Addresses
	
GO
/****** Object:  Table [TEST].[LandingPageEvents]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[LandingPageEvents](
	[EventID] [int] NULL,
	[EventType] [varchar](100) NULL,
	[CreatedDateUTC] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ISDeleted] [bit] NULL,
	[StudyID] [int] NULL,
	[ReferringSpecialistID] [int] NULL,
	[DocumentVersionID] [int] NULL,
	[UserSessionID] [int] NULL,
	[ViewedPercentage] [decimal](18, 2) NULL,
	[StudyWistiaProjectID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [TEST].[vw_LandingPageActivityReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TEST].[vw_LandingPageActivityReporting] as 
--Reporting View for TA Engagement Report

WITH Docs as (
--Details for documents downloaded from the study landing page
SELECT
 V.DocumentVersionID
,V.DocumentID
,D.Name
FROM cta.tbldocumentversion V
JOIN cta.tblDocument D on D.DocumentID = V.DocumentID
WHERE 0=0

)

--CTE To combine the different tables in a reportable format
--Document Downloads, Videos, Optional Link Views, Referral Submits
,Activity as (
--Document Downloads
SELECT
 L.EventID as ID
,'Download Document' as Type
,L.CreatedDateUTC
,L.StudyID
,L.ReferringSpecialistID
,L.UserSessionID
,D.Name as Detail
FROM [test].[LandingPageEvents] L
JOIN Docs D on D.DocumentVersionID = L.DocumentVersionID
JOIN test.vw_SpecialistReporting s on S.ReferringSpecialistID = L.ReferringSpecialistID
JOIN test.vw_StudyReporting ST on St.StudyID = L.StudyID
WHERE 0=0
AND L.IsDeleted = 0

UNION
--Video Views
SELECT
 L.EventID as ID
,'View Video' as Type
,L.CreatedDateUTC
,L.StudyID
,L.ReferringSpecialistID
,L.UserSessionID
,W.VideoName as Detail
FROM [dbo].[LandingPageEvents] L
JOIN cta.tblWistiaVideo W on W.StudyWistiaProjectID = L.StudyWistiaProjectID
JOIN test.vw_SpecialistReporting s on S.ReferringSpecialistID = L.ReferringSpecialistID
JOIN test.vw_StudyReporting ST on St.StudyID = L.StudyID
WHERE 0=0
AND L.IsDeleted = 0

UNION
--Optional Link Views
SELECT
 R.ReferStudyStudyUrlID as ID
,'Optional Link View' as Type
,R.CreatedDateUtc
,R.StudyID
,R.ReferringSpecialistID
,R.UserSessionID
,R.ReferralPath as Detail
FROM cta.tblReferStudyStudyUrl R
JOIN test.vw_SpecialistReporting s on S.ReferringSpecialistID = R.ReferringSpecialistID
JOIN test.vw_StudyReporting ST on St.StudyID = R.StudyID
WHERE 0=0
AND r.IsDeleted = 0

UNION 
--Referral Submits
SELECT
 R.ReferStudyReferralSubmitID as ID
,'Referral Submit' as Type
,R.CreatedDateUtc
,R.StudyID
,R.ReferringSpecialistID
,R.UserSessionID
,'N/A' as Detail

FROM cta.[tblReferStudyReferralSubmit ] R
JOIN test.vw_SpecialistReporting s on S.ReferringSpecialistID = R.ReferringSpecialistID
JOIN test.vw_StudyReporting ST on St.StudyID = R.StudyID
WHERE 0=0
AND r.IsDeleted = 0
)

--Final Query to join referringspecialistaddress to be able to filter activities by country
SELECT
 A.ID
,A.Type
,A.CreatedDateUTC
,A.StudyID
,A.ReferringSpecialistID
,A.UserSessionID
,A.Detail
,S.CountryID
FROM Activity A
--Join Primary specialist address that is not deleted
JOIN cta.tblReferringSpecialistAddress S on S.ReferringSpecialistID = A.ReferringSpecialistID
WHERE 0=0
AND S.IsPrimary = 1
AND S.IsDeleted = 0
GO
/****** Object:  Table [cta].[tblOrganization]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblOrganization]
(
	[OrganizationID] [int] NOT NULL,
	[OrganizationTypeID] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[ModifiedReason] [nvarchar](512) NULL,
	[IsTwoFactorRequired] [bit] NOT NULL,
	[TwoFactorProviderId] [nvarchar](128) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblOrganization ')
GO
/****** Object:  View [TEST].[vw_OrganizationReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TEST].[vw_OrganizationReporting] as 
--Organization Reporting for DS-43
SELECT
 OrganizationID
,Name
FROM cta.tblOrganization
WHERE 0=0
--Exclude ClinOne
AND OrganizationID <> 38
--Exclude Deleted Organizations
AND IsDeleted = 0
GO
/****** Object:  Table [ctc].[VersionLanguageView]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[VersionLanguageView]
(
	[VersionLanguageViewId] [int] NOT NULL,
	[VersionLanguageId] [bigint] NOT NULL,
	[UserSessionId] [int] NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ReferralPath] [varchar](2083) NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'VersionLanguageView')
GO
/****** Object:  Table [ctc].[Version]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[Version]
(
	[VersionId] [bigint] NOT NULL,
	[VersionDocumentId] [bigint] NOT NULL,
	[VersionName] [varchar](50) NOT NULL,
	[VersionLanguageId] [bigint] NULL,
	[VersionFileId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[VersionDocumentName] [varchar](50) NULL,
	[VersionExtension] [varchar](4) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'Version')
GO
/****** Object:  Table [ctc].[VersionLanguage]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[VersionLanguage]
(
	[VersionLanguageId] [bigint] NOT NULL,
	[VersionLanguageLanguageId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[VersionLanguageUrl] [varchar](255) NULL,
	[VersionLanguageVersionId] [bigint] NULL,
	[FileStoreGuid] [nvarchar](128) NULL,
	[FileExtensionId] [int] NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'VersionLanguage')
GO
/****** Object:  Table [ctc].[Document]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[Document]
(
	[DocumentId] [bigint] NOT NULL,
	[DocumentTypeId] [bigint] NOT NULL,
	[DocumentName] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[MediaTypeId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[StudyGuid] [uniqueidentifier] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'Document')
GO
/****** Object:  Table [ctc].[DocumentType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[DocumentType]
(
	[DocumentTypeId] [bigint] NOT NULL,
	[DocumentTypeDescription] [varchar](30) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'DocumentType')
GO
/****** Object:  Table [ctc].[MediaType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[MediaType]
(
	[MediaTypeId] [int] NOT NULL,
	[MediaTypeDescription] [varchar](50) NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'MediaType')
GO
/****** Object:  Table [ctc].[Language]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[Language]
(
	[LanguageId] [int] NOT NULL,
	[LanguageName] [varchar](50) NOT NULL,
	[LanguageAbbreviation] [varchar](7) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsRtl] [bit] NOT NULL,
	[ConsentValue] [nvarchar](7) NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'Language')
GO
/****** Object:  Table [ctc].[PatientEvent]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[PatientEvent]
(
	[PatientEventId] [bigint] NOT NULL,
	[EventTypeId] [bigint] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[DocumentId] [bigint] NULL,
	[ReferredUserId] [varchar](128) NULL,
	[QuestionId] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[SiteGuid] [uniqueidentifier] NULL,
	[UserSessionId] [int] NOT NULL,
	[ReferralPath] [varchar](2083) NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'PatientEvent')
GO
/****** Object:  Table [ctc].[EventType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[EventType]
(
	[EventTypeId] [bigint] NOT NULL,
	[EventTypeDesc] [varchar](225) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'EventType')
GO
/****** Object:  Table [ctc].[UserSession]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[UserSession]
(
	[UserSessionId] [int] NOT NULL,
	[AppTypeId] [int] NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[Language] [varchar](10) NULL,
	[IPAddress] [varchar](128) NULL,
	[Browser] [varchar](256) NULL,
	[AppVersion] [varchar](16) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'Usersession')
GO
/****** Object:  Table [ctc].[User]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[User]
(
	[UserId] [nvarchar](128) NOT NULL,
	[UserRegistrationDate] [datetime] NULL,
	[UserLastLoginDate] [datetime] NULL,
	[UserRoleText] [varchar](50) NULL,
	[UserLastReminderDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[HasAcceptedTerms] [bit] NOT NULL,
	[UserCountryId] [bigint] NOT NULL,
	[UserLanguageId] [int] NOT NULL,
	[IsDemo] [bit] NOT NULL,
	[UserTimeZoneID] [varchar](64) NOT NULL,
	[UserPhoneCountryId] [bigint] NOT NULL,
	[HasAcceptedVirtualVisitTerms] [bit] NOT NULL,
	[EmailInviteToken] [uniqueidentifier] NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'User')
GO
/****** Object:  Table [ctc].[SitePatient]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[SitePatient]
(
	[SitePatientId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[InviteDate] [date] NULL,
	[IsInterested] [bit] NULL,
	[DeclineReason] [varchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SiteGuid] [uniqueidentifier] NOT NULL,
	[DistanceMetersToSite] [int] NULL,
	[ReferringSiteGuid] [uniqueidentifier] NULL,
	[InvitationTypeId] [int] NOT NULL,
	[InviteAddressTypeId] [int] NOT NULL,
	[CtaStudySoeSubjectGuid] [uniqueidentifier] NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'SitePatient ')
GO
/****** Object:  Table [ctc].[SiteStudyVideoChatView]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[SiteStudyVideoChatView]
(
	[SiteStudyVideoChatViewId] [int] NOT NULL,
	[SiteStudyVideoChatID] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserSessionId] [int] NOT NULL,
	[ReferralPath] [varchar](2083) NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'SiteStudyVideoChatView')
GO
/****** Object:  Table [ctc].[ConversationMessage]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[ConversationMessage]
(
	[ConversationMessageId] [int] NOT NULL,
	[ConversationId] [int] NOT NULL,
	[SitePatientId] [int] NULL,
	[CTAUserID] [int] NULL,
	[ConversationMessageTypeId] [int] NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsVirtualVisitRequest] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'ConversationMessage ')
GO
/****** Object:  Table [ctc].[lk_ConversationMessageType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[lk_ConversationMessageType]
(
	[ConversationMessageTypeId] [int] NOT NULL,
	[DisplayName] [varchar](30) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_ConversationMessageType')
GO
/****** Object:  Table [ctc].[ConversationMessageView]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[ConversationMessageView]
(
	[ConversationMessageViewId] [int] NOT NULL,
	[ConversationMessageId] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserSessionId] [int] NOT NULL,
	[ReferralPath] [varchar](2083) NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'ConversationMessageView')
GO
/****** Object:  Table [cta].[tblSiteStudy]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblSiteStudy]
(
	[SiteStudyID] [int] NOT NULL,
	[StudyID] [int] NOT NULL,
	[SiteNumber] [nvarchar](32) NULL,
	[SiteName] [nvarchar](256) NOT NULL,
	[SiteAddressLine1] [varchar](512) NULL,
	[SiteAddressLine2] [varchar](512) NULL,
	[SiteCity] [varchar](max) NULL,
	[SiteGoverningDistrict] [varchar](512) NULL,
	[SiteZip] [varchar](32) NULL,
	[SiteCountryID] [int] NOT NULL,
	[PrincipalInvestigatorName] [nvarchar](64) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SiteGuid] [uniqueidentifier] NOT NULL,
	[IsConnectEnabled] [bit] NOT NULL,
	[IsSoeEnabled] [bit] NOT NULL,
	[TimeZoneID] [varchar](64) NOT NULL,
	[IsAeEnabled] [bit] NOT NULL,
	[MaxReferralDistance] [int] NOT NULL,
	[IsMDReferralEnabled] [bit] NOT NULL,
	[ReferringSpecialistCount] [int] NOT NULL,
	[IsPatientConciergeEnabled] [bit] NOT NULL,
	[IsLmsEnabled] [bit] NOT NULL,
	[SiteStudyIRBTypeID] [int] NULL,
	[IsConsentEnabled] [bit] NOT NULL,
	[IsEproEnabled] [bit] NOT NULL,
	[IsDosingEnabled] [bit] NOT NULL,
	[IsPatientRideEnabled] [bit] NOT NULL,
	[IsSoePreScreeningEnabled] [bit] NOT NULL,
	[IsVideoChatEnabled] [bit] NOT NULL,
	[IsPatientConciergeDocumentsEnabled] [bit] NOT NULL,
	[IsPatientVoiceEnabled] [bit] NOT NULL,
	[CustomConfiguration] [varchar](max) NULL,
	[IsCommunityEnabled] [bit] NOT NULL,
	[IsCriteriaEnabled] [bit] NOT NULL,
	[IsResourcesEnabled] [bit] NOT NULL,
	[IsStudyPersonnelEnabled] [bit] NOT NULL,
	[IsVendorsEnabled] [bit] NOT NULL,
	[IsEducatePatientsEnabled] [bit] NOT NULL,
	[SiteStudyConsentStatusID] [int] NOT NULL,
	[IsVirtualVisitEnabled] [bit] NOT NULL,
	[IsSecureMessagingEnabled] [bit] NOT NULL,
	[IsAskAQuestionEnabled] [bit] NOT NULL,
	[IsConnectedDevicesEnabled] [bit] NOT NULL,
	[IsCreateSubjectThroughUserInterfaceEnabled] [bit] NOT NULL,
	[IsSiteConsentSMSEnabled] [bit] NOT NULL,
	[IsAeEnabledFinal] [bit] NOT NULL,
	[IsAskAQuestionEnabledFinal] [bit] NOT NULL,
	[IsVendorsEnabledFinal] [bit] NOT NULL,
	[IsEproEnabledFinal] [bit] NOT NULL,
	[CanConnectCTAPatientToCTCPatientFinal] [bit] NOT NULL,
	[IsMDReferralEnabledFinal] [bit] NOT NULL,
	[IsVirtualVisitEnabledFinal] [bit] NOT NULL,
	[IsPatientConciergeEnabledFinal] [bit] NOT NULL,
	[IsPatientVoiceEnabledFinal] [bit] NOT NULL,
	[IsSecureMessagingEnabledFinal] [bit] NOT NULL,
	[IsDosingEnabledFinal] [bit] NOT NULL,
	[IsSoePreScreeningEnabledFinal] [bit] NOT NULL,
	[IsEducatePatientsEnabledFinal] [bit] NOT NULL,
	[IsConsentEnabledFinal] [bit] NOT NULL,
	[IsLmsEnabledFinal] [bit] NOT NULL,
	[IsVideoChatEnabledFinal] [bit] NOT NULL,
	[IsPatientConciergeDocumentsEnabledFinal] [bit] NOT NULL,
	[IsPatientRideEnabledFinal] [bit] NOT NULL,
	[IsResourcesEnabledFinal] [bit] NOT NULL,
	[IsConnectEnabledAndInProductionFinal] [bit] NOT NULL,
	[IsCriteriaEnabledFinal] [bit] NOT NULL,
	[IsSoeEnabledFinal] [bit] NOT NULL,
	[IsStudyPersonnelEnabledFinal] [bit] NOT NULL,
	[IsConnectEnabledFinal] [bit] NOT NULL,
	[IsCommunityEnabledFinal] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblSiteStudy')
GO
/****** Object:  View [TEST].[vw_PatientActivityReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TEST].[vw_PatientActivityReporting] as
--leverages patientevent as well as additional tables unioned to consolidate different patient activity log tables

WITH userSessions AS (SELECT UserSessionId, UserId, CreatedDateUtc FROM   ctc.UserSession WHERE  UserId IS NOT NULL)

--Document View CTE (Leverages same logic as [dbo].[v_PatientStudyDocumentView] in ctc
,DocumentViews as (
SELECT 
	 vlv.VersionLanguageviewID
	,d.DocumentId
	,US.UsersessionID
	--Custom Event Type based on Source Table
	,US.UserId
	,d.DocumentName
	,dt.DocumentTypeDescription AS DocumentType
	,v.VersionName
	,l.LanguageName AS VersionLanguageName
	,d.StudyGuid
	,us.CreatedDateUtc
FROM userSessions AS us
INNER JOIN ctc.VersionLanguageView AS vlv ON vlv.UserSessionId = us.UserSessionId
LEFT OUTER JOIN ctc.VersionLanguage AS vl ON vl.VersionLanguageId = vlv.VersionLanguageId
LEFT OUTER JOIN ctc.Version AS v ON v.VersionId = vl.VersionLanguageVersionId
LEFT OUTER JOIN ctc.Document AS d ON d.DocumentId = v.VersionDocumentId
LEFT OUTER JOIN ctc.DocumentType AS dt ON dt.DocumentTypeId = d.DocumentTypeId 
LEFT OUTER JOIN ctc.MediaType AS mt ON mt.MediaTypeId = d.MediaTypeId
LEFT OUTER JOIN ctc.Language AS l ON l.LanguageId = v.VersionLanguageId
)



SELECT  
	   P.[PatientEventId] as ID
      ,CAST(P.[CreatedDateUtc] as date) CreatedDateUTC
      ,P.[DocumentId] as DetailID
      ,P.[UserSessionId]
	  ,E.EventTypeDesc
	  ,S.UserId
	  ,U.UserCountryId
	  ,U.IsDeleted as 'UserDeleted'
	  ,C.SiteStudyID
	  ,D.StudyID
	  --Next two columns Used for distinct Counting and differentiating different tables
	  ,'PatientEvent' as 'SourceTable'
	  ,CONCAT(P.[PatientEventId], '-' , 1 ) as DerivedKey
	  --Used in last union query for supplying document name
	  ,NULL as DetailName
	  ,NULL as VersionName
  FROM ctc.[PatientEvent] P
  JOIN ctc.EventType E on E.EventTypeId = P.EventTypeId
  JOIN ctc.UserSession S on S.UserSessionId = P.UserSessionId
  JOIN ctc.[User] U on U.UserId = S.UserID 
  JOIN ctc.SitePatient SP on SP.UserId = U.UserId
  JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
  JOIN test.vw_StudyReporting D ON (D.StudyID=C.StudyID)
  WHERE 0=0
  --Exclude Deleted Records
  AND P.IsDeleted = 0
  --Exclude Demo Users
  AND U.IsDemo = 0
  --Exclude Inactive Events
  AND E.IsActive = 1
  --Exlcude these Event Types, presumed that they are deprecated or no longer relevant
  AND E.EventTypeDesc NOT IN ('Access Site', 'Accessed Document', 'Account Settings - View', 'Contact Site - View', 'Interested' , 'Not Interested', 'Question' )

 
 UNION ALL

 --SiteStudyVideoChatView
SELECT 
	 V.[SiteStudyVideoChatViewId] as ID
	,CAST(V.[CreatedDateUtc] as date) as [CreatedDateUtc]
	,V.[SiteStudyVideoChatID] as DetailID
	,V.UserSessionId
	--Custom Event Type based on Source Table
	,'Video Chat View' as EventTypeDesc
	,S.UserId
	,U.UserCountryId
	,U.IsDeleted as 'UserDeleted'
	,C.SiteStudyID
	,D.StudyID
	--Next two columns Used for distinct Counting and differentiating different tables
	,'SiteStudyVideoChatView' as 'SourceTable'
	,CONCAT(V.[SiteStudyVideoChatViewId], '-' , 2 ) as DerivedKey
	--Used in last union query for supplying document name
	,NULL as DetailName
	,NULL as VersionName
  FROM [ctc].[SiteStudyVideoChatView] V
  JOIN [ctc].UserSession S on S.UserSessionId = v.UserSessionId
  JOIN ctc.[User] U on U.UserId = S.UserID 
  JOIN ctc.SitePatient SP on SP.UserId = U.UserId
  JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
  JOIN test.vw_StudyReporting D ON (D.StudyID=C.StudyID)
  WHERE 0=0
  --Exclude Deleted Records
  AND V.IsDeleted = 0
  --Exclude Demo Users
  AND U.IsDemo = 0

UNION ALL

--Conversation Messages
SELECT 
	 V.[ConversationMessageViewId] as ID
	,CAST(V.[CreatedDateUtc] as Date) as [CreatedDateUtc]
	,V.ConversationMessageId as DetailID
	,V.UserSessionId
	--Custom Event Type based on Source Table
	,'Conversation Message View' as EventTypeDesc
	,S.UserId
	,U.UserCountryId
	,U.IsDeleted as 'UserDeleted'
	,C.SiteStudyID
	,D.StudyID
	--Next two columns Used for distinct Counting and differentiating different tables
	,'ConversationMessageView' as 'SourceTable'
	,CONCAT(V.[ConversationMessageViewId], '-' , 3 ) as DerivedKey
	--Used in last union query for supplying document name
	,NULL as DetailName
	,NULL as VersionName
FROM [ctc].[ConversationMessageView] V
JOIN ctc.ConversationMessage M on M.ConversationMessageId = V.ConversationMessageId
JOIN ctc.lk_ConversationMessageType T on T.ConversationMessageTypeId = M.ConversationMessageTypeId
JOIN ctc.UserSession S on S.UserSessionId = V.UserSessionId
JOIN ctc.[User] U on U.UserId = S.UserID 
JOIN ctc.SitePatient SP on SP.UserId = U.UserId
JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
JOIN test.vw_StudyReporting D ON (D.StudyID=C.StudyID)
WHERE 0=0
--Exclude Deleted Message Views
	AND C.Isdeleted = 0
--Exclude Demo Users
  AND U.IsDemo = 0
 
UNION ALL

--Patient Document Views
SELECT 
	 V.VersionLanguageviewID as ID
	,CAST( V.CreatedDateUtc as Date) as CreatedDateUtc
	,V.DocumentId as DetailID
	,V.UserSessionId
	--Custom Event Type based on Source Table
	,'Patient Document View' as EventTypeDesc
    ,S.UserId
	,U.UserCountryId
	,U.IsDeleted as 'UserDeleted'
	,C.SiteStudyID
	,D.StudyID
	--Used for distinct Counting and differentiating different tables
	,'VersionLanguageView' as 'SourceTable'  	  
	,CONCAT(V.VersionLanguageviewID, '-' , 4 ) as DerivedKey
	--Used for supplying document name
	,V.DocumentName as DetailName
	--Document Version
	,v.VersionName
  FROM DocumentViews V
  JOIN ctc.UserSession S on S.UserSessionId = V.UserSessionId
  JOIN ctc.[User] U on U.UserId = S.UserID 
  JOIN ctc.SitePatient SP on SP.UserId = U.UserId
  JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
  JOIN test.vw_StudyReporting D ON (D.StudyID=C.StudyID)
  WHERE 0=0
  --Exclude Demo Users
  AND U.IsDemo = 0



GO
/****** Object:  Table [ctc].[SitePatientRide]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[SitePatientRide]
(
	[SitePatientRideId] [int] NOT NULL,
	[SitePatientId] [int] NOT NULL,
	[PatientRideTypeId] [int] NOT NULL,
	[UberStatus] [nvarchar](128) NOT NULL,
	[UberProductTypeId] [nvarchar](128) NOT NULL,
	[RequestDateTimeUtc] [datetime] NOT NULL,
	[BeginDateTimeUtc] [datetime] NULL,
	[DropoffDateTimeUtc] [datetime] NULL,
	[ScheduledDateTimeUtc] [datetime] NOT NULL,
	[RideEstimateCurrencyCode] [nvarchar](36) NULL,
	[RideEstimateHighEstimate] [int] NULL,
	[RideEstimateLowEstimate] [int] NULL,
	[RideEstimateDistance] [float] NOT NULL,
	[RideEstimateDistanceUnit] [nvarchar](36) NOT NULL,
	[RideEstimateDurationSeconds] [int] NOT NULL,
	[RideEstimateDisplayEstimate] [nvarchar](255) NOT NULL,
	[RideEstimateValue] [float] NULL,
	[PickUpCountryId] [bigint] NOT NULL,
	[DropOffCountryId] [bigint] NOT NULL,
	[Duration] [float] NULL,
	[Distance] [float] NULL,
	[Subtotal] [float] NULL,
	[TotalFare] [float] NULL,
	[TotalOwed] [float] NULL,
	[CurrencyCode] [nvarchar](16) NULL,
	[SurgeName] [nvarchar](255) NULL,
	[SurgeAmount] [float] NULL,
	[SurgeMultiplier] [float] NULL,
	[DistanceLabel] [nvarchar](36) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[ModifiedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RiderInitiatedRide] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'SitePatientRide ')
GO
/****** Object:  View [TEST].[vw_PatientRides]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TEST].[vw_PatientRides] as


--Created for DS-64 Patient Ride Report
--Get the latest audit record for each ride
WITH LatestRow AS (
	SELECT SitePatientRideId, MAX(RequestDateTimeUtc) AS RequestDateTimeUtc 
	FROM ctc.SitePatientRide
	GROUP BY SitePatientRideId
)

SELECT
	 
	
	 A.[SitePatientRideId]
	,A.[SitePatientId]
	,A.[UberStatus]
	,A.[Duration]
	,A.[Distance]
	,A.[TotalFare]
	,A.[CurrencyCode]
	,A.[CreatedDate]
	,D.SponsorName AS Sponsor
	,D.ProtocolNumber AS Protocol
	,D.IsDeleted as StudyArchiveStatus
	,C.SiteName
	,C.SiteNumber
	,C.SiteCity
	,C.SiteZip
	,C.IsDeleted as SiteArchiveStatus
	,D.OrganizationID
	,O.Name as 'Organization'
	,C.SiteStudyID
	
FROM ctc.SitePatientRide A
--Limit to the latest record for each ride from cte above
JOIN LatestRow AA ON (AA.RequestDateTimeUtc=A.RequestDateTimeUTC AND AA.SitePatientRideId=A.SitePatientRideId)
LEFT JOIN ctc.SitePatient B ON (A.SitePatientId=B.SitePatientId)
LEFT JOIN cta.tblSiteStudy C ON (C.SiteGuid=B.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
JOIN cta.tblStudy D ON (D.StudyID=C.StudyID)
LEFT JOIN cta.tblOrganization O on (O.OrganizationID = D.OrganizationID )
WHERE 1=1
AND A.IsDeleted = 0 --Exclude Deleted Rides
AND D.SponsorName <> 'ClinOne, Inc.' --Exclude ClinOne Data



GO
/****** Object:  View [TEST].[vw_ReferStudyViewReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TEST].[vw_ReferStudyViewReporting] as 

--Study View Reporting for DS-43

SELECT
 R.ReferStudyViewID
,R.UserSessionID
,R.StudyID
,R.SiteStudyID
,R.ReferringSpecialistID
,E.Email
,CAST(R.CreatedDateUtc as DATE) as CreatedDateUTC
,CONCAT(R.ReferringSpecialistID, '-' , CAST(R.CreatedDateUTC as date) , '-' , R.StudyID ) as UniqueKeyView
,CONCAT(E.Email, '-' , CAST(R.CreatedDateUTC as date) , '-' , R.StudyID ) as UniqueKeyView2
,US.Duration
FROM cta.tblReferStudyView R
JOIN test.vw_StudyReporting S on R.StudyID = S.StudyID
JOIN test.vw_SpecialistReporting E on E.ReferringSpecialistID = R.ReferringSpecialistID
join cta.TblUserSession US on us.UserSessionID = R.UserSessionID
WHERE 0=0
AND S.StudyClientTypeID = 1
--Exclude Records without a recorded Specialist
AND R.ReferringSpecialistID IS NOT NULL
AND R.IsDeleted = 0

GO
/****** Object:  View [TEST].[vw_SiteStudyReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TEST].[vw_SiteStudyReporting] as 

SELECT
 SS.SiteStudyID
,SS.StudyID
,SS.SiteNumber
,SS.SiteName
,SS.SiteAddressLine1
,SS.SiteAddressLine2
,SS.SiteCity
,SS.SiteGoverningDistrict
,SS.SiteZip 
,SS.SiteCountryID 
,SS.CreatedBy 
,SS.IsDeleted
,SS.IsConnectEnabled
,SS.IsSoeEnabled
,SS.TimeZoneID
,SS.IsAeEnabled
,SS.MaxReferralDistance
,SS.IsMDReferralEnabledFinal as IsMDReferralEnabled
--,SS.GeoLocation
,SS.ReferringSpecialistCount
FROM cta.tblSiteStudy SS
JOIN [test].[vw_StudyReporting] S ON S.StudyID=SS.StudyID
WHERE 0=0
--SiteStudyBizRules
--AND SS.IsDeleted = 0
AND SS.SiteNumber <> '000'
GO
/****** Object:  Table [cta].[tblStudySoeSubjectStatusReason]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblStudySoeSubjectStatusReason]
(
	[StudySoeSubjectStatusReasonID] [int] NOT NULL,
	[StudySoeSubjectID] [int] NOT NULL,
	[StudySoeSubjectStatusReasonTypeID] [int] NOT NULL,
	[StatusReasonDateUtc] [datetime] NOT NULL,
	[IsCurrent] [bit] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblStudySoeSubjectStatusReason')
GO
/****** Object:  Table [cta].[lk_StudySoeSubjectStatusReasonType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[lk_StudySoeSubjectStatusReasonType]
(
	[StudySoeSubjectStatusReasonTypeID] [int] NOT NULL,
	[StudySoeSubjectStatusTypeID] [int] NOT NULL,
	[StudySoeSubjectStatusTypeReason] [nvarchar](512) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[CanSubjectInitialConsentOrReconsent] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CanSubjectUsePatientRide] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_StudySoeSubjectStatusReasonType')
GO
/****** Object:  Table [cta].[lk_StudySoeSubjectStatus]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[lk_StudySoeSubjectStatus]
(
	[StudySoeSubjectStatusID] [int] NOT NULL,
	[StudySoeSubjectStatus] [nvarchar](64) NOT NULL,
	[SortOrder] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[StudySoePathTypeID] [int] NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_StudySoeSubjectStatus')
GO
/****** Object:  Table [cta].[tblStudySoeSubject]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblStudySoeSubject]
(
	[StudySoeSubjectID] [int] NOT NULL,
	[SiteStudyID] [int] NOT NULL,
	[SubjectIdentifier] [nvarchar](256) NULL,
	[ScreeningIdentifier] [nvarchar](256) NULL,
	[SecondaryIdentifier] [nvarchar](64) NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[StudySoeSubjectGuid] [uniqueidentifier] NOT NULL,
	[IsPatientConciergeEnabled] [bit] NOT NULL,
	[PreScreeningIdentifier] [nvarchar](256) NULL,
	[StudySoeSubjectStatusID] [int] NULL,
	[StudySoeSubjectPathTypeID] [int] NULL,
	[ClientIdentifier] [nvarchar](256) NULL,
	[ConsentInvestigatorName] [nvarchar](256) NULL,
	[ConsentInvestigatorEmailAddress] [nvarchar](256) NULL,
	[ConsentCoordinatorName] [nvarchar](256) NULL,
	[ConsentCoordinatorEmailAddress] [nvarchar](256) NULL,
	[IsReadonly] [bit] NOT NULL,
	[ConsentInvestigatorCTAUserSiteStudyId] [int] NULL,
	[ConsentCoordinatorCTAUserSiteStudyId] [int] NULL,
	[IsDeviceOrderEnabled] [bit] NOT NULL,
	[ModifiedReason] [nvarchar](256) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblStudySoeSubject')
GO
/****** Object:  View [TEST].[vw_SubjectStatusReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--most current status per subject based on iscurrent
CREATE VIEW [TEST].[vw_SubjectStatusReporting] as 

SELECT DISTINCT
       S.StudySoeSubjectStatus 
	  ,SSS.IsDeleted as SubjectArchived
	  ,U.UserID
	  	  
  FROM [cta].[tblStudySoeSubjectStatusReason] R
  JOIN [cta].[lk_StudySoeSubjectStatusReasonType] T on T.StudySoeSubjectStatusReasonTypeID = R.StudySoeSubjectStatusReasonTypeID
  JOIN [cta].[lk_StudySoeSubjectStatus] S on S.StudySoeSubjectStatusID = T.StudySoeSubjectStatusTypeID
  JOIN [cta].tblStudySoeSubject SSS on SSS.StudySoeSubjectID = R.StudySoeSubjectID 
  JOIN [cta].tblSiteStudy SS on SS.SiteStudyID = SSS.SiteStudyID AND SS.SiteNumber <> '000' --Exclude MySite
  JOIN [cta].tblstudy D ON (D.StudyID=SS.StudyID)
  JOIN [ctc].SitePatient P on P.CtaStudySoeSubjectGuid = SSS.StudySoeSubjectGuid --This limiting join to about 2k subjects
  JOIN [ctc].[User] U on U.UserID = P.UserID
  WHERE 0=0
  --Current Subject Status Reason
  AND R.IsCurrent = 1
  --Exlcude Deleted Subject Status Reasons
  AND R.IsDeleted = 0
  --Exclude Demo Users
  AND u.IsDemo = 0
  --Exclude ClinOne SponsorNames
  AND D.SponsorName NOT LIKE '%ClinOne%' 
  --Exlcude Test sponsor
  AND D.sponsorname NOT LIKE '%test%' 
  --Exclude ClinOne Organization or allow null OrganizationIDs
  AND (D.OrganizationID NOT IN( 38) OR D.OrganizationID IS NULL)
  --Exclude Demo Studies
  AND D.IsDemo = 0
  

GO
/****** Object:  Table [cta].[lk_country]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[lk_country]
(
	[CountryID] [int] NOT NULL,
	[ISO] [varchar](4) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[NiceName] [varchar](128) NOT NULL,
	[ISO3] [varchar](4) NULL,
	[NumCode] [smallint] NULL,
	[PhoneCode] [smallint] NOT NULL,
	[IsTop] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_Country ')
GO
/****** Object:  Table [cta].[lk_StudyAdminStatus]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[lk_StudyAdminStatus]
(
	[StudyAdminStatusID] [int] NOT NULL,
	[StudyAdminStatus] [nvarchar](32) NOT NULL,
	[SortOrder] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_StudyAdminStatus')
GO
/****** Object:  Table [cta].[tblCTAUserSiteStudy]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblCTAUserSiteStudy]
(
	[CTAUserSiteStudyID] [int] NOT NULL,
	[CTAUserID] [int] NOT NULL,
	[CTAUserAccessLevelID] [int] NOT NULL,
	[SiteStudyID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsPatientContact] [bit] NOT NULL,
	[RoleName] [nvarchar](64) NULL,
	[Phone] [nvarchar](24) NULL,
	[TrainedDateUtc] [datetime] NULL,
	[IsReferralContact] [bit] NOT NULL,
	[CanConsentSubject] [bit] NOT NULL,
	[IsSubscribedToInitialConsentNotifications] [bit] NOT NULL,
	[IsSubscribedToReConsentNotifications] [bit] NOT NULL,
	[CanManageUsers] [bit] NOT NULL,
	[IsSubscribedToDosingDiaryNotifications] [bit] NOT NULL,
	[ReasonForArchive] [nvarchar](512) NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblCTAUserSiteStudy ')
GO
/****** Object:  View [TEST].[vw_TASiteReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [TEST].[vw_TASiteReporting] as

WITH ReferralContact as (
--CTE for referral contacts per Site
SELECT
 SiteStudyID
,COUNT(DISTINCT CTAUserSiteStudyID ) as ReferralContacts
FROM cta.tblCTAUserSiteStudy
WHERE 0=0
AND IsDeleted = 0
AND IsReferralContact = 1
GROUP BY 
SiteStudyID
)

SELECT
 O.Name as 'Organization Name'
,O.OrganizationID
,ST.SponsorName as 'Sponsor Name'
,ST.ProtocolNumber
,ST.StudyID
,A.StudyAdminStatus
,S.SiteNumber
,S.SiteStudyID
,S.SiteName
,S.SiteAddressLine1
,S.SiteAddressLine2
,S.SiteCity
,S.SiteGoverningDistrict
,S.SiteZip
--Combine Address columns
,S.SiteAddressLine1 + ' ' + COALESCE(S.SiteAddressLine2 , '' ) + ' ' + S.SiteCity + ', ' + COALESCE(S.SiteGoverningDistrict, '') + ' ' + COALESCE(S.SiteZip,'') as Detail
,C.NiceName as 'Country'
,C.CountryID
,S.PrincipalInvestigatorName
,S.IsMDReferralEnabledFinal as IsMDReferralEnabled
,S.MaxReferralDistance
--Joined Referral Contacts from CTE
,CASE WHEN R.ReferralContacts IS NOT NULL THEN 1 ELSE 0 END AS 'At Least one Referral Contact'
,R.ReferralContacts
,S.ReferringSpecialistCount
,S.IsCommunityEnabledFinal as IsCommunityEnabled
,S.IsCriteriaEnabledFinal as IsCriteriaEnabled
,S.IsResourcesEnabledFinal as IsResourcesEnabled
,S.IsStudyPersonnelEnabledFinal as IsStudyPersonnelEnabled
,S.IsVendorsEnabledFinal as IsVendorsEnabled
,S.IsCreateSubjectThroughUserInterfaceEnabled
FROM cta.tblSiteStudy S
JOIN cta.lk_country C on C.CountryID = S.SiteCountryID
JOIN cta.tblStudy ST on ST.StudyID = S.StudyID
JOIN cta.tblOrganization O on O.OrganizationID = ST.OrganizationID
JOIN cta.lk_StudyAdminStatus A on A.StudyAdminStatusID = ST.StudyAdminStatusID
LEFT JOIN ReferralContact R on R.SiteStudyID = S.SiteStudyID
WHERE 0=0
--Exclude Deleted/Demo Records and non Production Data
AND S.IsDeleted = 0
AND O.IsDeleted = 0
AND ST.IsDeleted = 0
AND ST.IsDemo = 0
AND S.SiteNumber <> '000'
AND S.SiteName <> '%My Site%'
AND ST.SponsorName <> 'ClinOne'
AND O.OrganizationID <> 38



GO
/****** Object:  View [TEST].[vw_UserSessionreporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [TEST].[vw_UserSessionreporting] as
--Used to capture landing page view duration for TA Engagement Reporting DS-43
SELECT 
	 U.[UserSessionID]
	 --Logic to Parse Session Duration in Seconds
	,(LEFT(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) - 1)  * 60 * 60) + (SUBSTRING(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) + 1, 2) * 60) + SUBSTRING(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) + 4, 2) + CASE WHEN (SUBSTRING(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) + 7, LEN(CAST(U.[Duration] as varchar))) >= 50) THEN 1 ELSE 0 END as Duration
	,V.ReferStudyViewID
FROM [cta].[tblUserSession] U
JOIN test.vw_ReferStudyViewReporting V on V.UsersessionID = U.UsersessionID
WHERE 0=0
--Exclude Deleted Sessions
AND U.IsDeleted = 0


GO
/****** Object:  View [scratch].[vw_LandingPageActivities]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Created at: 2022-08-09 19:38:32.631
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: Add in Details about landing page assets
--Stored in view for potential maintenance
--Scratch.EtlLandingPageEvents stored proc inserts this data to table

CREATE VIEW [scratch].[vw_LandingPageActivities] as
--Only include columns with event detail
--Parses Json Column
SELECT
 E.EventID
,T.EventType
,E.CreatedDateUTC
,E.CreatedBy
,E.IsDeleted
,List.StudyID
,List.ReferringSpecialistID
,List.DocumentVersionID
,List.UserSessionID
,List.ViewedPercentage
,List.StudyWistiaProjectID
FROM cta.tblevent E
JOIN cta.lk_EventType T on T.EventTypeID = E.EventTypeID
--Json function to parse data
CROSS APPLY OPENJSON( E.EventData )
WITH (
		StudyID int '$.StudyID',
		ReferringSpecialistID int '$.ReferringSpecialistID',
		DocumentVersionID int '$.DocumentVersionID',
		UserSessionID int '$.UserSessionID',
		ViewedPercentage decimal(18,2) '$.ViewedPercentage',
		StudyWistiaProjectID int '$.StudyWistiaProjectID'
) as List




GO
/****** Object:  View [scratch].[vw_Country]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Created at: 2022-09-16 09:53:30.028
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: Country Reporting View


CREATE VIEW [scratch].[vw_Country] as
SELECT
	 [CountryID]
    ,[ISO]
	,[NiceName]
FROM [cta].[lk_Country]
GO
/****** Object:  View [TEST].[vw_Country]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Created at: 2023-04-14 14:20:43.131
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: Country Reporting View Test

CREATE VIEW [TEST].[vw_Country] as
SELECT
	 [CountryID]
    ,[ISO]
	,[NiceName]
FROM [cta].[lk_Country]
GO
/****** Object:  View [scratch].[vw_TASiteReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Created at: 2022-07-06 13:58:44.594
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: TA Site Information DS-54

CREATE VIEW [scratch].[vw_TASiteReporting] as

WITH ReferralContact as (
--CTE for referral contacts per Site
SELECT
 SiteStudyID
,COUNT(DISTINCT CTAUserSiteStudyID ) as ReferralContacts
FROM cta.tblCTAUserSiteStudy
WHERE 0=0
AND IsDeleted = 0
AND IsReferralContact = 1
GROUP BY 
SiteStudyID
)

SELECT
 O.Name as 'Organization Name'
,O.OrganizationID
,ST.SponsorName as 'Sponsor Name'
,ST.ProtocolNumber
,ST.StudyID
,A.StudyAdminStatus
,S.SiteNumber
,S.SiteStudyID
,S.SiteName
,S.SiteAddressLine1
,S.SiteAddressLine2
,S.SiteCity
,S.SiteGoverningDistrict
,S.SiteZip
--Combine Address columns
,S.SiteAddressLine1 + ' ' + COALESCE(S.SiteAddressLine2 , '' ) + ' ' + S.SiteCity + ', ' + COALESCE(S.SiteGoverningDistrict, '') + ' ' + COALESCE(S.SiteZip,'') as Detail
,C.NiceName as 'Country'
,C.CountryID
,S.PrincipalInvestigatorName
,S.IsMDReferralEnabledFinal as IsMDReferralEnabled
,S.MaxReferralDistance
--Joined Referral Contacts from CTE
,CASE WHEN R.ReferralContacts IS NOT NULL THEN 1 ELSE 0 END AS 'At Least one Referral Contact'
,R.ReferralContacts
,S.ReferringSpecialistCount
,S.IsCommunityEnabledFinal as IsCommunityEnabled
,S.IsCriteriaEnabledFinal as IsCriteriaEnabled
,S.IsResourcesEnabledFinal as IsResourcesEnabled
,S.IsStudyPersonnelEnabledFinal as IsStudyPersonnelEnabled
,S.IsVendorsEnabledFinal as IsVendorsEnabled
,S.IsCreateSubjectThroughUserInterfaceEnabled
FROM cta.tblSiteStudy S
JOIN cta.lk_country C on C.CountryID = S.SiteCountryID
JOIN cta.tblStudy ST on ST.StudyID = S.StudyID
JOIN cta.tblOrganization O on O.OrganizationID = ST.OrganizationID
JOIN cta.lk_StudyAdminStatus A on A.StudyAdminStatusID = ST.StudyAdminStatusID
LEFT JOIN ReferralContact R on R.SiteStudyID = S.SiteStudyID
WHERE 0=0
--Exclude Deleted/Demo Records and non Production Data
AND S.IsDeleted = 0
AND O.IsDeleted = 0
AND ST.IsDeleted = 0
AND ST.IsDemo = 0
AND S.SiteNumber <> '000'
AND S.SiteName <> '%My Site%'
AND ST.SponsorName <> 'ClinOne'
AND O.OrganizationID <> 38



GO
/****** Object:  View [scratch].[vw_PatientActivityReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [scratch].[vw_PatientActivityReporting] as
--Used for DS-59 Patient Activity Reporting
--leverages patientevent as well as additional tables unioned to consolidate different patient activity log tables

WITH userSessions AS (SELECT UserSessionId, UserId, CreatedDateUtc FROM   ctc.UserSession WHERE  UserId IS NOT NULL)

--Document View CTE (Leverages same logic as [dbo].[v_PatientStudyDocumentView] in ctc
,DocumentViews as (
SELECT 
	 vlv.VersionLanguageviewID
	,d.DocumentId
	,US.UsersessionID
	--Custom Event Type based on Source Table
	,US.UserId
	,d.DocumentName
	,dt.DocumentTypeDescription AS DocumentType
	,v.VersionName
	,l.LanguageName AS VersionLanguageName
	,d.StudyGuid
	,us.CreatedDateUtc
FROM userSessions AS us
INNER JOIN ctc.VersionLanguageView AS vlv ON vlv.UserSessionId = us.UserSessionId
LEFT OUTER JOIN ctc.VersionLanguage AS vl ON vl.VersionLanguageId = vlv.VersionLanguageId
LEFT OUTER JOIN ctc.Version AS v ON v.VersionId = vl.VersionLanguageVersionId
LEFT OUTER JOIN ctc.Document AS d ON d.DocumentId = v.VersionDocumentId
LEFT OUTER JOIN ctc.DocumentType AS dt ON dt.DocumentTypeId = d.DocumentTypeId 
LEFT OUTER JOIN ctc.MediaType AS mt ON mt.MediaTypeId = d.MediaTypeId
LEFT OUTER JOIN ctc.Language AS l ON l.LanguageId = v.VersionLanguageId
)



SELECT  
	   P.[PatientEventId] as ID
      ,CAST(P.[CreatedDateUtc] as date) CreatedDateUTC
      ,P.[DocumentId] as DetailID
      ,P.[UserSessionId]
	  ,E.EventTypeDesc
	  ,S.UserId
	  ,U.UserCountryId
	  ,U.IsDeleted as 'UserDeleted'
	  ,C.SiteStudyID
	  ,D.StudyID
	  --Next two columns Used for distinct Counting and differentiating different tables
	  ,'PatientEvent' as 'SourceTable'
	  ,CONCAT(P.[PatientEventId], '-' , 1 ) as DerivedKey
	  --Used in last union query for supplying document name
	  ,NULL as DetailName
	  ,NULL as VersionName
  FROM ctc.[PatientEvent] P
  JOIN ctc.EventType E on E.EventTypeId = P.EventTypeId
  JOIN ctc.UserSession S on S.UserSessionId = P.UserSessionId
  JOIN ctc.[User] U on U.UserId = S.UserID 
  JOIN ctc.SitePatient SP on SP.UserId = U.UserId
  JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
  JOIN scratch.vw_StudyReporting D ON (D.StudyID=C.StudyID)
  WHERE 0=0
  --Exclude Deleted Records
  AND P.IsDeleted = 0
  --Exclude Demo Users
  AND U.IsDemo = 0
  --Exclude Inactive Events
  AND E.IsActive = 1
  --Exlcude these Event Types, presumed that they are deprecated or no longer relevant
  AND E.EventTypeDesc NOT IN ('Access Site', 'Accessed Document', 'Account Settings - View', 'Contact Site - View', 'Interested' , 'Not Interested', 'Question' )

 
 UNION ALL

 --SiteStudyVideoChatView
SELECT 
	 V.[SiteStudyVideoChatViewId] as ID
	,CAST(V.[CreatedDateUtc] as date) as [CreatedDateUtc]
	,V.[SiteStudyVideoChatID] as DetailID
	,V.UserSessionId
	--Custom Event Type based on Source Table
	,'Video Chat View' as EventTypeDesc
	,S.UserId
	,U.UserCountryId
	,U.IsDeleted as 'UserDeleted'
	,C.SiteStudyID
	,D.StudyID
	--Next two columns Used for distinct Counting and differentiating different tables
	,'SiteStudyVideoChatView' as 'SourceTable'
	,CONCAT(V.[SiteStudyVideoChatViewId], '-' , 2 ) as DerivedKey
	--Used in last union query for supplying document name
	,NULL as DetailName
	,NULL as VersionName
  FROM [ctc].[SiteStudyVideoChatView] V
  JOIN [ctc].UserSession S on S.UserSessionId = v.UserSessionId
  JOIN ctc.[User] U on U.UserId = S.UserID 
  JOIN ctc.SitePatient SP on SP.UserId = U.UserId
  JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
  JOIN scratch.vw_StudyReporting D ON (D.StudyID=C.StudyID)
  WHERE 0=0
  --Exclude Deleted Records
  AND V.IsDeleted = 0
  --Exclude Demo Users
  AND U.IsDemo = 0

UNION ALL

--Conversation Messages
SELECT 
	 V.[ConversationMessageViewId] as ID
	,CAST(V.[CreatedDateUtc] as Date) as [CreatedDateUtc]
	,V.ConversationMessageId as DetailID
	,V.UserSessionId
	--Custom Event Type based on Source Table
	,'Conversation Message View' as EventTypeDesc
	,S.UserId
	,U.UserCountryId
	,U.IsDeleted as 'UserDeleted'
	,C.SiteStudyID
	,D.StudyID
	--Next two columns Used for distinct Counting and differentiating different tables
	,'ConversationMessageView' as 'SourceTable'
	,CONCAT(V.[ConversationMessageViewId], '-' , 3 ) as DerivedKey
	--Used in last union query for supplying document name
	,NULL as DetailName
	,NULL as VersionName
FROM [ctc].[ConversationMessageView] V
JOIN ctc.ConversationMessage M on M.ConversationMessageId = V.ConversationMessageId
JOIN ctc.lk_ConversationMessageType T on T.ConversationMessageTypeId = M.ConversationMessageTypeId
JOIN ctc.UserSession S on S.UserSessionId = V.UserSessionId
JOIN ctc.[User] U on U.UserId = S.UserID 
JOIN ctc.SitePatient SP on SP.UserId = U.UserId
JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
JOIN scratch.vw_StudyReporting D ON (D.StudyID=C.StudyID)
WHERE 0=0
--Exclude Deleted Message Views
	AND C.Isdeleted = 0
--Exclude Demo Users
  AND U.IsDemo = 0
 
UNION ALL

--Patient Document Views
SELECT 
	 V.VersionLanguageviewID as ID
	,CAST( V.CreatedDateUtc as Date) as CreatedDateUtc
	,V.DocumentId as DetailID
	,V.UserSessionId
	--Custom Event Type based on Source Table
	,'Patient Document View' as EventTypeDesc
    ,S.UserId
	,U.UserCountryId
	,U.IsDeleted as 'UserDeleted'
	,C.SiteStudyID
	,D.StudyID
	--Used for distinct Counting and differentiating different tables
	,'VersionLanguageView' as 'SourceTable'  	  
	,CONCAT(V.VersionLanguageviewID, '-' , 4 ) as DerivedKey
	--Used for supplying document name
	,V.DocumentName as DetailName
	--Document Version
	,v.VersionName
  FROM DocumentViews V
  JOIN ctc.UserSession S on S.UserSessionId = V.UserSessionId
  JOIN ctc.[User] U on U.UserId = S.UserID 
  JOIN ctc.SitePatient SP on SP.UserId = U.UserId
  JOIN cta.tblSiteStudy C ON (C.SiteGuid=SP.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
  JOIN scratch.vw_StudyReporting D ON (D.StudyID=C.StudyID)
  WHERE 0=0
  --Exclude Demo Users
  AND U.IsDemo = 0



GO
/****** Object:  View [scratch].[vw_ReferStudyViewReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Created at: 2022-07-07 12:05:31.457
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: ReferStudyView

CREATE VIEW [scratch].[vw_ReferStudyViewReporting] as 

--Study View Reporting for DS-43

SELECT
 R.ReferStudyViewID
,R.UserSessionID
,R.StudyID
,R.SiteStudyID
,R.ReferringSpecialistID
,E.Email
,CAST(R.CreatedDateUtc as DATE) as CreatedDateUTC
,CONCAT(R.ReferringSpecialistID, '-' , CAST(R.CreatedDateUTC as date) , '-' , R.StudyID ) as UniqueKeyView
,CONCAT(E.Email, '-' , CAST(R.CreatedDateUTC as date) , '-' , R.StudyID ) as UniqueKeyView2
,US.Duration
FROM cta.tblReferStudyView R
JOIN scratch.vw_StudyReporting S on R.StudyID = S.StudyID
JOIN scratch.vw_SpecialistReporting E on E.ReferringSpecialistID = R.ReferringSpecialistID
join cta.TblUserSession US on us.UserSessionID = R.UserSessionID
WHERE 0=0
AND S.StudyClientTypeID = 1
--Exclude Records without a recorded Specialist
AND R.ReferringSpecialistID IS NOT NULL
AND R.IsDeleted = 0

GO
/****** Object:  View [scratch].[vw_UserSessionreporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [scratch].[vw_UserSessionreporting] as
--Used to capture landing page view duration for TA Engagement Reporting DS-43
SELECT 
	 U.[UserSessionID]
	 --Logic to Parse Session Duration in Seconds
	,(LEFT(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) - 1)  * 60 * 60) + (SUBSTRING(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) + 1, 2) * 60) + SUBSTRING(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) + 4, 2) + CASE WHEN (SUBSTRING(CAST(U.[Duration] as varchar), CHARINDEX(':', CAST(U.[Duration] as varchar)) + 7, LEN(CAST(U.[Duration] as varchar))) >= 50) THEN 1 ELSE 0 END as Duration
	,V.ReferStudyViewID
FROM [cta].[tblUserSession] U
JOIN scratch.vw_ReferStudyViewReporting V on V.UsersessionID = U.UsersessionID
WHERE 0=0
--Exclude Deleted Sessions
AND U.IsDeleted = 0


GO
/****** Object:  View [scratch].[vw_EmailBridgeTable]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Created at: 2022-06-08 13:57:19.990
--Windows User: STEVE-PC\Steph 
--SQL User: sgessling@clinone.com
--Description: Bridge Table For Email Study RelationShips
--Have to parse study and sitestudy ids from json column

CREATE VIEW [scratch].[vw_EmailBridgeTable] as 
--limit to required columns for extracting Json
WITH Emails as (
SELECT 
	   E.[SentEmailID]
      ,E.[MetaData]
FROM [cta].[tblSentEmail] E
WHERE 0=0
--Research newsletter & CustomResearchNewsletters email types
  AND SentEmailTypeID IN (23,47)
--metadata needs to be not null for cross apply below to work
  AND MetaData IS NOT NULL
  
  )

--OpenJson function to extract to column and rows for each study/sitestudy
SELECT
 [SentEmailID]
,List.StudyID
,List.SiteStudyID
FROM Emails T
CROSS APPLY OPENJSON( [Metadata],'$.ReferralStudyIDs' )
WITH (
		StudyID int '$.StudyID',
		SiteStudyId int '$.SiteStudyID'
) as List
--limit to required studies for TA Engagment reporting
JOIN [scratch].[vw_StudyReporting] STU ON STU.StudyID=List.StudyID
WHERE 0=0
--extra check to ensure there is json in the metadata column
AND ISJSON(Metadata) > 0

GO
/****** Object:  View [scratch].[vw_SiteStudyReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [scratch].[vw_SiteStudyReporting] as 

SELECT
 SS.SiteStudyID
,SS.StudyID
,SS.SiteNumber
,SS.SiteName
,SS.SiteAddressLine1
,SS.SiteAddressLine2
,SS.SiteCity
,SS.SiteGoverningDistrict
,SS.SiteZip 
,SS.SiteCountryID 
,SS.CreatedBy 
,SS.IsDeleted
,SS.IsConnectEnabled
,SS.IsSoeEnabled
,SS.TimeZoneID
,SS.IsAeEnabled
,SS.MaxReferralDistance
,SS.IsMDReferralEnabledFinal as IsMDReferralEnabled
--,SS.GeoLocation
,SS.ReferringSpecialistCount
FROM cta.tblSiteStudy SS
JOIN [scratch].[vw_StudyReporting] S ON S.StudyID=SS.StudyID
WHERE 0=0
--SiteStudyBizRules
--AND SS.IsDeleted = 0
AND SS.SiteNumber <> '000'
GO
/****** Object:  View [scratch].[vw_OrganizationReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [scratch].[vw_OrganizationReporting] as 
--Organization Reporting for DS-43
SELECT
 OrganizationID
,Name
FROM cta.tblOrganization
WHERE 0=0
--Exclude ClinOne
AND OrganizationID <> 38
--Exclude Deleted Organizations
AND IsDeleted = 0
GO
/****** Object:  View [scratch].[vw_PatientRides]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [scratch].[vw_PatientRides] as


--Created for DS-64 Patient Ride Report
--Get the latest audit record for each ride
WITH LatestRow AS (
	SELECT SitePatientRideId, MAX(RequestDateTimeUtc) AS RequestDateTimeUtc 
	FROM ctc.SitePatientRide
	GROUP BY SitePatientRideId
)

SELECT
	 
	
	 A.[SitePatientRideId]
	,A.[SitePatientId]
	,A.[UberStatus]
	,A.[Duration]
	,A.[Distance]
	,A.[TotalFare]
	,A.[CurrencyCode]
	,A.[CreatedDate]
	,D.SponsorName AS Sponsor
	,D.ProtocolNumber AS Protocol
	,D.IsDeleted as StudyArchiveStatus
	,C.SiteName
	,C.SiteNumber
	,C.SiteCity
	,C.SiteZip
	,C.IsDeleted as SiteArchiveStatus
	,D.OrganizationID
	,O.Name as 'Organization'
	,C.SiteStudyID
	
FROM ctc.SitePatientRide A
--Limit to the latest record for each ride from cte above
JOIN LatestRow AA ON (AA.RequestDateTimeUtc=A.RequestDateTimeUTC AND AA.SitePatientRideId=A.SitePatientRideId)
LEFT JOIN ctc.SitePatient B ON (A.SitePatientId=B.SitePatientId)
LEFT JOIN cta.tblSiteStudy C ON (C.SiteGuid=B.SiteGuid AND C.SiteNumber <> '000') --Exclude MySite 
JOIN cta.tblStudy D ON (D.StudyID=C.StudyID)
LEFT JOIN cta.tblOrganization O on (O.OrganizationID = D.OrganizationID )
WHERE 1=1
AND A.IsDeleted = 0 --Exclude Deleted Rides
AND D.SponsorName <> 'ClinOne, Inc.' --Exclude ClinOne Data



GO
/****** Object:  View [scratch].[vw_SubjectStatusReporting]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--most current status per subject based on iscurrent
CREATE VIEW [scratch].[vw_SubjectStatusReporting] as 

SELECT DISTINCT
       S.StudySoeSubjectStatus 
	  ,SSS.IsDeleted as SubjectArchived
	  ,U.UserID
	  	  
  FROM [cta].[tblStudySoeSubjectStatusReason] R
  JOIN [cta].[lk_StudySoeSubjectStatusReasonType] T on T.StudySoeSubjectStatusReasonTypeID = R.StudySoeSubjectStatusReasonTypeID
  JOIN [cta].[lk_StudySoeSubjectStatus] S on S.StudySoeSubjectStatusID = T.StudySoeSubjectStatusTypeID
  JOIN [cta].tblStudySoeSubject SSS on SSS.StudySoeSubjectID = R.StudySoeSubjectID 
  JOIN [cta].tblSiteStudy SS on SS.SiteStudyID = SSS.SiteStudyID AND SS.SiteNumber <> '000' --Exclude MySite
  JOIN [cta].tblstudy D ON (D.StudyID=SS.StudyID)
  JOIN [ctc].SitePatient P on P.CtaStudySoeSubjectGuid = SSS.StudySoeSubjectGuid --This limiting join to about 2k subjects
  JOIN [ctc].[User] U on U.UserID = P.UserID
  WHERE 0=0
  --Current Subject Status Reason
  AND R.IsCurrent = 1
  --Exlcude Deleted Subject Status Reasons
  AND R.IsDeleted = 0
  --Exclude Demo Users
  AND u.IsDemo = 0
  --Exclude ClinOne SponsorNames
  AND D.SponsorName NOT LIKE '%ClinOne%' 
  --Exlcude Test sponsor
  AND D.sponsorname NOT LIKE '%test%' 
  --Exclude ClinOne Organization or allow null OrganizationIDs
  AND (D.OrganizationID NOT IN( 38) OR D.OrganizationID IS NULL)
  --Exclude Demo Studies
  AND D.IsDemo = 0
  

GO

/****** Object:  Table [cta].[tblSentEmailClickDetail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblSentEmailClickDetail]
(
	[SentEmailClickDetailID] [int] NOT NULL,
	[SentEmailID] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Url] [varchar](5000) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblSentEmailClickDetail ')
GO
/****** Object:  Table [cta].[tblsubscription]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [cta].[tblsubscription]
(
	[SubscriptionID] [int] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[SubscriptionTypeID] [int] NOT NULL,
	[IsSubscribedEmail] [bit] NOT NULL,
	[IsSubscribedMobile] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](256) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[SubscriptionFrequencyID] [int] NULL
)
WITH (DATA_SOURCE = [DbCtaDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'tblsubscription ')
GO
/****** Object:  Table [ctc].[AUDITSitePatientRide]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[AUDITSitePatientRide]
(
	[AUDITSitePatientRideId] [int] NOT NULL,
	[ChangeType] [char](1) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SitePatientRideId] [int] NOT NULL,
	[SitePatientId] [int] NOT NULL,
	[PatientRideTypeId] [int] NOT NULL,
	[UberStatus] [nvarchar](128) NOT NULL,
	[UberProductTypeId] [nvarchar](128) NOT NULL,
	[RequestDateTimeUtc] [datetime] NOT NULL,
	[BeginDateTimeUtc] [datetime] NULL,
	[DropoffDateTimeUtc] [datetime] NULL,
	[ScheduledDateTimeUtc] [datetime] NOT NULL,
	[RideEstimateCurrencyCode] [nvarchar](36) NULL,
	[RideEstimateHighEstimate] [int] NULL,
	[RideEstimateLowEstimate] [int] NULL,
	[RideEstimateDistance] [float] NOT NULL,
	[RideEstimateDistanceUnit] [nvarchar](36) NOT NULL,
	[RideEstimateDurationSeconds] [int] NOT NULL,
	[RideEstimateDisplayEstimate] [nvarchar](255) NOT NULL,
	[RideEstimateValue] [float] NULL,
	[PickUpCountryId] [bigint] NOT NULL,
	[DropOffCountryId] [bigint] NOT NULL,
	[Duration] [float] NULL,
	[Distance] [float] NULL,
	[Subtotal] [float] NULL,
	[TotalFare] [float] NULL,
	[TotalOwed] [float] NULL,
	[CurrencyCode] [nvarchar](16) NULL,
	[SurgeName] [nvarchar](255) NULL,
	[SurgeAmount] [float] NULL,
	[SurgeMultiplier] [float] NULL,
	[DistanceLabel] [nvarchar](36) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](128) NOT NULL,
	[ModifiedBy] [nvarchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RiderInitiatedRide] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'AUDITSitePatientRide ')
GO
/****** Object:  Table [ctc].[lk_UserRoleType]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[lk_UserRoleType]
(
	[UserRoleTypeId] [int] NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'lk_UserRoleType')
GO
/****** Object:  Table [ctc].[PatientDocument]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[PatientDocument]
(
	[PatientDocumentId] [int] NOT NULL,
	[PatientDocumentTypeId] [int] NOT NULL,
	[SitePatientId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[FileStoreGuid] [nvarchar](128) NOT NULL,
	[FromSitePatient] [bit] NOT NULL,
	[FileExtensionId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'PatientDocument')
GO
/****** Object:  Table [ctc].[PatientDocumentView]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[PatientDocumentView]
(
	[PatientDocumentViewId] [int] NOT NULL,
	[PatientDocumentId] [int] NOT NULL,
	[CreatedDateUtc] [datetime] NOT NULL,
	[CreatedBy] [varchar](128) NOT NULL,
	[ModifiedDateUtc] [datetime] NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserSessionId] [int] NOT NULL,
	[ReferralPath] [varchar](2083) NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'log',OBJECT_NAME = N'PatientDocumentView')
GO
/****** Object:  Table [ctc].[Referral]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE EXTERNAL TABLE [ctc].[Referral]
(
	[ReferralId] [bigint] NOT NULL,
	[ReferralEmail] [varchar](225) NOT NULL,
	[CreatedBy] [nvarchar](128) NULL,
	[Deleted] [bit] NOT NULL,
	[ReferralDate] [datetime] NOT NULL,
	[ReferredUserId] [nvarchar](128) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](128) NOT NULL,
	[SiteGuid] [uniqueidentifier] NOT NULL,
	[CanViewPatientDocuments] [bit] NOT NULL,
	[CanViewCalendar] [bit] NOT NULL,
	[CanViewSecureMessaging] [bit] NOT NULL,
	[CanViewRideShare] [bit] NOT NULL,
	[CanViewQuestionaire] [bit] NOT NULL,
	[CanViewDosing] [bit] NOT NULL,
	[CanViewVoice] [bit] NOT NULL
)
WITH (DATA_SOURCE = [DbCtcDataSource],SCHEMA_NAME = N'dbo',OBJECT_NAME = N'Referral')
GO
/****** Object:  Table [scratch].[BotActivityLogic]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scratch].[BotActivityLogic](
	[SentEmailID] [int] NULL,
	[EmailSentDateTime] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[NonStudyURLsClicked] [int] NULL,
	[StudyURLsClicked] [int] NULL,
	[PossibleBot] [bit] NULL,
	[FirstClick] [datetime] NULL,
	[LastClick] [datetime] NULL,
	[DurationBetweenEmailSentandFirstClickSeconds] [int] NULL,
	[DurationBetweenFirstClickLastClickSeconds] [int] NULL,
	[ReferStudyViewID] [int] NULL,
	[Study View Created] [datetime] NULL,
	[StudyID] [int] NULL,
	[UserSessionID] [int] NULL,
	[SessionDateTime] [datetime] NULL,
	[SentEmails] [int] NULL,
	[LikelyBot] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [scratch].[EmailStudyBridge]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scratch].[EmailStudyBridge](
	[SentEmailID] [int] NOT NULL,
	[StudyID] [int] NOT NULL,
	[SiteStudyID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [scratch].[storedProclog]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [scratch].[storedProclog](
	[StoredProcName] [varchar](100) NOT NULL,
	[Rows] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TEST].[BotActivityLogic]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[BotActivityLogic](
	[SentEmailID] [int] NULL,
	[EmailSentDateTime] [datetime] NULL,
	[Email] [varchar](100) NULL,
	[NonStudyURLsClicked] [int] NULL,
	[StudyURLsClicked] [int] NULL,
	[PossibleBot] [bit] NULL,
	[FirstClick] [datetime] NULL,
	[LastClick] [datetime] NULL,
	[DurationBetweenEmailSentandFirstClickSeconds] [int] NULL,
	[DurationBetweenFirstClickLastClickSeconds] [int] NULL,
	[ReferStudyViewID] [int] NULL,
	[Study View Created] [datetime] NULL,
	[StudyID] [int] NULL,
	[UserSessionID] [int] NULL,
	[SessionDateTime] [datetime] NULL,
	[SentEmails] [int] NULL,
	[LikelyBot] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TEST].[EmailStudyBridge]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[EmailStudyBridge](
	[SentEmailID] [int] NOT NULL,
	[StudyID] [int] NOT NULL,
	[SiteStudyID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TEST].[storedProclog]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TEST].[storedProclog](
	[StoredProcName] [varchar](100) NOT NULL,
	[Rows] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [scratch].[ETLBotActivityLogic]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [scratch].[ETLBotActivityLogic]
--Load bot activity logic form view to table to improve performance
--DS-55

AS
BEGIN

--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Truncate and full load table
TRUNCATE TABLE [scratch].[BotActivityLogic];

--Insert to table
INSERT INTO scratch.BotActivityLogic
SELECT [SentEmailID]
      ,[EmailSentDateTime]
      ,[Email]
      ,[NonStudyURLsClicked]
      ,[StudyURLsClicked]
      ,[PossibleBot]
      ,[FirstClick]
      ,[LastClick]
      ,[DurationBetweenEmailSentandFirstClickSeconds]
      ,[DurationBetweenFirstClickLastClickSeconds]
      ,[ReferStudyViewID]
      ,[Study View Created]
      ,[StudyID]
      ,[UserSessionID]
      ,[SessionDateTime]
	  ,[SentEmails]
      ,[LikelyBot]
  FROM [scratch].[vw_BotActivityLogic];

--insert rowcount to log table  
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.ETLBotActivityLogic' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END


GO
/****** Object:  StoredProcedure [scratch].[ETLEmailReportingClickDetailIncremental]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [scratch].[ETLEmailReportingClickDetailIncremental]

--Incremental Load of Email Clicks for Bot Activity
--Inserts to analytics db from external table source from ctc
--Runs daily via scheduled Power Automate flow
AS
BEGIN
--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Select the max modified datetime from the local table 
--to insert or update every record from the external table occuring after that modified datetime
DECLARE @MostrecentClickModifiedDateTime  Datetime
SET @MostrecentClickModifiedDateTime = (SELECT MAX(ModifiedDateUtc) as MostrecentsentemailDateTime FROM [scratch].[tblSentEmailClickDetail]);

WITH SOURCE AS (
SELECT --top 10
	   C.[SentEmailClickDetailID]
      ,C.[SentEmailID]
      ,C.[CreatedDateUtc]
      ,C.[IsDeleted]
      ,C.[Url]
      ,C.[ModifiedDateUtc]
      ,C.[ModifiedBy]
      ,C.[CreatedBy]
FROM [cta].tblSentEmailClickDetail C 
JOIN [cta].[tblSentEmail] E on E.SentEmailID = C.SentEmailID
WHERE 0=0
--Only get recently modified/new records
AND E.ModifiedDate > @MostrecentClickModifiedDateTime
--Research newsletter & CustomResearchNewsletters
	AND SentEmailTypeID IN (23,47)
	AND E.ToEmailAddress NOT LIKE '%Clinone%'
	AND E.ToEmailAddress NOT LIKE '%demo%'
)
MERGE [Scratch].[TblSentEmailClickDetail] AS TARGET

USING SOURCE
	ON TARGET.[SentEmailClickDetailID] = SOURCE.[SentEmailClickDetailID]

WHEN MATCHED 
	AND SOURCE.ModifiedDateUTC <> TARGET.ModifiedDateUTC
THEN UPDATE SET
	 TARGET.[SentEmailClickDetailID] = SOURCE.[SentEmailClickDetailID]
	,TARGET.[SentEmailID] = SOURCE.[SentEmailID]
	,TARGET.[CreatedDateUtc] = SOURCE.[CreatedDateUtc]
	,TARGET.[IsDeleted] = SOURCE.[IsDeleted]
	,TARGET.[Url] = SOURCE.[Url]
	,TARGET.[ModifiedDateUtc] = SOURCE.[ModifiedDateUtc]
	,TARGET.[ModifiedBy] = SOURCE.[ModifiedBy]
	,TARGET.[CreatedBy] = SOURCE.[CreatedBy]

WHEN NOT MATCHED BY TARGET
THEN INSERT (
		 [SentEmailClickDetailID]
		,[SentEmailID]
		,[CreatedDateUtc]
		,[IsDeleted]
		,[Url]
		,[ModifiedDateUtc]
		,[ModifiedBy]
		,[CreatedBy]
		   )
	VALUES (
	
	 SOURCE.[SentEmailClickDetailID]
	,SOURCE.[SentEmailID]
	,SOURCE.[CreatedDateUtc]
	,SOURCE.[IsDeleted]
	,SOURCE.[Url]
	,SOURCE.[ModifiedDateUtc]
	,SOURCE.[ModifiedBy]
	,SOURCE.[CreatedBy] );



  
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.ETLEmailReportingClickDetailIncremental' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [scratch].[ETLEmailReportingTA]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [scratch].[ETLEmailReportingTA]
--Full load of Email reporting for TA
--Inserts to analytics db from external table source from ctc
AS
BEGIN

DECLARE @ST as DATETIME = GETDATE()
TRUNCATE TABLE [scratch].[EmailReportingTA];

WITH B as (SELECT DISTINCT SentemailID FROM scratch.vw_EmailBridgeTable)


,DistinctSpecialistEmails as (
SELECT 
DISTINCT	 
	 LOWER(S.Email)			AS Email		  
FROM [cta].[tblReferringSpecialist] S 
LEFT JOIN [cta].[tblReferringSpecialistTag] T ON (T.ReferringSpecialistID=S.ReferringSpecialistID AND T.IsDeleted=0)
JOIN [cta].[tblSpecialistTag] ST ON (ST.SpecialistTagID=T.SpecialistTagID)
JOIN [cta].tblReferringSpecialistAddress A on A.ReferringSpecialistID = S.ReferringSpecialistID
WHERE 0=0
--Exclude demo & Non production specialists
	AND SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) NOT LIKE '%ClinOne%' --Exlcude ClinOne Emails
	AND S.FirstName NOT LIKE '%ClinOne%' --Exclude ClinOne names
	AND ST.IsSpecialty=1 --Include Specialites Only
	AND ST.IsDeleted = 0 --Exclude Deleted Specialties
	AND ST.Tag NOT LIKE '%demo%' --Exclude demo Tags
	AND ST.Tag NOT LIKE '%Clinone%' --exclude ClinOne tags
	AND A.IsPrimary = 1 --Primary Addresses Only
	AND A.IsDeleted = 0 --Exclude Deleted Addresses
	
)

INSERT INTO [scratch].[EmailReportingTA]
           ([SentEmailID]
		   ,[Email]
           ,[SentEmailTypeID]
           ,[WasSuccessful]
           ,[CreatedDate]
           ,[IsDeleted]
           ,[OpenedCount]
           ,[ClickedCount]
           ,[IsBounced]
           ,[IsMarkedSpam]
           ,[IsUnsubscribed]
		   ,ModifiedDate)

	
SELECT 
	   E.[SentEmailID]
	  ,S.[Email]
	  ,E.[SentEmailTypeID]
      ,E.[WasSuccessful]
      ,E.[CreatedDate]
      ,E.[IsDeleted]
      ,E.[OpenedCount]
      ,E.[ClickedCount]
      ,E.[IsBounced]
      ,E.[IsMarkedSpam]
      ,E.[IsUnsubscribed]
	  ,E.ModifiedDate
FROM [cta].[tblSentEmail] E
JOIN DistinctSpecialistEmails S on S.Email = E.ToEmailAddress
JOIN  B on B.SentEmailID = E.SentEmailID
WHERE 0=0
--Research newsletter & CustomResearchNewsletters
  AND SentEmailTypeID IN (23,47)
  --Last 400 Days
  --AND CAST(E.CreatedDate as date) >= CAST(DATEADD( DAY , -400, GETDATE() ) as date)
  
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.EmailReportingTA' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [scratch].[ETLEmailReportingTAIncremental]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [scratch].[ETLEmailReportingTAIncremental]

--Incremental Load of Email dataset for Trial Awareness Engagement
--Inserts to analytics db from external table source from ctc
--Runs daily via scheduled Power Automate flow
AS
BEGIN
--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Select the max modified datetime from the local table 
--to insert or update every record from the external table occuring after that modified datetime
DECLARE @MostrecentsentemailDateTime  Datetime
SET @MostrecentsentemailDateTime = (SELECT MAX(ModifiedDate) as MostrecentsentemailDateTime FROM [scratch].[EmailReportingTA]);

WITH DistinctSpecialistEmails as (
SELECT 
DISTINCT	 
	 LOWER(S.Email)			AS Email		  
FROM [cta].[tblReferringSpecialist] S 
LEFT JOIN [cta].[tblReferringSpecialistTag] T ON (T.ReferringSpecialistID=S.ReferringSpecialistID AND T.IsDeleted=0)
JOIN [cta].[tblSpecialistTag] ST ON (ST.SpecialistTagID=T.SpecialistTagID)
JOIN [cta].tblReferringSpecialistAddress A on A.ReferringSpecialistID = S.ReferringSpecialistID
WHERE 0=0
--Exclude demo & Non production specialists
	AND SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) NOT LIKE '%ClinOne%' --Exlcude ClinOne Emails
	AND S.FirstName NOT LIKE '%ClinOne%' --Exclude ClinOne names
	AND ST.IsSpecialty=1 --Include Specialites Only
	AND ST.IsDeleted = 0 --Exclude Deleted Specialties
	AND ST.Tag NOT LIKE '%demo%' --Exclude demo Tags
	AND ST.Tag NOT LIKE '%Clinone%' --exclude ClinOne tags
	AND A.IsPrimary = 1 --Primary Addresses Only
	AND A.IsDeleted = 0 --Exclude Deleted Addresses	
)

,SOURCE AS (
SELECT 
	   E.[SentEmailID]
	  ,S.[Email]
      ,E.[WasSuccessful]
      ,E.[CreatedDate]
      ,E.[IsDeleted]
      ,E.[OpenedCount]
      ,E.[ClickedCount]
      ,E.[IsBounced]
      ,E.[IsMarkedSpam]
      ,E.[IsUnsubscribed]
	  ,E.ModifiedDate
FROM [cta].[tblSentEmail] E
JOIN DistinctSpecialistEmails S on S.Email = E.ToEmailAddress
WHERE 0=0
--Only get recently modified/new records
	AND E.ModifiedDate > @MostrecentsentemailDateTime
--Research newsletter & CustomResearchNewsletters
	AND SentEmailTypeID IN (23,47)
	AND E.ToEmailAddress NOT LIKE '%Clinone%'
	AND E.ToEmailAddress NOT LIKE '%demo%'
)
MERGE [scratch].[EmailReportingTA] AS TARGET

USING SOURCE
	ON TARGET.SentEmailID = SOURCE.SentEmailID

WHEN MATCHED 
	AND SOURCE.ModifiedDate <> TARGET.ModifiedDate
THEN UPDATE SET
	 TARGET.Email = SOURCE.Email
	,TARGET.[WasSuccessful] = SOURCE.[WasSuccessful]
	,TARGET.[CreatedDate] = SOURCE.[CreatedDate]
	,TARGET.[IsDeleted] = SOURCE.[IsDeleted]
	,TARGET.[OpenedCount] = SOURCE.[OpenedCount]
	,TARGET.[ClickedCount] = SOURCE.[ClickedCount]
	,TARGET.[IsBounced] = SOURCE.[IsBounced]
	,TARGET.[IsMarkedSpam] = SOURCE.[IsMarkedSpam]
	,TARGET.[IsUnsubscribed] = SOURCE.[IsUnsubscribed]
	,TARGET.ModifiedDate = SOURCE.ModifiedDate


WHEN NOT MATCHED BY TARGET
THEN INSERT (
            [SentEmailID]
           ,[Email]
           ,[WasSuccessful]
           ,[CreatedDate]
           ,[IsDeleted]
           ,[OpenedCount]
           ,[ClickedCount]
           ,[IsBounced]
           ,[IsMarkedSpam]
           ,[IsUnsubscribed]
		   ,ModifiedDate
		   )
	VALUES (
	SOURCE.[SentEmailID]
           ,SOURCE.[Email]
           ,SOURCE.[WasSuccessful]
           ,SOURCE.[CreatedDate]
           ,SOURCE.[IsDeleted]
           ,SOURCE.[OpenedCount]
           ,SOURCE.[ClickedCount]
           ,SOURCE.[IsBounced]
           ,SOURCE.[IsMarkedSpam]
           ,SOURCE.[IsUnsubscribed]
		   ,SOURCE.ModifiedDate );



 --Create Record in Log Table with start time, end time, and rowcount
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.EmailReportingTAIncremental' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [scratch].[ETLEmailStudyBridgeIncremental]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [scratch].[ETLEmailStudyBridgeIncremental]

--Incremental Load of Email Study bridge View to Table
--Inserts to analytics db from external table source from ctc
--Runs daily via scheduled Power Automate flow
AS
BEGIN
--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Select the max SentEmailID from EmailStudyBridge
--to insert or update every record from the Bridge Table based on sentemailid
DECLARE @MostrecentsentemailID  INT
SET @MostrecentsentemailID = (SELECT MAX(SentEmailID) as MostrecentsentemailID FROM [scratch].[EmailStudyBridge]);



WITH SOURCE AS (

SELECT
 [SentEmailID]
,[StudyID]
--Custom Newsletters do not have a SiteStudyID, replace the null values with -1
,ISNULL([SiteStudyID], -1 ) as [SiteStudyID]
FROM [scratch].[vw_EmailBridgeTable]
WHERE 0=0
--Only load emails greater than the most recent one in the table
AND SentEmailID > @MostrecentsentemailID

)

MERGE [scratch].[EmailStudyBridge] AS TARGET

USING SOURCE
	ON TARGET.SentEmailID = SOURCE.SentEmailID

WHEN MATCHED 
	AND SOURCE.[StudyID] <> TARGET.[StudyID]
THEN UPDATE SET
	 TARGET.[StudyID] = SOURCE.[StudyID]
	,TARGET.[SiteStudyID] = SOURCE.[SiteStudyID]
	
WHEN NOT MATCHED BY TARGET
THEN INSERT (
            [SentEmailID]
		   ,[StudyID]
	      ,[SiteStudyID]
		   )
	VALUES (
	SOURCE.[SentEmailID]
           ,SOURCE.[StudyID]
           ,SOURCE.[SiteStudyID] );



 --Create Record in Log Table with start time, end time, and rowcount
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.EmailBridgeTableIncremental' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [scratch].[ETLLandingPageEvents]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [scratch].[ETLLandingPageEvents]
--Load data from view to table for performance and format for reporting

AS
BEGIN
--use for ETL logging
DECLARE @ST as DATETIME = GETDATE()
--truncate records and do full load
TRUNCATE TABLE [dbo].[LandingPageEvents];

INSERT INTO [dbo].[LandingPageEvents]

SELECT 
	 [EventID]
	,[EventType]
	,[CreatedDateUTC]
	,[CreatedBy]
	,[IsDeleted]
	,[StudyID]
	,[ReferringSpecialistID]
	,[DocumentVersionID]
	,[UserSessionID]
	,[ViewedPercentage]
	,[StudyWistiaProjectID]
FROM [scratch].[vw_LandingPageActivities]

--Create record with rowcount and start and end time
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.ETLLandingPageEvents' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [scratch].[ETLSentEmailsPerStudyPerEmail]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [scratch].[ETLSentEmailsPerStudyPerEmail]
--Load data from view to table for performance and format for reporting

AS
BEGIN
--use for ETL logging
DECLARE @ST as DATETIME = GETDATE()
--truncate records and do full load
TRUNCATE TABLE [scratch].[SentEmailsPerStudyPerEmail];

INSERT INTO [scratch].[SentEmailsPerStudyPerEmail]
--Insert all TA Emails sent to each email address per study
SELECT
	 E.Email
	,T.StudyID
	,COUNT(E.SentEmailID) as SentEmails
FROM scratch.EmailReportingTA E 
JOIN scratch.EmailStudyBridge T on T.SentEmailID = E.SentEmailID 
WHERE 0=0
GROUP BY 
	 E.Email
	,T.StudyID

--Create record with rowcount and start and end time
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.ETLSentEmailsPerStudyPerEmail' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [scratch].[NEWEmailAggregate]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [scratch].[NEWEmailAggregate]
--Load data from view to table for performance and format for reporting

AS
BEGIN
--use for ETL logging
DECLARE @ST as DATETIME = GETDATE()
--truncate records and do full load


SELECT
	EB.SentEmailID,
    ER.Email,
    ER.CreatedDate,
    COUNT(CASE WHEN ER.OpenedCount > 0 THEN 1 END) AS [CountOpened],
    SUM(ER.ClickedCount) AS [CountClicked],
    EB.StudyID,
    EB.SiteStudyID
  FROM
    [scratch].[vw_EmailsReporting] ER
    LEFT JOIN [scratch].[vw_EmailBridgeTable] EB ON ER.SentEmailID = EB.SentEmailID
  --WHERE
    --ER.OpenedCount >= 0 AND ER.ClickedCount >= 0
  GROUP BY
    ER.Email,
    ER.CreatedDate,
    EB.StudyID,
    EB.SiteStudyID,
	EB.SentEmailID;

--Create record with rowcount and start and end time

SELECT 'Scratch.NEWEmailAggregate' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [TEST].[ETLBotActivityLogic]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [TEST].[ETLBotActivityLogic]
--Load bot activity logic form view to table to improve performance
--DS-55

AS
BEGIN

--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Truncate and full load table
TRUNCATE TABLE [Test].[BotActivityLogic];

--Insert to table
INSERT INTO Test.BotActivityLogic
SELECT [SentEmailID]
      ,[EmailSentDateTime]
      ,[Email]
      ,[NonStudyURLsClicked]
      ,[StudyURLsClicked]
      ,[PossibleBot]
      ,[FirstClick]
      ,[LastClick]
      ,[DurationBetweenEmailSentandFirstClickSeconds]
      ,[DurationBetweenFirstClickLastClickSeconds]
      ,[ReferStudyViewID]
      ,[Study View Created]
      ,[StudyID]
      ,[UserSessionID]
      ,[SessionDateTime]
	  ,[SentEmails]
      ,[LikelyBot]
  FROM [Test].[vw_BotActivityLogic];

--insert rowcount to log table  
INSERT INTO [Test].[StoredProcLog]
SELECT 'Test.ETLBotActivityLogic' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END


GO
/****** Object:  StoredProcedure [TEST].[ETLEmailReportingClickDetailIncremental]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [TEST].[ETLEmailReportingClickDetailIncremental]

--Incremental Load of Email Clicks for Bot Activity
--Inserts to analytics db from external table source from ctc
--Runs daily via scheduled Power Automate flow
AS
BEGIN
--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Select the max modified datetime from the local table 
--to insert or update every record from the external table occuring after that modified datetime
DECLARE @MostrecentClickModifiedDateTime  Datetime
SET @MostrecentClickModifiedDateTime = (SELECT MAX(ModifiedDateUtc) as MostrecentsentemailDateTime FROM [TEST].[tblSentEmailClickDetail]);

WITH SOURCE AS (
SELECT --top 10
	   C.[SentEmailClickDetailID]
      ,C.[SentEmailID]
      ,C.[CreatedDateUtc]
      ,C.[IsDeleted]
      ,C.[Url]
      ,C.[ModifiedDateUtc]
      ,C.[ModifiedBy]
      ,C.[CreatedBy]
FROM [cta].tblSentEmailClickDetail C 
JOIN [cta].[tblSentEmail] E on E.SentEmailID = C.SentEmailID
WHERE 0=0
--Only get recently modified/new records
AND E.ModifiedDate > @MostrecentClickModifiedDateTime
--Research newsletter & CustomResearchNewsletters
	AND SentEmailTypeID IN (23,47)
	AND E.ToEmailAddress NOT LIKE '%Clinone%'
	AND E.ToEmailAddress NOT LIKE '%demo%'
)
MERGE [TEST].[TblSentEmailClickDetail] AS TARGET

USING SOURCE
	ON TARGET.[SentEmailClickDetailID] = SOURCE.[SentEmailClickDetailID]

WHEN MATCHED 
	AND SOURCE.ModifiedDateUTC <> TARGET.ModifiedDateUTC
THEN UPDATE SET
	 TARGET.[SentEmailClickDetailID] = SOURCE.[SentEmailClickDetailID]
	,TARGET.[SentEmailID] = SOURCE.[SentEmailID]
	,TARGET.[CreatedDateUtc] = SOURCE.[CreatedDateUtc]
	,TARGET.[IsDeleted] = SOURCE.[IsDeleted]
	,TARGET.[Url] = SOURCE.[Url]
	,TARGET.[ModifiedDateUtc] = SOURCE.[ModifiedDateUtc]
	,TARGET.[ModifiedBy] = SOURCE.[ModifiedBy]
	,TARGET.[CreatedBy] = SOURCE.[CreatedBy]

WHEN NOT MATCHED BY TARGET
THEN INSERT (
		 [SentEmailClickDetailID]
		,[SentEmailID]
		,[CreatedDateUtc]
		,[IsDeleted]
		,[Url]
		,[ModifiedDateUtc]
		,[ModifiedBy]
		,[CreatedBy]
		   )
	VALUES (
	
	 SOURCE.[SentEmailClickDetailID]
	,SOURCE.[SentEmailID]
	,SOURCE.[CreatedDateUtc]
	,SOURCE.[IsDeleted]
	,SOURCE.[Url]
	,SOURCE.[ModifiedDateUtc]
	,SOURCE.[ModifiedBy]
	,SOURCE.[CreatedBy] );



  
INSERT INTO [Scratch].[StoredProcLog]
SELECT 'Scratch.ETLEmailReportingClickDetailIncremental' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [TEST].[ETLEmailReportingTA]    Script Date: 10/19/2023 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [TEST].[ETLEmailReportingTA]
--Full load of Email reporting for TA
--Inserts to analytics db from external table source from ctc
AS
BEGIN

DECLARE @ST as DATETIME = GETDATE()
TRUNCATE TABLE [Test].[EmailReportingTA];

WITH B as (SELECT DISTINCT SentemailID FROM Test.vw_EmailBridgeTable)


,DistinctSpecialistEmails as (
SELECT 
DISTINCT	 
	 LOWER(S.Email)			AS Email		  
FROM [cta].[tblReferringSpecialist] S 
LEFT JOIN [cta].[tblReferringSpecialistTag] T ON (T.ReferringSpecialistID=S.ReferringSpecialistID AND T.IsDeleted=0)
JOIN [cta].[tblSpecialistTag] ST ON (ST.SpecialistTagID=T.SpecialistTagID)
JOIN [cta].tblReferringSpecialistAddress A on A.ReferringSpecialistID = S.ReferringSpecialistID
WHERE 0=0
--Exclude demo & Non production specialists
	AND SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) NOT LIKE '%ClinOne%' --Exlcude ClinOne Emails
	AND S.FirstName NOT LIKE '%ClinOne%' --Exclude ClinOne names
	AND ST.IsSpecialty=1 --Include Specialites Only
	AND ST.IsDeleted = 0 --Exclude Deleted Specialties
	AND ST.Tag NOT LIKE '%demo%' --Exclude demo Tags
	AND ST.Tag NOT LIKE '%Clinone%' --exclude ClinOne tags
	AND A.IsPrimary = 1 --Primary Addresses Only
	AND A.IsDeleted = 0 --Exclude Deleted Addresses
	
)

INSERT INTO [Test].[EmailReportingTA]
           ([SentEmailID]
		   ,[Email]
           ,[SentEmailTypeID]
           ,[WasSuccessful]
           ,[CreatedDate]
           ,[IsDeleted]
           ,[OpenedCount]
           ,[ClickedCount]
           ,[IsBounced]
           ,[IsMarkedSpam]
           ,[IsUnsubscribed]
		   ,ModifiedDate)

	
SELECT 
	   E.[SentEmailID]
	  ,S.[Email]
	  ,E.[SentEmailTypeID]
      ,E.[WasSuccessful]
      ,E.[CreatedDate]
      ,E.[IsDeleted]
      ,E.[OpenedCount]
      ,E.[ClickedCount]
      ,E.[IsBounced]
      ,E.[IsMarkedSpam]
      ,E.[IsUnsubscribed]
	  ,E.ModifiedDate
FROM [cta].[tblSentEmail] E
JOIN DistinctSpecialistEmails S on S.Email = E.ToEmailAddress
JOIN  B on B.SentEmailID = E.SentEmailID
WHERE 0=0
--Research newsletter & CustomResearchNewsletters
  AND SentEmailTypeID IN (23,47)
  --Last 400 Days
  --AND CAST(E.CreatedDate as date) >= CAST(DATEADD( DAY , -400, GETDATE() ) as date)
  
INSERT INTO [Test].[StoredProcLog]
SELECT 'Test.EmailReportingTA' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO
/****** Object:  StoredProcedure [TEST].[ETLEmailReportingTAIncremental]    Script Date: 10/19/2023 10:05:04 AM ******/
CREATE PROCEDURE [Test].[ETLEmailReportingTAIncremental]

--Incremental Load of Email dataset for Trial Awareness Engagement
--Inserts to analytics db from external table source from ctc
--Runs daily via scheduled Power Automate flow
AS
BEGIN
--CurrentDatetime used for logging purposes
DECLARE @ST as DATETIME = GETDATE()

--Select the max modified datetime from the local table 
--to insert or update every record from the external table occuring after that modified datetime
DECLARE @MostrecentsentemailDateTime  Datetime
SET @MostrecentsentemailDateTime = (SELECT MAX(ModifiedDate) as MostrecentsentemailDateTime FROM [Test].[EmailReportingTA]);

WITH DistinctSpecialistEmails as (
SELECT 
DISTINCT	 
	 LOWER(S.Email)			AS Email		  
FROM [cta].[tblReferringSpecialist] S 
LEFT JOIN [cta].[tblReferringSpecialistTag] T ON (T.ReferringSpecialistID=S.ReferringSpecialistID AND T.IsDeleted=0)
JOIN [cta].[tblSpecialistTag] ST ON (ST.SpecialistTagID=T.SpecialistTagID)
JOIN [cta].tblReferringSpecialistAddress A on A.ReferringSpecialistID = S.ReferringSpecialistID
WHERE 0=0
--Exclude demo & Non production specialists
	AND SUBSTRING (LOWER(S.Email), CHARINDEX( '@', LOWER(S.Email)) + 1, LEN(LOWER(S.Email))) NOT LIKE '%ClinOne%' --Exlcude ClinOne Emails
	AND S.FirstName NOT LIKE '%ClinOne%' --Exclude ClinOne names
	AND ST.IsSpecialty=1 --Include Specialites Only
	AND ST.IsDeleted = 0 --Exclude Deleted Specialties
	AND ST.Tag NOT LIKE '%demo%' --Exclude demo Tags
	AND ST.Tag NOT LIKE '%Clinone%' --exclude ClinOne tags
	AND A.IsPrimary = 1 --Primary Addresses Only
	AND A.IsDeleted = 0 --Exclude Deleted Addresses	
)

,SOURCE AS (
SELECT 
	   E.[SentEmailID]
	  ,S.[Email]
      ,E.[WasSuccessful]
      ,E.[CreatedDate]
      ,E.[IsDeleted]
      ,E.[OpenedCount]
      ,E.[ClickedCount]
      ,E.[IsBounced]
      ,E.[IsMarkedSpam]
      ,E.[IsUnsubscribed]
	  ,E.ModifiedDate
FROM [cta].[tblSentEmail] E
JOIN DistinctSpecialistEmails S on S.Email = E.ToEmailAddress
WHERE 0=0
--Only get recently modified/new records
	AND E.ModifiedDate > @MostrecentsentemailDateTime
--Research newsletter & CustomResearchNewsletters
	AND SentEmailTypeID IN (23,47)
	AND E.ToEmailAddress NOT LIKE '%Clinone%'
	AND E.ToEmailAddress NOT LIKE '%demo%'
)
MERGE [Test].[EmailReportingTA] AS TARGET

USING SOURCE
	ON TARGET.SentEmailID = SOURCE.SentEmailID

WHEN MATCHED 
	AND SOURCE.ModifiedDate <> TARGET.ModifiedDate
THEN UPDATE SET
	 TARGET.Email = SOURCE.Email
	,TARGET.[WasSuccessful] = SOURCE.[WasSuccessful]
	,TARGET.[CreatedDate] = SOURCE.[CreatedDate]
	,TARGET.[IsDeleted] = SOURCE.[IsDeleted]
	,TARGET.[OpenedCount] = SOURCE.[OpenedCount]
	,TARGET.[ClickedCount] = SOURCE.[ClickedCount]
	,TARGET.[IsBounced] = SOURCE.[IsBounced]
	,TARGET.[IsMarkedSpam] = SOURCE.[IsMarkedSpam]
	,TARGET.[IsUnsubscribed] = SOURCE.[IsUnsubscribed]
	,TARGET.ModifiedDate = SOURCE.ModifiedDate


WHEN NOT MATCHED BY TARGET
THEN INSERT (
            [SentEmailID]
           ,[Email]
           ,[WasSuccessful]
           ,[CreatedDate]
           ,[IsDeleted]
           ,[OpenedCount]
           ,[ClickedCount]
           ,[IsBounced]
           ,[IsMarkedSpam]
           ,[IsUnsubscribed]
		   ,ModifiedDate
		   )
	VALUES (
	SOURCE.[SentEmailID]
           ,SOURCE.[Email]
           ,SOURCE.[WasSuccessful]
           ,SOURCE.[CreatedDate]
           ,SOURCE.[IsDeleted]
           ,SOURCE.[OpenedCount]
           ,SOURCE.[ClickedCount]
           ,SOURCE.[IsBounced]
           ,SOURCE.[IsMarkedSpam]
           ,SOURCE.[IsUnsubscribed]
		   ,SOURCE.ModifiedDate );



 --Create Record in Log Table with start time, end time, and rowcount
INSERT INTO [Test].[StoredProcLog]
SELECT 'Test.EmailReportingTAIncremental' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime
END
GO


CREATE PROCEDURE [TEST].[ETLEmailStudyBridgeIncremental]
AS
BEGIN
    -- CurrentDatetime used for logging purposes
    DECLARE @ST AS DATETIME = GETDATE();

    -- Select the max SentEmailID from EmailStudyBridge
    -- to insert or update every record from the Bridge Table based on sentemailid
    DECLARE @MostRecentSentEmailID INT;
    SELECT @MostRecentSentEmailID = MAX(SentEmailID) FROM [Test].[EmailStudyBridge];

    WITH SOURCE AS
    (
        SELECT
            [SentEmailID],
            [StudyID],
            ISNULL([SiteStudyID], -1) AS [SiteStudyID]
        FROM [Test].[vw_EmailBridgeTable]
        WHERE SentEmailID > @MostRecentSentEmailID
    )

    MERGE [Test].[EmailStudyBridge] AS TARGET
    USING SOURCE ON TARGET.SentEmailID = SOURCE.SentEmailID
    WHEN MATCHED AND (SOURCE.[StudyID] <> TARGET.[StudyID] OR SOURCE.[SiteStudyID] <> TARGET.[SiteStudyID])
        THEN UPDATE SET
            TARGET.[StudyID] = SOURCE.[StudyID],
            TARGET.[SiteStudyID] = SOURCE.[SiteStudyID]
    WHEN NOT MATCHED BY TARGET
        THEN INSERT (
            [SentEmailID],
            [StudyID],
            [SiteStudyID]
        )
        VALUES (
            SOURCE.[SentEmailID],
            SOURCE.[StudyID],
            SOURCE.[SiteStudyID]
        );

    -- Create Record in Log Table with start time, end time, and rowcount
    INSERT INTO [Test].[StoredProcLog]
    SELECT 'Test.EmailBridgeTableIncremental' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime, GETDATE() as EndTime;
END
GO


CREATE PROCEDURE [TEST].[ETLLandingPageEvents]
--Load data from view to table for performance and format for reporting

AS
BEGIN
--use for ETL logging
DECLARE @ST as DATETIME = GETDATE()
--truncate records and do full load
TRUNCATE TABLE [TEST].[LandingPageEvents];

INSERT INTO [TEST].[LandingPageEvents]

SELECT 
	 [EventID]
	,[EventType]
	,[CreatedDateUTC]
	,[CreatedBy]
	,[IsDeleted]
	,[StudyID]
	,[ReferringSpecialistID]
	,[DocumentVersionID]
	,[UserSessionID]
	,[ViewedPercentage]
	,[StudyWistiaProjectID]
FROM [TEST].[vw_LandingPageActivities]

--Create record with rowcount and start and end time
INSERT INTO [TEST].[StoredProcLog]
SELECT 'Test.ETLLandingPageEvents' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime , GETDATE() as EndTime
END
GO


CREATE PROCEDURE [TEST].[ETLSentEmailsPerStudyPerEmail]
--Load data from view to table for performance and format for reporting

AS
BEGIN
--use for ETL logging
DECLARE @ST as DATETIME = GETDATE()
--truncate records and do full load
TRUNCATE TABLE [Test].[SentEmailsPerStudyPerEmail];

INSERT INTO [Test].[SentEmailsPerStudyPerEmail]
--Insert all TA Emails sent to each email address per study
SELECT
	 E.Email
	,T.StudyID
	,COUNT(E.SentEmailID) as SentEmails
FROM Test.EmailReportingTA E 
JOIN Test.EmailStudyBridge T on T.SentEmailID = E.SentEmailID 
WHERE 0=0
GROUP BY 
	 E.Email
	,T.StudyID

--Create record with rowcount and start and end time
INSERT INTO [Test].[StoredProcLog]
SELECT 'Test.ETLSentEmailsPerStudyPerEmail' as StoredProcName, @@ROWCOUNT as [Rows], @ST as StartTime , GETDATE() as EndTime
END
GO

