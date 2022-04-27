USE [master]
GO
/****** Object:  Database [Orlov.Library]    Script Date: 3/20/2022 5:16:44 PM ******/
CREATE DATABASE [Orlov.Library]
GO
ALTER DATABASE [Orlov.Library] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Orlov.Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Orlov.Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Orlov.Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Orlov.Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Orlov.Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Orlov.Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Orlov.Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Orlov.Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Orlov.Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Orlov.Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Orlov.Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Orlov.Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Orlov.Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Orlov.Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Orlov.Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Orlov.Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Orlov.Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Orlov.Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Orlov.Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Orlov.Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Orlov.Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Orlov.Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Orlov.Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Orlov.Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Orlov.Library] SET  MULTI_USER 
GO
ALTER DATABASE [Orlov.Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Orlov.Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Orlov.Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Orlov.Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Orlov.Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Orlov.Library] SET QUERY_STORE = OFF
GO
USE [Orlov.Library]
GO
/****** Object:  UserDefinedTableType [dbo].[dtIntEntity]    Script Date: 3/20/2022 5:16:45 PM ******/
CREATE TYPE [dbo].[dtIntEntity] AS TABLE(
	[EntityID] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[NotesID] [int] NOT NULL,
	[Publisher] [nvarchar](300) NOT NULL,
	[ISBN] [nvarchar](20) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BooksToAuthors]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BooksToAuthors](
	[BookID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newspapers]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newspapers](
	[NewspaperId] [int] IDENTITY(1,1) NOT NULL,
	[NotesID] [int] NOT NULL,
	[Publisher] [nvarchar](300) NOT NULL,
	[ISSN] [nvarchar](12) NULL,
	[IssueNumber] [int] NULL,
 CONSTRAINT [PK_Newspapers] PRIMARY KEY CLUSTERED 
(
	[NewspaperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[PageCount] [int] NOT NULL,
	[PlaceOfPublication] [nvarchar](200) NOT NULL,
	[YearOfPublication] [int] NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patents]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patents](
	[PatentID] [int] IDENTITY(1,1) NOT NULL,
	[NotesID] [int] NOT NULL,
	[DateOfPublication] [date] NOT NULL,
	[Number] [int] NOT NULL,
	[DateOfApplicationSubmission] [date] NOT NULL,
 CONSTRAINT [PK_Patents] PRIMARY KEY CLUSTERED 
(
	[PatentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatentsToAuthors]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatentsToAuthors](
	[PatentID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (7, N'Lev', N'Tolstoi')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (8, N'Fedor', N'Dostoevskii')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (9, N'Levan', N'Burchuladze')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (10, N'Sidor', N'Sidorov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (11, N'Nikolai', N'Gogol')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (12, N'Anton', N'Chehov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (13, N'Fedor', N'Fedorov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (14, N'Petr', N'Petrov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (15, N'Fedor', N'Petrov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (16, N'Pert', N'Jaskowich')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (17, N'Anna', N'Ahmatova')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (18, N'Fedor', N'Ahmatova')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (19, N'Fedor', N'Jaskowich')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (20, N'Pert', N'Petrov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (21, N'Aleskandr', N'Pushkin')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (22, N'Anna', N'Pushkin')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (23, N'Test', N'Testov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (24, N'Test', N'Pushkin')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (25, N'Pert', N'Testov')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (26, N'Test', N'Ahmatova')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (27, N'Test', N'Ahmatova')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (28, N'Test', N'Ahmatova')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (29, N'Test1', N'Test1 ')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (30, N'Test2', N'Test2')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (31, N'Test3', N'Test3')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (32, N'Test4', N'Test4')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (33, N'Test2', N'Test3')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (34, N'Test1', N'Test2')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (35, N'Test1', N'Test4')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (36, N'Test5', N'Test5')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (37, N'Test5', N'Test4')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (38, N'Test5', N'Test4')
GO
INSERT [dbo].[Authors] ([AuthorID], [FirstName], [LastName]) VALUES (39, N'Test7', N'Test7')
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([BookID], [NotesID], [Publisher], [ISBN]) VALUES (22, 22, N'Teremok', NULL)
GO
INSERT [dbo].[Books] ([BookID], [NotesID], [Publisher], [ISBN]) VALUES (23, 23, N'Slovo', NULL)
GO
INSERT [dbo].[Books] ([BookID], [NotesID], [Publisher], [ISBN]) VALUES (35, 35, N'Teremok', NULL)
GO
INSERT [dbo].[Books] ([BookID], [NotesID], [Publisher], [ISBN]) VALUES (36, 36, N'Suzran', NULL)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[BooksToAuthors] ([BookID], [AuthorID]) VALUES (22, 11)
GO
INSERT [dbo].[BooksToAuthors] ([BookID], [AuthorID]) VALUES (23, 12)
GO
INSERT [dbo].[BooksToAuthors] ([BookID], [AuthorID]) VALUES (35, 7)
GO
INSERT [dbo].[BooksToAuthors] ([BookID], [AuthorID]) VALUES (36, 12)
GO
SET IDENTITY_INSERT [dbo].[Newspapers] ON 
GO
INSERT [dbo].[Newspapers] ([NewspaperId], [NotesID], [Publisher], [ISSN], [IssueNumber]) VALUES (7, 20, N'Times & co', NULL, 4)
GO
INSERT [dbo].[Newspapers] ([NewspaperId], [NotesID], [Publisher], [ISSN], [IssueNumber]) VALUES (8, 37, N'RusskayPravda', NULL, 1)
GO
INSERT [dbo].[Newspapers] ([NewspaperId], [NotesID], [Publisher], [ISSN], [IssueNumber]) VALUES (10, 39, N'RusskayPravda', NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[Newspapers] OFF
GO
SET IDENTITY_INSERT [dbo].[Notes] ON 
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (20, 2, N'Times', N'Gazeta dlia vseh', 50, N'New York', 2001)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (21, 3, N'Zubochistka', N'Poleznay vesh', 3, N'Berlin', 1920)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (22, 1, N'Mertvie dushi', N'Interesnay kniga pro raznih lydey', 500, N'Moskva', 1860)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (23, 1, N'Tolstii i tonkii', N'Smeshno', 100, N'Saint-Peterburg', 1815)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (35, 1, N'Voina i Mir', N'Bolshai Kniga', 900, N'Moskva', 1911)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (36, 1, N'Tolstii i tonkii', N'Про книгу Льва Толстого', 30, N'Sankt-Peterburg', 1865)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (37, 2, N'Pravda', N'Russian newspaper', 30, N'Moskva', 2001)
GO
INSERT [dbo].[Notes] ([ID], [Type], [Title], [Description], [PageCount], [PlaceOfPublication], [YearOfPublication]) VALUES (39, 2, N'Pravda', N'Test', 32, N'Moskva', 2006)
GO
SET IDENTITY_INSERT [dbo].[Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[Patents] ON 
GO
INSERT [dbo].[Patents] ([PatentID], [NotesID], [DateOfPublication], [Number], [DateOfApplicationSubmission]) VALUES (4, 21, CAST(N'1920-03-10' AS Date), 1, CAST(N'1920-03-11' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Patents] OFF
GO
INSERT [dbo].[PatentsToAuthors] ([PatentID], [AuthorID]) VALUES (4, 10)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role]) VALUES (3, N'Admin1', N'TLTvZvlxNUxcTCFwKYZyUDU271f5g4uCyJOxXdnz5fznUvtLYRK7HpVPE9PHnv+E6iY6heJUhy2PBqE8IjvagQ==', N'Admin')
GO
INSERT [dbo].[Users] ([UserID], [Name], [Password], [Role]) VALUES (4, N'User1', N'LA6141e3dS/rGCU0yhUwNENbUOdFd0YXZua3PTfGiG2JPST+jCPVFH3bKREhrI22whbJoLNPxmYxorxH1QVz/g==', N'User')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Notes] FOREIGN KEY([NotesID])
REFERENCES [dbo].[Notes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Notes]
GO
ALTER TABLE [dbo].[BooksToAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BooksToAuthors_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[BooksToAuthors] CHECK CONSTRAINT [FK_BooksToAuthors_Authors]
GO
ALTER TABLE [dbo].[BooksToAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BooksToAuthors_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BooksToAuthors] CHECK CONSTRAINT [FK_BooksToAuthors_Books]
GO
ALTER TABLE [dbo].[Newspapers]  WITH CHECK ADD  CONSTRAINT [FK_Newspapers_Newspapers] FOREIGN KEY([NotesID])
REFERENCES [dbo].[Notes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Newspapers] CHECK CONSTRAINT [FK_Newspapers_Newspapers]
GO
ALTER TABLE [dbo].[Patents]  WITH CHECK ADD  CONSTRAINT [FK_Patents_Notes] FOREIGN KEY([NotesID])
REFERENCES [dbo].[Notes] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patents] CHECK CONSTRAINT [FK_Patents_Notes]
GO
ALTER TABLE [dbo].[PatentsToAuthors]  WITH CHECK ADD  CONSTRAINT [FK_PatentsToAuthors_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[PatentsToAuthors] CHECK CONSTRAINT [FK_PatentsToAuthors_Authors]
GO
ALTER TABLE [dbo].[PatentsToAuthors]  WITH CHECK ADD  CONSTRAINT [FK_PatentsToAuthors_Patents] FOREIGN KEY([PatentID])
REFERENCES [dbo].[Patents] ([PatentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatentsToAuthors] CHECK CONSTRAINT [FK_PatentsToAuthors_Patents]
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorsByBooksID]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuthorsByBooksID]
	@ids [dtIntEntity] READONLY
AS
BEGIN
	SELECT a.AuthorID, a.FirstName, a.LastName, ba.BookID AS ID
	FROM [Authors] AS a LEFT JOIN [BooksToAuthors] as ba ON ba.AuthorID = a.AuthorID
	WHERE ba.BookID in (SELECT [EntityID] FROM @ids)
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorsByPatentID]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAuthorsByPatentID]
	@ids [dtIntEntity] READONLY
AS
BEGIN
	SELECT a.AuthorID, a.FirstName, a.LastName, pa.PatentID as ID
	FROM [Authors] AS a LEFT JOIN PatentsToAuthors as pa ON pa.AuthorID = a.AuthorID
	WHERE pa.PatentID in (SELECT [EntityID] FROM @ids)
END
GO
/****** Object:  StoredProcedure [dbo].[GetNotesByYears]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNotesByYears]
	@ids [dtIntEntity] READONLY
AS
BEGIN
	SELECT ID, Type, Title, Description, PageCount, PlaceOfPublication, YearOfPublication 
	FROM [dbo].Notes AS n WHERE YearOfPublication in (SELECT [EntityID] FROM @ids)
	ORDER BY YearOfPublication
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveRelationshipBooksToAuthors]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveRelationshipBooksToAuthors] 
	@bookId [int],
	@ids [dtIntEntity] READONLY
AS
BEGIN
	DELETE FROM BooksToAuthors 
	WHERE BookID = @bookId AND AuthorID in (SELECT [EntityID] FROM @ids)
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveRelationshipPatentsToAuthors]    Script Date: 3/20/2022 5:16:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveRelationshipPatentsToAuthors] 
	@patentId [int],
	@ids [dtIntEntity] READONLY
AS
BEGIN
	DELETE FROM PatentsToAuthors 
	WHERE PatentID = @patentId AND AuthorID in (SELECT [EntityID] FROM @ids)
END
GO
USE [master]
GO
ALTER DATABASE [Orlov.Library] SET  READ_WRITE 
GO
