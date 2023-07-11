USE [master]
GO
/****** Object:  Database [SOW_Db]    Script Date: 22-06-2023 16:21:30 ******/
CREATE DATABASE [SOW_Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SOW_Db', FILENAME = N'C:\Databases\MSSQL16.MSSQLSERVER\MSSQL\DATA\SOW_Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SOW_Db_log', FILENAME = N'C:\Databases\MSSQL16.MSSQLSERVER\MSSQL\DATA\SOW_Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SOW_Db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SOW_Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SOW_Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SOW_Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SOW_Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SOW_Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SOW_Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [SOW_Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SOW_Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SOW_Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SOW_Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SOW_Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SOW_Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SOW_Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SOW_Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SOW_Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SOW_Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SOW_Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SOW_Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SOW_Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SOW_Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SOW_Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SOW_Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SOW_Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SOW_Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SOW_Db] SET  MULTI_USER 
GO
ALTER DATABASE [SOW_Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SOW_Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SOW_Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SOW_Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SOW_Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SOW_Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SOW_Db', N'ON'
GO
ALTER DATABASE [SOW_Db] SET QUERY_STORE = OFF
GO
USE [SOW_Db]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 22-06-2023 16:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[CandidateId] [int] IDENTITY(1,1) NOT NULL,
	[CandidateName] [nvarchar](100) NOT NULL,
	[MobileNo] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](20) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[EmailId] [nvarchar](100) NOT NULL,
	[Skills] [nvarchar](max) NULL,
	[Location] [nvarchar](100) NOT NULL,
	[Pincode] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[IsInternal] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Candidate] PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NULL,
	[RegionId] [int] NULL,
	[isDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DellManager]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DellManager](
	[DellManagerId] [int] IDENTITY(1,1) NOT NULL,
	[DellManagerName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DellManagerName] PRIMARY KEY CLUSTERED 
(
	[DellManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domain]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domain](
	[DomainId] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NULL,
	[RegionId] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[LoginPassword] [nvarchar](100) NOT NULL,
	[EmailId] [nvarchar](200) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Islock] [bit] NULL,
	[FailureAttempts] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[RecruiterId] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_RecruiterName] PRIMARY KEY CLUSTERED 
(
	[RecruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[Region] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleScreens]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleScreens](
	[RoleScreenId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ScreenId] [int] NOT NULL,
 CONSTRAINT [PK_RoleScreens] PRIMARY KEY CLUSTERED 
(
	[RoleScreenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Screens]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Screens](
	[ScreenId] [int] IDENTITY(1,1) NOT NULL,
	[ScreenName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Screens] PRIMARY KEY CLUSTERED 
(
	[ScreenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityAnswer]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityAnswer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[LoginId] [int] NULL,
	[QuestionId] [int] NULL,
	[Answer] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK2cols] UNIQUE NONCLUSTERED 
(
	[LoginId] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOW]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOW](
	[SowId] [int] IDENTITY(1,1) NOT NULL,
	[SoName] [nvarchar](100) NULL,
	[JRCode] [nvarchar](10) NULL,
	[RequestCreationDate] [datetime] NULL,
	[AccountId] [int] NOT NULL,
	[TechnologyId] [int] NOT NULL,
	[Role] [nvarchar](100) NULL,
	[LocationId] [int] NULL,
	[RegionId] [int] NOT NULL,
	[TargetOpenPositions] [int] NULL,
	[PositionsTobeClosed] [int] NULL,
	[USTPOCId] [int] NOT NULL,
	[RecruiterId] [int] NOT NULL,
	[USTTPMId] [int] NOT NULL,
	[DellManagerId] [int] NOT NULL,
	[StatusId] [int] NULL,
	[Band] [nvarchar](100) NULL,
	[ProjectId] [nvarchar](100) NULL,
	[AccountManager] [nvarchar](200) NULL,
	[ExternalResource] [nvarchar](100) NULL,
	[InternalResource] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SOW] PRIMARY KEY CLUSTERED 
(
	[SowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOWCandidate]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOWCandidate](
	[SOW_CandidateId] [int] IDENTITY(1,1) NOT NULL,
	[SowId] [int] NOT NULL,
	[CandidateId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SOWCandidate] PRIMARY KEY CLUSTERED 
(
	[SOW_CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](100) NULL,
	[IsDeleted] [bit] NOT NULL,
	[StatusType] [varchar](20) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Technology]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technology](
	[TechnologyId] [int] IDENTITY(1,1) NOT NULL,
	[TechnologyName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
	[DomainId] [int] NOT NULL,
 CONSTRAINT [PK__Technolo__705701585B3368AA] PRIMARY KEY CLUSTERED 
(
	[TechnologyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USTPOC]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USTPOC](
	[USTPOCId] [int] IDENTITY(1,1) NOT NULL,
	[USTPOCName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_USTPOCName] PRIMARY KEY CLUSTERED 
(
	[USTPOCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USTTPM]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USTTPM](
	[USTTPMId] [int] IDENTITY(1,1) NOT NULL,
	[USTTPMName] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_USTTPMName] PRIMARY KEY CLUSTERED 
(
	[USTTPMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Candidate] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[DellManager] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Domain] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Location] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Login] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Recruiter] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Region] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[SOW] ADD  CONSTRAINT [DF_SOW_USTTPMId]  DEFAULT ((0)) FOR [USTTPMId]
