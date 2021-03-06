USE [master]
GO
/****** Object:  Database [educationaryleap]    Script Date: 2/13/2018 6:44:50 PM ******/
CREATE DATABASE [educationaryleap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'educationaryleap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\educationaryleap.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'educationaryleap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\educationaryleap_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [educationaryleap] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [educationaryleap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [educationaryleap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [educationaryleap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [educationaryleap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [educationaryleap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [educationaryleap] SET ARITHABORT OFF 
GO
ALTER DATABASE [educationaryleap] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [educationaryleap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [educationaryleap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [educationaryleap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [educationaryleap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [educationaryleap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [educationaryleap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [educationaryleap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [educationaryleap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [educationaryleap] SET  ENABLE_BROKER 
GO
ALTER DATABASE [educationaryleap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [educationaryleap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [educationaryleap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [educationaryleap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [educationaryleap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [educationaryleap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [educationaryleap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [educationaryleap] SET RECOVERY FULL 
GO
ALTER DATABASE [educationaryleap] SET  MULTI_USER 
GO
ALTER DATABASE [educationaryleap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [educationaryleap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [educationaryleap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [educationaryleap] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [educationaryleap] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'educationaryleap', N'ON'
GO
ALTER DATABASE [educationaryleap] SET QUERY_STORE = OFF
GO
USE [educationaryleap]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [educationaryleap]
GO
/****** Object:  Table [dbo].[achivementTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[achivementTable](
	[AchivementID] [int] NOT NULL,
	[AchivementName] [varchar](45) NULL,
	[AchivementDescription] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[AchivementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[applicationStateTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicationStateTable](
	[ThemeID] [int] NOT NULL,
	[ThemeData] [varchar](45) NULL,
	[ThemeDecription] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[ThemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[collegeClassTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collegeClassTable](
	[ClassID] [int] NOT NULL,
	[ClassName] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[communityTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[communityTable](
	[CommunityID] [int] NOT NULL,
	[CommunityName] [varchar](45) NULL,
	[Address] [varchar](45) NULL,
	[ContactEmail] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommunityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[logTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logTable](
	[LogID] [int] NOT NULL,
	[LogDetails] [varchar](45) NULL,
	[LogDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[opportunitytable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opportunitytable](
	[OpportunityID] [int] NOT NULL,
	[Title] [varchar](45) NULL,
	[Description] [varchar](45) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ClassID] [int] NULL,
	[TotalSeats] [int] NULL,
	[OwnerID] [int] NULL,
	[StatusID] [int] NULL,
	[Notes] [varchar](1) NULL,
	[Pay] [decimal](2, 0) NULL,
	[Donation] [decimal](2, 0) NULL,
	[IsPaid] [binary](2) NULL,
	[IsServiceLearining] [binary](2) NULL,
	[IsRecurrent] [binary](2) NULL,
	[IsVirtual] [binary](2) NULL,
	[Duration] [int] NULL,
	[TimePeriodStart] [datetime] NULL,
	[TimePeriodEnd] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OpportunityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[persontable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persontable](
	[PersonID] [int] NOT NULL,
	[RoleID] [int] NULL,
	[Username] [varchar](45) NULL,
	[Email] [varchar](45) NULL,
	[Phone] [varchar](45) NULL,
	[ThemeID] [int] NULL,
	[PicID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[picsTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[picsTable](
	[PicID] [int] NOT NULL,
	[PicURL] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[PicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roleTable]    Script Date: 2/13/2018 6:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roleTable](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](45) NULL,
	[RoleDescription] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[achivementTable] ADD  DEFAULT (NULL) FOR [AchivementName]
GO
ALTER TABLE [dbo].[achivementTable] ADD  DEFAULT (NULL) FOR [AchivementDescription]
GO
ALTER TABLE [dbo].[applicationStateTable] ADD  DEFAULT (NULL) FOR [ThemeData]
GO
ALTER TABLE [dbo].[applicationStateTable] ADD  DEFAULT (NULL) FOR [ThemeDecription]
GO
ALTER TABLE [dbo].[collegeClassTable] ADD  DEFAULT (NULL) FOR [ClassName]
GO
ALTER TABLE [dbo].[communityTable] ADD  DEFAULT (NULL) FOR [CommunityName]
GO
ALTER TABLE [dbo].[communityTable] ADD  DEFAULT (NULL) FOR [Address]
GO
ALTER TABLE [dbo].[communityTable] ADD  DEFAULT (NULL) FOR [ContactEmail]
GO
ALTER TABLE [dbo].[logTable] ADD  DEFAULT (NULL) FOR [LogDetails]
GO
ALTER TABLE [dbo].[logTable] ADD  DEFAULT (NULL) FOR [LogDate]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [Title]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [Description]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [StartDate]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [CreateDate]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [ClassID]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [TotalSeats]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [OwnerID]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [StatusID]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [Notes]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [Pay]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [Donation]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [IsPaid]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [IsServiceLearining]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [IsRecurrent]
GO
ALTER TABLE [dbo].[opportunitytable] ADD  DEFAULT (NULL) FOR [IsVirtual]
GO
ALTER TABLE [dbo].[persontable] ADD  DEFAULT (NULL) FOR [RoleID]
GO
ALTER TABLE [dbo].[persontable] ADD  DEFAULT (NULL) FOR [Username]
GO
ALTER TABLE [dbo].[persontable] ADD  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[persontable] ADD  DEFAULT (NULL) FOR [Phone]
GO
ALTER TABLE [dbo].[persontable] ADD  DEFAULT (NULL) FOR [ThemeID]
GO
ALTER TABLE [dbo].[persontable] ADD  DEFAULT (NULL) FOR [PicID]
GO
ALTER TABLE [dbo].[picsTable] ADD  DEFAULT (NULL) FOR [PicURL]
GO
ALTER TABLE [dbo].[roleTable] ADD  DEFAULT (NULL) FOR [RoleName]
GO
ALTER TABLE [dbo].[roleTable] ADD  DEFAULT (NULL) FOR [RoleDescription]
GO
ALTER TABLE [dbo].[opportunitytable]  WITH CHECK ADD  CONSTRAINT [ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[collegeClassTable] ([ClassID])
GO
ALTER TABLE [dbo].[opportunitytable] CHECK CONSTRAINT [ClassID]
GO
ALTER TABLE [dbo].[opportunitytable]  WITH CHECK ADD  CONSTRAINT [OwnerID] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[persontable] ([PersonID])
GO
ALTER TABLE [dbo].[opportunitytable] CHECK CONSTRAINT [OwnerID]
GO
ALTER TABLE [dbo].[persontable]  WITH CHECK ADD  CONSTRAINT [PicID] FOREIGN KEY([PicID])
REFERENCES [dbo].[picsTable] ([PicID])
GO
ALTER TABLE [dbo].[persontable] CHECK CONSTRAINT [PicID]
GO
ALTER TABLE [dbo].[persontable]  WITH CHECK ADD  CONSTRAINT [RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[roleTable] ([RoleID])
GO
ALTER TABLE [dbo].[persontable] CHECK CONSTRAINT [RoleID]
GO
ALTER TABLE [dbo].[persontable]  WITH CHECK ADD  CONSTRAINT [ThemeID] FOREIGN KEY([ThemeID])
REFERENCES [dbo].[applicationStateTable] ([ThemeID])
GO
ALTER TABLE [dbo].[persontable] CHECK CONSTRAINT [ThemeID]
GO
USE [master]
GO
ALTER DATABASE [educationaryleap] SET  READ_WRITE 
GO