GO
ALTER TABLE [dbo].[SOW] ADD  CONSTRAINT [DF__SOW__isDeleted__4D5F7D71]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[SOWCandidate] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Status] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Technology] ADD  CONSTRAINT [DF__Technolog__isDel__5E8A0973]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[USTPOC] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[USTTPM] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_Candidate_Status]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Region]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Roles]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([PermissionId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Permission]
GO
ALTER TABLE [dbo].[RoleScreens]  WITH CHECK ADD  CONSTRAINT [FK_RoleScreens_Screens] FOREIGN KEY([ScreenId])
REFERENCES [dbo].[Screens] ([ScreenId])
GO
ALTER TABLE [dbo].[RoleScreens] CHECK CONSTRAINT [FK_RoleScreens_Screens]
GO
ALTER TABLE [dbo].[SecurityAnswer]  WITH CHECK ADD FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([LoginId])
GO
ALTER TABLE [dbo].[SecurityAnswer]  WITH CHECK ADD FOREIGN KEY([LoginId])
REFERENCES [dbo].[Login] ([LoginId])
GO
ALTER TABLE [dbo].[SecurityAnswer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[SecurityQuestion] ([QuestionId])
GO
ALTER TABLE [dbo].[SOW]  WITH CHECK ADD  CONSTRAINT [FK_SOW_DellManager] FOREIGN KEY([DellManagerId])
REFERENCES [dbo].[DellManager] ([DellManagerId])
GO
ALTER TABLE [dbo].[SOW] CHECK CONSTRAINT [FK_SOW_DellManager]
GO
ALTER TABLE [dbo].[SOW]  WITH CHECK ADD  CONSTRAINT [FK_SOW_Recruiter] FOREIGN KEY([RecruiterId])
REFERENCES [dbo].[Recruiter] ([RecruiterId])
GO
ALTER TABLE [dbo].[SOW] CHECK CONSTRAINT [FK_SOW_Recruiter]
GO
ALTER TABLE [dbo].[SOW]  WITH CHECK ADD  CONSTRAINT [FK_SOW_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[SOW] CHECK CONSTRAINT [FK_SOW_Status]
GO
ALTER TABLE [dbo].[SOW]  WITH CHECK ADD  CONSTRAINT [FK_SOW_Technology] FOREIGN KEY([TechnologyId])
REFERENCES [dbo].[Technology] ([TechnologyId])
GO
ALTER TABLE [dbo].[SOW] CHECK CONSTRAINT [FK_SOW_Technology]
GO
ALTER TABLE [dbo].[SOW]  WITH CHECK ADD  CONSTRAINT [FK_SOW_USTPOC] FOREIGN KEY([USTPOCId])
REFERENCES [dbo].[USTPOC] ([USTPOCId])
GO
ALTER TABLE [dbo].[SOW] CHECK CONSTRAINT [FK_SOW_USTPOC]
GO
ALTER TABLE [dbo].[SOW]  WITH CHECK ADD  CONSTRAINT [FK_SOW_USTTPM] FOREIGN KEY([USTTPMId])
REFERENCES [dbo].[USTTPM] ([USTTPMId])
GO
ALTER TABLE [dbo].[SOW] CHECK CONSTRAINT [FK_SOW_USTTPM]
GO
ALTER TABLE [dbo].[SOWCandidate]  WITH CHECK ADD  CONSTRAINT [FK_SOWCandidate_Candidate] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[SOWCandidate] CHECK CONSTRAINT [FK_SOWCandidate_Candidate]
GO
ALTER TABLE [dbo].[SOWCandidate]  WITH CHECK ADD  CONSTRAINT [FK_SOWCandidate_SOW] FOREIGN KEY([SowId])
REFERENCES [dbo].[SOW] ([SowId])
GO
ALTER TABLE [dbo].[SOWCandidate] CHECK CONSTRAINT [FK_SOWCandidate_SOW]
GO
ALTER TABLE [dbo].[SOWCandidate]  WITH CHECK ADD  CONSTRAINT [FK_SOWCandidate_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[SOWCandidate] CHECK CONSTRAINT [FK_SOWCandidate_Status]
GO
ALTER TABLE [dbo].[Technology]  WITH CHECK ADD  CONSTRAINT [FK_Technology_Domain] FOREIGN KEY([DomainId])
REFERENCES [dbo].[Domain] ([DomainId])
GO
ALTER TABLE [dbo].[Technology] CHECK CONSTRAINT [FK_Technology_Domain]
GO
/****** Object:  StoredProcedure [dbo].[Account_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Account_proc]  
(  
@AccountId int,  
@AccountName nvarchar(100), 
@Type nvarchar(100)  
)  
AS BEGIN  
IF(@Type='post')  
BEGIN INSERT INTO Account(AccountId,AccountName)  
VALUES(@AccountId,@AccountName)  
END  
  
ELSE IF(@Type='get')      
BEGIN      
  SELECT * FROM Account where isDeleted=0 order by AccountId desc      
END     
  
  
ELSE IF(@Type='getid')      
BEGIN      
  SELECT * FROM Account where AccountId=@AccountId     
END   
  
ELSE IF(@Type='update')      
BEGIN      
update Account SET   
AccountName=@AccountName  WHERE AccountId=@AccountId  
  
END  
  
ELSE IF(@Type='Delete')      
BEGIN      
 
 update Account SET isDeleted=1 where AccountId=@AccountId

END   
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE     procedure [dbo].[ChangePassword_proc]  

 

(  

 

@EmailId varchar(100),

 

@OldPassword varchar(50),

 

@NewPassword varchar(50)

 

)  

 

As

 

DECLARE @ReturnMsg NVARCHAR(200)='';

 

DECLARE @LoginId int;

 

BEGIN

 

   IF Exists (SELECT * FROM [Login] where EmailId=@EmailId and LoginPassword=@OldPassword)

 

BEGIN 

 

   SELECT @LoginId=LoginId from Login where EmailId=@EmailId and LoginPassword=@OldPassword

 

   UPDATE LOGIN SET LoginPassword = @NewPassword WHERE LoginId=@LoginId;

 

   SET @ReturnMsg = 'New Password updated successfully'

 

END

 

  ELSE 

 

BEGIN

 

  SET @ReturnMsg = 'Old Password does not match'

 

  END SELECT @ReturnMsg as status END
GO
/****** Object:  StoredProcedure [dbo].[DashboardCandidateStats]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       PROCEDURE [dbo].[DashboardCandidateStats]   
@PeriodType nvarchar (20)  
As 
DECLARE @StartDate DATE, @EndDate DATE
BEGIN

IF(@PeriodType='Weekly')
BEGIN 
SET @StartDate= DATEADD(DAY,1-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
--SET @EndDate= DATEADD(DAY,7-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
SET @EndDate= CAST(GETDATE() AS DATE);
END

ELSE IF(@PeriodType='Fortnight')
BEGIN 
SET @StartDate= DATEADD(wk,-2,DATEADD(wk,DATEDIFF(wk,6,GETDATE()),6));
SET @EndDate= DATEADD(DAY,DATEDIFF(DAY,5,GETDATE())/7*7,5);
END

ELSE IF(@PeriodType='Monthly')
BEGIN 
SET @StartDate= DATEADD(m,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0));
SET @EndDate= DATEADD(d,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0));
END

ELSE IF(@PeriodType='Quarterly')
BEGIN 
SET @StartDate= DATEADD(q,DATEDIFF(q,0,GETDATE()),0);
SET @EndDate= DATEADD(d,-1,DATEADD(q, DATEDIFF(q,0,GETDATE()) +1,0));
END

ELSE
BEGIN
SET @StartDate= DATEADD(DAY,1-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
--SET @EndDate= DATEADD(DAY,7-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
SET @EndDate= CAST(GETDATE() AS DATE);
END

--select @StartDate;
--select @EndDate;


SELECT DISTINCT 'SO' as Category, C.STATUS AS [NAME],count(*) AS [Count]  FROM [dbo].[Candidate] C 
                                           INNER JOIN [dbo].[SOWCandidate] SC ON C.CandidateId =SC.CandidateId
										   INNER JOIN [dbo].[SOW] S ON SC.SowId =S.SowId 
										   WHERE (convert(date,C.JoiningDate) >= @StartDate AND convert(date,C.JoiningDate) <= @EndDate ) and Isnull(C.isDeleted,0)=0 
										   GROUP BY STATUS
UNION ALL
SELECT DISTINCT 'Location' as Category, LOCATION AS [NAME], count(*) AS [Count] FROM [dbo].[Candidate] 
                                         where (convert(date,JoiningDate) >= @StartDate AND convert(date,JoiningDate) <= @EndDate ) 
										                       and Isnull(isDeleted,0)=0  GROUP BY LOCATION
                                                                 
End
GO
/****** Object:  StoredProcedure [dbo].[DashboardStats]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE      PROCEDURE [dbo].[DashboardStats]   
@PeriodType nvarchar (20)  
As 
DECLARE @StartDate DATE, @EndDate DATE
BEGIN

IF(@PeriodType='Weekly')
BEGIN 
SET @StartDate= DATEADD(DAY,1-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
--SET @EndDate= DATEADD(DAY,7-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
SET @EndDate= CAST(GETDATE() AS DATE);
END

ELSE IF(@PeriodType='Fortnight')
BEGIN 
SET @StartDate= DATEADD(wk,-2,DATEADD(wk,DATEDIFF(wk,6,GETDATE()),6));
SET @EndDate= DATEADD(DAY,DATEDIFF(DAY,5,GETDATE())/7*7,5);
END

ELSE IF(@PeriodType='Monthly')
BEGIN 
SET @StartDate= DATEADD(m,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0));
SET @EndDate= DATEADD(d,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0));
END

ELSE IF(@PeriodType='Quarterly')
BEGIN 
SET @StartDate= DATEADD(q,DATEDIFF(q,0,GETDATE()),0);
SET @EndDate= DATEADD(d,-1,DATEADD(q, DATEDIFF(q,0,GETDATE()) +1,0));
END

ELSE
BEGIN
SET @StartDate= DATEADD(DAY,1-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
--SET @EndDate= DATEADD(DAY,7-DATEPART(WEEKDAY,GETDATE()),CAST(GETDATE() AS DATE));
SET @EndDate= CAST(GETDATE() AS DATE);
END

--select @StartDate;
--select @EndDate;


SELECT 'Status' as Category,st.StatusName AS [Name] ,count(so.StatusId) AS [Count]     
FROM [dbo].[SOW] so     
RIGHT JOIN [dbo].[Status] st ON st.StatusId =so.StatusId AND Isnull(so.isDeleted,0)=0  
                                AND (Convert(date,so.RequestCreationDate) >= @StartDate AND Convert(date,so.RequestCreationDate) <= @EndDate)
								group by st.StatusName  
UNION ALL    
SELECT 'Technology' as Category,T.TechnologyName AS [Name],count(so.TechnologyId) AS [Count]     
FROM [dbo].[SOW] so     
RIGHT JOIN [dbo].[Technology] T ON T.TechnologyId =so.TechnologyId AND Isnull(so.isDeleted,0)=0  
                                   AND (convert(date,so.RequestCreationDate) >= @StartDate AND convert(date,so.RequestCreationDate) <= @EndDate)
                                   group by T.TechnologyName   
UNION ALL    
SELECT 'Region' as Category,R.Region AS [Name],count(so.RegionId) AS [Count]     
FROM [dbo].[SOW] so     
RIGHT JOIN [dbo].[Region] R ON R.RegionId =so.RegionId AND Isnull(so.isDeleted,0)=0 
                             AND (convert(date,so.RequestCreationDate) >= @StartDate AND convert(date,so.RequestCreationDate) <= @EndDate)
                             group by R.Region    
End
GO
/****** Object:  StoredProcedure [dbo].[DellManager_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DellManager_proc]    
(    
@DellManagerId int,    
@DellManagerName nvarchar(100),    
@Type nvarchar(100)    
)    
AS BEGIN    
IF(@Type='post')    
BEGIN INSERT INTO DellManager(DellManagerName)    
VALUES(@DellManagerName)    
END    
    
ELSE IF(@Type='get')        
BEGIN        
  SELECT * FROM DellManager where isDeleted=0 order by DellManagerId desc        
END       
    
    
ELSE IF(@Type='getid')        
BEGIN        
  SELECT * FROM DellManager where DellManagerId= @DellManagerId     
END     
    
ELSE IF(@Type='update')        
BEGIN        
update DellManager SET     
DellManagerName=@DellManagerName  WHERE DellManagerId= @DellManagerId  
    
END    
    
ELSE IF(@Type='Delete')        
BEGIN           
  update DellManager SET isDeleted=1 where DellManagerId= @DellManagerId   
END     
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[Domain_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Domain_proc] (
	@DomainId INT
	,@DomainName NVARCHAR(100)
	,@Type NVARCHAR(100)
	)
AS
DECLARE @ReturnMsg NVARCHAR(200) = '';

BEGIN
	IF (@Type = 'post')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM Domain
				WHERE DomainName = @DomainName
				)
		BEGIN
			INSERT INTO Domain (DomainName)
			VALUES (@DomainName)

			SET @ReturnMsg = 'Domain Added Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'get')
	BEGIN
		SELECT *
		FROM Domain
		WHERE isDeleted = 0
		ORDER BY DomainId DESC
	END
	ELSE IF (@Type = 'getid')
	BEGIN
		SELECT *
		FROM Domain
		WHERE DomainId = @DomainId
	END
	ELSE IF (@Type = 'update')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM Domain
				WHERE DomainName = @DomainName
				)
		BEGIN
			UPDATE Domain
			SET DomainName = @DomainName
			WHERE DomainId = @DomainId

			SET @ReturnMsg = 'Domain Updated Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'Delete')
	BEGIN
		--DELETE FROM Domain  where DomainId=@DomainId    
		UPDATE Domain
		SET isDeleted = 1
		WHERE DomainId = @DomainId

		SET @ReturnMsg = 'Domain Deleted Successfully'
	END

	SELECT @ReturnMsg AS STATUS
END
GO
/****** Object:  StoredProcedure [dbo].[editlogin]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[editlogin] @EmailId VARCHAR(100)
	,@FailureAttempts INT
AS
DECLARE @ReturnMsg NVARCHAR(200) = '';
BEGIN
	IF EXISTS (
			SELECT *
			FROM [Login]
			WHERE EmailId = @EmailId
			)
	BEGIN
		UPDATE LOGIN
		SET FailureAttempts = @FailureAttempts
		WHERE EmailId = @EmailId;
	END

	BEGIN
		UPDATE LOGIN
		SET islock = 0
		WHERE FailureAttempts < 3
		SET @ReturnMsg = 'Reset Successfull'
	END
	SELECT @ReturnMsg AS STATUS
END
GO
/****** Object:  StoredProcedure [dbo].[Location_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     
CREATE procedure [dbo].[Location_proc]      
(      
@LocationId int,      
@Location nvarchar(50),  
@RegionId int,  
@Type nvarchar(100)      
)       
AS BEGIN      
IF(@Type='post')      
BEGIN   
INSERT INTO Location(Location,RegionId)      
VALUES(@Location,@RegionId)      
END      
      
ELSE IF(@Type='get')          
BEGIN          
  SELECT * FROM Location where isDeleted=0 order by LocationId desc          
END         
      
      
ELSE IF(@Type='getid')          
BEGIN          
  SELECT * FROM Location where LocationId=@LocationId         
END       
      
ELSE IF(@Type='update')          
BEGIN          
update Location SET       
Location=@Location,RegionId=@RegionId    where LocationId=@LocationId  
END      
      
ELSE IF(@Type='Delete')          
BEGIN          
-- DELETE FROM Location WHERE LocationId=@LocationId 
 update Location SET isDeleted=1 where LocationId=@LocationId 
END  
ELSE IF(@Type='getbyregionid')          
BEGIN          
  SELECT * FROM Location where RegionId=@RegionId         
END 
      
      
END
GO
/****** Object:  StoredProcedure [dbo].[loginproc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[loginproc]  
(  
@EmailId Varchar(100),
@LoginPassword varchar(100)
)  
AS BEGIN 
DECLARE @FailureAttempts int;
IF NOT EXISTS (SELECT * FROM [Login] WHERE EmailId = @EmailId and IsDeleted = 0 )
BEGIN
    SELECT '' AS LoginName, '' AS EmailId, '' AS RoleName, '' AS ScreenNames,'' as PermissionName,0 as FailureAttempts,
    0 as Islock, '0' AS [status];
END
    if Exists (SELECT * FROM [Login] where EmailId=@EmailId and LoginPassword=@LoginPassword and FailureAttempts<3   )
    Begin 
    DECLARE @listStr VARCHAR(MAX)
    SELECT @listStr = COALESCE(@listStr+',' ,'') + S.ScreenName
    FROM [Login] L INNER Join Roles R ON L.RoleId= R.RoleId 
    INNER Join RoleScreens RS ON R.RoleId=RS.RoleId 
    INNER JOIN Screens S ON RS.ScreenId=S.ScreenId
    where EmailId=@EmailId and LoginPassword=@LoginPassword 
    UPDATE Login SET FailureAttempts =0  where  EmailId=@EmailId and FailureAttempts<3

 

    select DISTINCT L.LoginName, L.EmailId,R.RoleName,P.PermissionName,@listStr as 'ScreenNames','1' as [status],
    L.FailureAttempts as FailureAttempts,L.Islock as Islock
    FROM [Login] L INNER Join Roles R ON L.RoleId= R.RoleId 
    INNER JOIN Permission P ON R.PermissionId=P.PermissionId
    INNER Join RoleScreens RS ON R.RoleId=RS.RoleId 
    INNER JOIN Screens S ON RS.ScreenId=S.ScreenId
    where EmailId=@EmailId and LoginPassword=@LoginPassword
    select @EmailId=EmailId from Login where EmailId=@EmailId and LoginPassword=@LoginPassword
    end  
else
Begin 
UPDATE Login SET FailureAttempts = FailureAttempts + 1  where  EmailId=@EmailId
if Exists (SELECT * FROM [Login] where EmailId=@EmailId )
  Begin 
  Update login set islock=1 where FailureAttempts=3
  end      
  select  '' as LoginName, '' as EmailId,'' as RoleName,'' as ScreenNames,'' as PermissionName,'0' as [status],
  FailureAttempts  as FailureAttempts,Islock as Islock
    from Login 
    where EmailId=@EmailId;

 

  end

 

END

GO
/****** Object:  StoredProcedure [dbo].[Recruiter_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE procedure [dbo].[Recruiter_proc]    
(    
@RecruiterId int,    
@RecruiterName nvarchar(100),    
@Type nvarchar(100)    
)    
AS BEGIN    
IF(@Type='post')    
BEGIN INSERT INTO Recruiter(RecruiterName)    
VALUES(@RecruiterName)    
END    
    
ELSE IF(@Type='get')        
BEGIN        
  SELECT * FROM Recruiter where isDeleted=0 order by RecruiterId desc        
END       
    
    
ELSE IF(@Type='getid')        
BEGIN        
  SELECT * FROM Recruiter where RecruiterId= @RecruiterId     
END     
    
ELSE IF(@Type='update')        
BEGIN        
update Recruiter SET     
RecruiterName=@RecruiterName  WHERE RecruiterId= @RecruiterId  
    
END    
    
ELSE IF(@Type='Delete')        
BEGIN        
 --DELETE FROM Recruiter WHERE RecruiterId= @RecruiterId  
  update Recruiter SET isDeleted=1 where RecruiterId= @RecruiterId  
END     
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[Region_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
CREATE procedure [dbo].[Region_proc]    
(    
@RegionId int,    
@Region nvarchar(100),    
@Type nvarchar(100)    
)    
AS BEGIN    
IF(@Type='post')    
BEGIN INSERT INTO Region(Region)    
VALUES(@Region)    
END    
    
ELSE IF(@Type='get')        
BEGIN        
  SELECT * FROM Region where isDeleted=0 order by RegionId desc        
END       
    
    
ELSE IF(@Type='getid')        
BEGIN        
  SELECT * FROM Region where RegionId=@RegionId       
END     
    
ELSE IF(@Type='update')        
BEGIN        
update Region SET     
    
Region=@Region  where RegionId=@RegionId  
END    
    
ELSE IF(@Type='Delete')        
BEGIN        
 --DELETE FROM Region  where RegionId=@RegionId 
 update Region SET isDeleted=1 where RegionId=@RegionId
END     
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[Registration_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Registration_proc] (
	@LoginName NVARCHAR(50)
	,@LoginPassword NVARCHAR(100)
	,@EmailId NVARCHAR(100)
	,@RoleId INT
	,@LoginId INT
	,@Type NVARCHAR(50)
	,@FailureAttempts INT
	)
AS
DECLARE @ReturnMsg NVARCHAR(200) = '';

BEGIN
	IF (@Type = 'post')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM LOGIN
				WHERE EmailId = @EmailId
				)
		BEGIN
			INSERT INTO LOGIN (
				LoginName
				,LoginPassword
				,EmailId
				,RoleId
				,FailureAttempts
				,Islock
				,IsDeleted
				)
			VALUES (
				@LoginName
				,@LoginPassword
				,@EmailId
				,@RoleId
				,@FailureAttempts
				,0,
				0
				)

			SET @ReturnMsg = 'User Added Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'get')
	BEGIN
		SELECT RoleId
			,RoleName
		FROM roles;
	END
	ELSE IF (@Type = 'getuser')
	BEGIN
	
		SELECT l.LoginId
			,l.LoginName
			,l.EmailId
			,r.RoleName
			,l.RoleId
		FROM LOGIN l
		INNER JOIN roles r ON L.RoleId = R.RoleId
WHERE l.IsDeleted = 0;

	END
	ELSE IF (@Type = 'update')
	BEGIN
		UPDATE LOGIN
		SET 
			RoleId = @RoleId,
			LoginName=@LoginName
		WHERE LoginId = @LoginId

		SET @ReturnMsg = 'User data Updated Successfully'
	END
	ELSE IF (@Type = 'delete')
	BEGIN
		UPDATE LOGIN
		SET [IsDeleted] = 1
		WHERE LoginId = @LoginId
		SET @ReturnMsg = 'User Deleted Successfully'
	END

	SELECT @ReturnMsg AS STATUS
END
GO
/****** Object:  StoredProcedure [dbo].[SecurityAns_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SecurityAns_proc]
(	
	@AnswerId int,
	@LoginId int,
	@QuestionId int,
	@Answer nvarchar(100),
	@Type nvarchar(100)
)
AS 
BEGIN
	IF(@Type='post')  
	BEGIN 
  		INSERT INTO SecurityAnswer(LoginId,QuestionId,Answer)  VALUES (@LoginId,@QuestionId,@Answer);
	END  

	ELSE IF(@Type='get')
	BEGIN
		Select AnswerId,LoginId,QuestionId,Answer From SecurityAnswer where LoginId = @LoginId
	END
	ELSE IF(@Type='update')    
	BEGIN    
		update SecurityAnswer SET Answer = @Answer where AnswerId = @AnswerId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SecurityQues_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[SecurityQues_proc]
(
	@QuestionId	int,
	@Question nvarchar(100),	
	@Type nvarchar(100)
)
AS 
BEGIN
	IF(@Type='get')    
	BEGIN    
		SELECT * FROM SecurityQuestion order by QuestionId desc    
	END  
	ELSE IF(@Type='getid')    
	BEGIN    
		SELECT * FROM SecurityQuestion where QuestionId = @QuestionId
	END 
END
GO
/****** Object:  StoredProcedure [dbo].[sow_date]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sow_date]
(            
@SowId int,   
@SoName nvarchar(100) NULL,     
@JRCode nvarchar(10),            
@RequestCreationDate datetime,            
@AccountId int Null,            
@TechnologyId nvarchar(500) NULL,            
@Role nvarchar(100) NULL,            
@LocationId int null , 
@RegionId int null , 
@TargetOpenPositions int NULL,            
@PositionsTobeClosed int NULL,            
@USTPOCId   int null ,         
@RecruiterId  int null ,           
@USTTPMId    int null ,         
@DellManagerId   int null ,   
@StatusId int NULL,            
@Band nvarchar(100) NULL,            
@ProjectId nvarchar(100) NULL,            
@AccountManager nvarchar(200) NULL,            
@ExternalResource nvarchar(100) NULL,            
@InternalResource nvarchar(100) NULL,     
@StartDate datetime,
@EndDate  datetime,
@Type nvarchar(100))          
as            
Begin             

 

 

 

if(@Type='getdate')          
begin          
select
    SowId,
    SoName,
    JRCode,
    RequestCreationDate,
    sow.AccountId,
    sow.TechnologyId,
    [Role],
    sow.LocationId,
    sow.RegionId,
    TargetOpenPositions,
    PositionsTobeClosed,
    sow.USTPOCId,
    sow.RecruiterId,
    sow.USTTPMId,
    sow.DellManagerId,
    sow.StatusId,
    Band,
    ProjectId,
    AccountManager,
    ExternalResource,
    InternalResource,
    SOW.isDeleted,
    Account.AccountName,
    Technology.TechnologyName,
    [Location].[Location],
    Region.Region,
    USTPOC.USTPOCName,
    Recruiter.RecruiterName,
    USTTPM.USTTPMName,
    DellManager.DellManagerName,
    [Status].StatusName
from SOW 
inner join Account on sow.AccountId=Account.AccountId
inner join Technology on sow.TechnologyId=Technology.TechnologyId
inner join [Location] on sow.LocationId=[Location].LocationId
inner join Region on sow.RegionId=Region.RegionId
inner join USTPOC on sow.USTPOCId=USTPOC.USTPOCId
inner join Recruiter on sow.RecruiterId=Recruiter.RecruiterId
inner join USTTPM on sow.USTTPMId=USTTPM.USTTPMId
inner join DellManager on sow.DellManagerId=DellManager.DellManagerId
inner join [Status] on sow.StatusId=[Status].StatusId
where  (CONVERT(date, RequestCreationDate) between  @StartDate and  @EndDate) and SOW.isDeleted=0          
END 
end

 
GO
/****** Object:  StoredProcedure [dbo].[Sow_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Sow_proc](            
@SowId int,   
@SoName nvarchar(100) NULL,     
@JRCode nvarchar(10),            
@RequestCreationDate datetime,            
@AccountId int Null,            
@TechnologyId nvarchar(500) NULL,            
@Role nvarchar(100) NULL,            
@LocationId int null , 
@RegionId int null , 
@TargetOpenPositions int NULL,            
@PositionsTobeClosed int NULL,            
@USTPOCId   int null ,         
@RecruiterId  int null ,           
@USTTPMId    int null ,         
@DellManagerId   int null ,   
@StatusId int NULL,            
@Band nvarchar(100) NULL,            
@ProjectId nvarchar(100) NULL,            
@AccountManager nvarchar(200) NULL,            
@ExternalResource nvarchar(100) NULL,            
@InternalResource nvarchar(100) NULL,     
@Type nvarchar(100))          
as        
DECLARE @ReturnMsg NVARCHAR(200)='';
Begin             
If(@Type='insert')          
BEGIN
IF NOT EXISTS (SELECT * FROM SOW WHERE JRCode=@JRCode)
begin 
BEGIN TRY
INSERT INTO
    SOW(
    SoName,
    JRCode,
    RequestCreationDate,
    AccountId,
    TechnologyId,
    [Role],
    LocationId,
    RegionId,
    TargetOpenPositions,
    PositionsTobeClosed,
    USTPOCId,
    RecruiterId,
    USTTPMId,
    DellManagerId,
    StatusId,
    Band,
    ProjectId,
    AccountManager,
    ExternalResource,
    InternalResource
   
    )
VALUES (
    @SoName,
    @JRCode,
    @RequestCreationDate,
    @AccountId,
    @TechnologyId,
    @Role,
    @LocationId,
    @RegionId,
    @TargetOpenPositions,
    @PositionsTobeClosed,
    @USTPOCId,
    @RecruiterId,
    @USTTPMId,
    @DellManagerId,
    @StatusId,
    @Band,
    @ProjectId,
    @AccountManager,
    @ExternalResource,
    @InternalResource
    
) 
	 SET @ReturnMsg = 'So Details Added Successfully'
	 END TRY
	BEGIN CATCH
				SET @ReturnMsg = 'Something went wrong'
	END CATCH
END 
 ELSE 
	BEGIN
		 SET @ReturnMsg = 'Duplicate Record Found'
	END
SELECT @ReturnMsg AS status 
END
else if(@Type='get')          
begin          
select
    SowId,
    SoName,
    JRCode,
    RequestCreationDate,
    sow.AccountId,
    sow.TechnologyId,
    [Role],
    sow.LocationId,
    sow.RegionId,
    TargetOpenPositions,
    PositionsTobeClosed,
    sow.USTPOCId,
    sow.RecruiterId,
    sow.USTTPMId,
    sow.DellManagerId,
    sow.StatusId,
    Band,
    ProjectId,
    AccountManager,
    ExternalResource,
    InternalResource,
    SOW.isDeleted,
    Account.AccountName,
    Technology.TechnologyName,
    [Location].[Location],
    Region.Region,
    USTPOC.USTPOCName,
    Recruiter.RecruiterName,
    USTTPM.USTTPMName,
    DellManager.DellManagerName,
    [Status].StatusName
   
   
from SOW 
inner join Account on sow.AccountId=Account.AccountId
inner join Technology on sow.TechnologyId=Technology.TechnologyId
inner join [Location] on sow.LocationId=[Location].LocationId
inner join Region on sow.RegionId=Region.RegionId
inner join USTPOC on sow.USTPOCId=USTPOC.USTPOCId
inner join Recruiter on sow.RecruiterId=Recruiter.RecruiterId
inner join USTTPM on sow.USTTPMId=USTTPM.USTTPMId
inner join DellManager on sow.DellManagerId=DellManager.DellManagerId
inner join [Status] on sow.StatusId=[Status].StatusId
where SOW.isDeleted=0  order by SowId desc          
END   



else if(@Type='getid')          
begin          
select
    SowId,
    SoName,
    JRCode,
    RequestCreationDate,
    sow.AccountId,
    sow.TechnologyId,
    [Role],
    sow.LocationId,
    sow.RegionId,
    TargetOpenPositions,
    PositionsTobeClosed,
    sow.USTPOCId,
    sow.RecruiterId,
    sow.USTTPMId,
    sow.DellManagerId,
    sow.StatusId,
    Band,
    ProjectId,
    AccountManager,
    ExternalResource,
    InternalResource,
    SOW.isDeleted,
    Account.AccountName,
    Technology.TechnologyName,
    [Location].[Location],
    Region.Region,
    USTPOC.USTPOCName,
    Recruiter.RecruiterName,
    USTTPM.USTTPMName,
    DellManager.DellManagerName,
    [Status].StatusName
from SOW 
inner join Account on sow.AccountId=Account.AccountId
inner join Technology on sow.TechnologyId=Technology.TechnologyId
inner join [Location] on sow.LocationId=[Location].LocationId
inner join Region on sow.RegionId=Region.RegionId
inner join USTPOC on sow.USTPOCId=USTPOC.USTPOCId
inner join Recruiter on sow.RecruiterId=Recruiter.RecruiterId
inner join USTTPM on sow.USTTPMId=USTTPM.USTTPMId
inner join DellManager on sow.DellManagerId=DellManager.DellManagerId
inner join [Status] on sow.StatusId=[Status].StatusId
where SowId=@SowId          
END       



else if(@Type='update')          
begin          
UPDATE
SOW
SET
    SoName = @SoName,
    JRCode = @JRCode,
    RequestCreationDate = @RequestCreationDate,
    AccountId = @AccountId,
    TechnologyId = @TechnologyId,
    [Role] = @Role,
    LocationId = @LocationId,
    RegionId = @RegionId,
    TargetOpenPositions = @TargetOpenPositions,
    PositionsTobeClosed = @PositionsTobeClosed,
    USTPOCId = @USTPOCId,
    RecruiterId = @RecruiterId,
    USTTPMId = @USTTPMId,
    DellManagerId = @DellManagerId,
    StatusId = @StatusId,
    Band = @Band,
    ProjectId = @ProjectId,
    AccountManager = @AccountManager,
    ExternalResource = @ExternalResource,
    InternalResource = @InternalResource
WHERE SowId=@SowId     
END          
else if(@Type='Delete')          
begin 
	IF EXISTS (SELECT * FROM SOW WHERE SowId=@SowId )
	BEGIN
		update
		SOW 
		SET 
   			isDeleted=1 
			where SowId=@SowId 
			SET @ReturnMsg = 'Data Deleted Successfully'
	END  
	ELSE 
	BEGIN
		SET @ReturnMsg = 'Record Not Found'
	END
	select @ReturnMsg as status 
END

END
GO
/****** Object:  StoredProcedure [dbo].[SowCandidate_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SowCandidate_proc] (
	@SOW_CandidateId INT
	,@SowId INT
	,@CandidateId INT
	,@StatusId INT
	,@Type NVARCHAR(100)
	)
AS
DECLARE @ReturnMsg NVARCHAR(200) = '';

BEGIN
	IF (@Type = 'post')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM SOWCandidate
				WHERE CandidateId = @CandidateId
					AND SowId = @SowId
				)
		BEGIN
			INSERT INTO SOWCandidate (
				SowId
				,CandidateId
				,StatusId
				)
			VALUES (
				@SowId
				,@CandidateId
				,@StatusId
				)

			SET @ReturnMsg = 'Candidate Mapped Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'get')
	BEGIN
		SELECT SOW_CandidateId
			,SOWCandidate.SowId
			,SOWCandidate.CandidateId
			,SOWCandidate.StatusId
			,SOWCandidate.isDeleted
			,SOW.SoName
			,Candidate.CandidateName
			,[Status].StatusName
		FROM SOWCandidate
		INNER JOIN SOW ON sow.SowId = SOWCandidate.SowId
		INNER JOIN Candidate ON Candidate.CandidateId = SOWCandidate.CandidateId
		INNER JOIN [Status] ON [Status].StatusId = SOWCandidate.StatusId
		WHERE SOWCandidate.isDeleted = 0
		ORDER BY SOW_CandidateId DESC
	END
	ELSE IF (@Type = 'getid')
	BEGIN
		SELECT SOW_CandidateId
			,SOWCandidate.SowId
			,SOWCandidate.CandidateId
			,SOWCandidate.StatusId
			,SOWCandidate.isDeleted
			,SOW.SoName
			,Candidate.CandidateName
			,[Status].StatusName
		FROM SOWCandidate
		INNER JOIN SOW ON sow.SowId = SOWCandidate.SowId
		INNER JOIN Candidate ON Candidate.CandidateId = SOWCandidate.CandidateId
		INNER JOIN [Status] ON [Status].StatusId = SOWCandidate.StatusId
		WHERE SOW_CandidateId = @SOW_CandidateId
	END
	ELSE IF (@Type = 'update')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM SOWCandidate
				WHERE CandidateId = @CandidateId
					AND SowId = @SowId
				)
		BEGIN
			UPDATE SOWCandidate
			SET SowId = @SowId
				,CandidateId = @CandidateId
				,StatusId = @StatusId
			WHERE SOW_CandidateId = @SOW_CandidateId

			SET @ReturnMsg = 'Candidate Mapping Updated Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'Delete')
	BEGIN
		--DELETE FROM SOWCandidate WHERE SOW_CandidateId=@SOW_CandidateId
		UPDATE SOWCandidate
		SET isDeleted = 1
		WHERE SOW_CandidateId = @SOW_CandidateId

		SET @ReturnMsg = 'Candidate Mapping Deleted Successfully'
	END

	SELECT @ReturnMsg AS STATUS
END
GO
/****** Object:  StoredProcedure [dbo].[Status_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Status_proc]
(
	@StatusId	int,
	@StatusName nvarchar(100),
	@Type		nvarchar(100),
	@StatusType	nvarchar(100)
)
AS 
BEGIN
	IF(@Type='post')
	BEGIN 
		INSERT INTO Status(StatusName, [StatusType] ) VALUES (@StatusName, @StatusType)
	END

	ELSE IF(@Type='get')    
	BEGIN    
		SELECT * FROM Status where Isnull(IsDeleted,0) = 0  order by StatusId desc    
	END   

	ELSE IF(@Type='getid')    
	BEGIN    
		SELECT * FROM Status where StatusId = @StatusId
	END 

	ELSE IF(@Type='update')    
	BEGIN    
		update Status SET StatusName = @StatusName where StatusId = @StatusId
	END

	ELSE IF(@Type='Delete')    
	BEGIN    
	 update Status SET IsDeleted = 1 where StatusId = @StatusId
	END 
END
GO
/****** Object:  StoredProcedure [dbo].[Technology_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Technology_proc] (
	@TechnologyId INT
	,@TechnologyName NVARCHAR(100)
	,@DomainId INT
	,@Type NVARCHAR(100)
	)
AS
DECLARE @ReturnMsg NVARCHAR(200) = '';

BEGIN
	IF (@Type = 'post')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM Technology
				WHERE TechnologyName = @TechnologyName
					AND DomainId = @DomainId
				)
		BEGIN
			INSERT INTO Technology (
				TechnologyName
				,DomainId
				)
			VALUES (
				@TechnologyName
				,@DomainId
				)

			SET @ReturnMsg = 'Technology Added Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'get')
	BEGIN
		SELECT TechnologyId
			,TechnologyName
			,tech.DomainId
			,DomainName
		FROM Technology tech
		INNER JOIN Domain ON Tech.DomainId = Domain.DomainId
		WHERE Isnull(tech.isDeleted, 0) = 0
		ORDER BY TechnologyId DESC
	END
	ELSE IF (@Type = 'getid')
	BEGIN
		SELECT *
		FROM Technology
		WHERE TechnologyId = @TechnologyId
	END
	ELSE IF (@Type = 'update')
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM Technology
				WHERE TechnologyName = @TechnologyName
					AND DomainId = @DomainId
				)
		BEGIN
			UPDATE Technology
			SET TechnologyName = @TechnologyName
				,DomainId = @DomainId
			WHERE TechnologyId = @TechnologyId

			SET @ReturnMsg = 'Technology Updated Successfully'
		END
		ELSE
		BEGIN
			SET @ReturnMsg = 'Duplicate Record Found'
		END
	END
	ELSE IF (@Type = 'Delete')
	BEGIN
		--DELETE FROM Technology  where TechnologyId=@TechnologyId   
		UPDATE Technology
		SET IsDeleted = 1
		WHERE TechnologyId = @TechnologyId

		SET @ReturnMsg = 'Technology Deleted Successfully'
	END
	SELECT @ReturnMsg AS STATUS
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addCandidateData]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_addCandidateData]
@CandidateName nvarchar(100),
@MobileNo nvarchar(50),
@Gender nvarchar(20),
@DOB date,
@EmailId nvarchar(50),
@Location nvarchar(50),
@Pincode nvarchar(10),
@Address nvarchar(max),
@Status nvarchar(50),
@Skills nvarchar(max),
@JoiningDate datetime,
@IsInternal bit
as
DECLARE @ReturnMsg NVARCHAR(200)='';
begin
IF not exists (SELECT * FROM Candidate WHERE  EmailId=@EmailId)
BEGIN
set nocount on
BEGIN TRY
insert into Candidate(CandidateName,Gender,MobileNo,DOB,EmailId,Location,Pincode,Address,Status,Skills,JoiningDate,IsInternal)
values(@CandidateName,@Gender,@MobileNo,@DOB,@EmailId,@Location,@Pincode,@Address,@Status,@Skills,@JoiningDate,@IsInternal)
 SET @ReturnMsg = 'Candidate Details Added Successfully'
 END TRY
 BEGIN CATCH
		SET @ReturnMsg = 'Something went wrong'
	END CATCH
END
Else
	Begin
		 SET @ReturnMsg = 'Duplicate Record Found'
	End
SELECT @ReturnMsg AS status 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_candidateDataImport]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE PROCEDURE [dbo].[usp_candidateDataImport]

(

  @Json NVARCHAR(MAX)


)

AS

BEGIN

  DECLARE @message NVARCHAR(200) = '';

 

  SET NOCOUNT ON;


  BEGIN TRY

    BEGIN

      WITH JsonToTable AS

      (

        SELECT *

        FROM OPENJSON (@Json)

        WITH (

          CandidateName NVARCHAR(100),

          MobileNo NVARCHAR(20),

          Gender NVARCHAR(50),

          DOB DATETIME,

          Email NVARCHAR(100),

          [Location] NVARCHAR(100),

          Skills NVARCHAR(MAX),

          JoiningDate DATETIME,

          [Address] NVARCHAR(MAX),

          [Status] INT,

          Pincode NVARCHAR(10),

          isInternal BIT

        )

      )

 

      MERGE Candidate AS TARGET

      USING JsonToTable AS SOURCE

      ON (TARGET.CandidateName = SOURCE.candidateName AND TARGET.EmailId = SOURCE.email)

      WHEN NOT MATCHED THEN

        INSERT (

          CandidateName,

          Gender,

          MobileNo,

          DOB,

          EmailId,

          Location,

          Pincode,

          Address,

          Status,

          Skills,

          JoiningDate,

          IsInternal

        )

        VALUES (

          SOURCE.candidateName,

          SOURCE.gender,

          SOURCE.mobileNo,

          SOURCE.dob,

          SOURCE.email,

          SOURCE.location,

          SOURCE.pincode,

          SOURCE.address,

          SOURCE.status,

          SOURCE.skills,

          SOURCE.joiningDate,

          SOURCE.isInternal

        );

 

      IF @@ROWCOUNT = 0

      BEGIN

      

        SET @message = 'Duplicate Records found ';

      END

      ELSE

      BEGIN


        SET @message = 'Data inserted successfully';

      END;

 

    
    END;

  END TRY

  BEGIN CATCH

   

  END CATCH;

  select @message as status

END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteCandidateData]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_deleteCandidateData]
@CandidateId int
as
DECLARE @STATUS NVARCHAR(200)=''
begin
IF EXISTS (SELECT * FROM Candidate WHERE CandidateId=@CandidateId)
	BEGIN
		update Candidate SET IsDeleted=1 where CandidateId=@CandidateId
		SET @STATUS = 'Data Deleted Successfully'
	END
ELSE
	BEGIN 
		SET @STATUS = 'Record Not Found'
	END
select @STATUS as status 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_editCandidateData]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_editCandidateData]
@CandidateId int,
@CandidateName nvarchar(100),
@MobileNo nvarchar(50),
@Gender nvarchar(20),
@DOB date,
@EmailId nvarchar(50),
@Location nvarchar(50),
@Pincode nvarchar(10),
@Address nvarchar(max),
@Status nvarchar(50),
@Skills nvarchar(max),
@JoiningDate datetime,
@IsInternal bit
as
begin
UPDATE Candidate
SET CandidateName=@CandidateName,
MobileNo=@MobileNo,Gender=@Gender,DOB=@DOB,EmailId=@EmailId,Location=@Location,Pincode=@Pincode,Address=@Address,Status=@Status,Skills=@Skills,
JoiningDate=@JoiningDate,IsInternal=@IsInternal
Where CandidateId=@CandidateId;
end
GO
/****** Object:  StoredProcedure [dbo].[usp_getAllCandidateData]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_getAllCandidateData]
as
begin
set nocount on
select CandidateId,CandidateName,MobileNo,DOB,EmailId,Location,Skills,JoiningDate,IsInternal,Address,B.StatusName Status,Pincode,Gender
from Candidate A
Inner Join [dbo].[Status] B On A.Status = B.StatusId
where Isnull(A.IsDeleted, 0) = 0 order by CandidateId desc

end
GO
/****** Object:  StoredProcedure [dbo].[usp_showCandidateData]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_showCandidateData]
@CandidateId int 
as
begin 
set nocount on
select CandidateId,CandidateName,Gender,MobileNo,DOB,EmailId,Location,Pincode,Address,Status,Skills,JoiningDate,IsInternal
from Candidate where CandidateId=@CandidateId
end
GO
/****** Object:  StoredProcedure [dbo].[usp_sowDataImport]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[usp_sowDataImport]
(
  @Json NVARCHAR(MAX)
)
AS
BEGIN
 DECLARE @message NVARCHAR(200) = '';
SET NOCOUNT ON
BEGIN TRY
BEGIN
WITH JsonToTable AS
(
SELECT * FROM OPENJSON (@Json)
WITH (SoName nvarchar(100),JRCode nvarchar(10),RequestCreationDate datetime,AccountId int,TechnologyId int,[Role] nvarchar(100),
LocationId int,RegionId int,TargetOpenPositions int,PositionsTobeClosed int,USTPOCId int,RecruiterId int,USTTPMId int,DellManagerId int,
StatusId int,Band nvarchar(100),ProjectId nvarchar(100),AccountManager nvarchar(200),ExternalResource nvarchar(100),InternalResource nvarchar(100))
)
MERGE SOW as TARGET
USING JsonToTable as SOURCE
ON (TARGET.SoName=SOURCE.soName and target.JRCode=source.JRCode)
WHEN NOT MATCHED THEN
INSERT (SoName,JRCode,RequestCreationDate,AccountId,TechnologyId,[Role],
LocationId,RegionId,TargetOpenPositions,PositionsTobeClosed,USTPOCId,RecruiterId,USTTPMId,DellManagerId,
StatusId,Band,ProjectId,AccountManager,ExternalResource,InternalResource
)
VALUES
(
SOURCE.soName,SOURCE.jrCode,SOURCE.requestCreationDate,SOURCE.accountId,SOURCE.technologyId,SOURCE.role,SOURCE.locationId,SOURCE.regionId
,SOURCE.targetOpenPositions,SOURCE.positionsTobeClosed,SOURCE.ustpocId,SOURCE.recruiterId,SOURCE.usttpmId,SOURCE.dellManagerId,
SOURCE.statusId,SOURCE.band,SOURCE.projectId,SOURCE.accountManager,SOURCE.externalResource,SOURCE.internalResource
);
   IF @@ROWCOUNT = 0

      BEGIN

      

        SET @message = 'Duplicate Records found ';

      END

      ELSE

      BEGIN


        SET @message = 'Data inserted successfully';

      END;

 

    
   

END
END TRY
BEGIN CATCH
END CATCH
  select @message as status

END
GO
/****** Object:  StoredProcedure [dbo].[USTPOC_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USTPOC_proc]    
(    
@USTPOCId int,    
@USTPOCName nvarchar(100),    
@Type nvarchar(100)    
)    
AS BEGIN    
IF(@Type='post')    
BEGIN INSERT INTO USTPOC(USTPOCName)    
VALUES(@USTPOCName)    
END    
    
ELSE IF(@Type='get')        
BEGIN        
  SELECT * FROM USTPOC where isDeleted=0 order by USTPOCId desc        
END       
    
    
ELSE IF(@Type='getid')        
BEGIN        
  SELECT * FROM USTPOC where USTPOCId= @USTPOCId     
END     
    
ELSE IF(@Type='update')        
BEGIN        
update USTPOC SET     
USTPOCName=@USTPOCName  WHERE USTPOCId= @USTPOCId   
    
END    
    
ELSE IF(@Type='Delete')        
BEGIN        
 --DELETE FROM USTPOC WHERE USTPOCId= @USTPOCId   
  update USTPOC SET isDeleted=1 where USTPOCId= @USTPOCId  
END     
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[USTTPM_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[USTTPM_proc]    
(    
@USTTPMId int,    
@USTTPMName nvarchar(100),    
@Type nvarchar(100)    
)    
AS BEGIN    
IF(@Type='post')    
BEGIN INSERT INTO USTTPM(USTTPMName)    
VALUES(@USTTPMName)    
END    
    
ELSE IF(@Type='get')        
BEGIN        
  SELECT * FROM USTTPM where isDeleted=0 order by USTTPMId desc        
END       
    
    
ELSE IF(@Type='getid')        
BEGIN        
  SELECT * FROM USTTPM where USTTPMId= @USTTPMId     
END     
    
ELSE IF(@Type='update')        
BEGIN        
update  USTTPM SET     
USTTPMName=@USTTPMName  WHERE USTTPMId= @USTTPMId  
    
END    
    
ELSE IF(@Type='Delete')        
BEGIN        
 --DELETE FROM USTTPM where USTTPMId= @USTTPMId    
   update USTTPM SET isDeleted=1 where USTTPMId= @USTTPMId   
END     
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateSecuityQnA_proc]    Script Date: 22-06-2023 16:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ValidateSecuityQnA_proc]  
(  
@LoginName varchar(100),
@QuestionId int,
@Answer varchar(100),
@msg varchar(100) OUT
)  
as

Begin 
 DECLARE @LoginId AS INT
 DECLARE @AnswerFromTable as varchar(100)

 SELECT @LoginId = LoginId FROM [Login] WHERE LoginName = @LoginName

 if(@LoginId <> 0)
 BEGIN
	Select @AnswerFromTable=Answer from SecurityAnswer where LoginId=@LoginId and QuestionId=@QuestionId
	if(@AnswerFromTable = @Answer)
	BEGIN
		SET @msg='Details are correct'
	END
	ELSE
	BEGIN
		SET @msg='Please contact Admin. Details provided are incorrect'
	END
 END
 ELSE
	BEGIN
		SET @msg='Please contact Admin. Details provided are incorrect'
	END
	RETURN;
End


	
	
GO
USE [master]
GO
ALTER DATABASE [SOW_Db] SET  READ_WRITE 
GO
