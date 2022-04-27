USE [master]
GO
/****** Object:  Database [OrlovMyGame]    Script Date: 2/10/2022 9:10:38 PM ******/
CREATE DATABASE [OrlovMyGame]
GO
ALTER DATABASE [OrlovMyGame] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrlovMyGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrlovMyGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrlovMyGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrlovMyGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrlovMyGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrlovMyGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrlovMyGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OrlovMyGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrlovMyGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrlovMyGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrlovMyGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrlovMyGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrlovMyGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrlovMyGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrlovMyGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrlovMyGame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OrlovMyGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrlovMyGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrlovMyGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrlovMyGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrlovMyGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrlovMyGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OrlovMyGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrlovMyGame] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrlovMyGame] SET  MULTI_USER 
GO
ALTER DATABASE [OrlovMyGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrlovMyGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrlovMyGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrlovMyGame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrlovMyGame] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrlovMyGame] SET QUERY_STORE = OFF
GO
USE [OrlovMyGame]
GO
/****** Object:  Table [dbo].[Benefits]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefits](
	[GameObjectID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
	[AmountOfEffect] [int] NULL,
	[Effect] [tinyint] NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_GameObject] PRIMARY KEY CLUSTERED 
(
	[GameObjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BestPassage]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BestPassage](
	[BestPassageID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
	[DateOfPassage] [date] NOT NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_BestPassage] PRIMARY KEY CLUSTERED 
(
	[BestPassageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameLevels]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameLevels](
	[LvlID] [int] IDENTITY(1,1) NOT NULL,
	[DifficultyLevel] [tinyint] NOT NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_GameLevels] PRIMARY KEY CLUSTERED 
(
	[LvlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MapM]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapM](
	[MapID] [int] IDENTITY(1,1) NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
 CONSTRAINT [PK_MapM] PRIMARY KEY CLUSTERED 
(
	[MapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovableObject]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovableObject](
	[MovableID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
	[HP] [int] NOT NULL,
	[Damage] [int] NULL,
	[Lightness] [int] NOT NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_MovableObject] PRIMARY KEY CLUSTERED 
(
	[MovableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obstacles]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obstacles](
	[ObstaclesID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
	[Damage] [int] NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_Obstacles] PRIMARY KEY CLUSTERED 
(
	[ObstaclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerSaves]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerSaves](
	[PlayerSavesID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[DateOfPassage] [date] NOT NULL,
	[DifficultyLevel] [int] NOT NULL,
	[SpeedOfPassage] [int] NOT NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_PlayerSaves] PRIMARY KEY CLUSTERED 
(
	[PlayerSavesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Traps]    Script Date: 2/10/2022 9:10:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traps](
	[TrapID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
	[Triggered] [bit] NOT NULL,
	[AmountOfEffect] [int] NOT NULL,
	[Effect] [tinyint] NOT NULL,
	[MapID] [int] NOT NULL,
 CONSTRAINT [PK_Traps] PRIMARY KEY CLUSTERED 
(
	[TrapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Benefits] ON 
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2699, N'Apple', 5, 7, 20, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2700, N'Apple', 8, 3, 20, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2701, N'Apple', 18, 2, 20, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2702, N'Cherry', 15, 6, 10, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2703, N'Cherry', 9, 3, 10, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2704, N'Cherry', 20, 3, 10, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2705, N'Pineapple', 19, 4, 30, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2706, N'Pineapple', 18, 10, 30, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2707, N'Pineapple', 16, 9, 30, NULL, 235)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2708, N'Apple', 26, 6, 20, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2709, N'Apple', 35, 2, 20, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2710, N'Apple', 29, 3, 20, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2711, N'Cherry', 21, 4, 10, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2712, N'Cherry', 31, 3, 10, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2713, N'Cherry', 39, 9, 10, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2714, N'Pineapple', 1, 3, 30, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2715, N'Pineapple', 15, 4, 30, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2716, N'Pineapple', 18, 6, 30, NULL, 236)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2717, N'Apple', 36, 4, 20, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2718, N'Apple', 28, 10, 20, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2719, N'Apple', 7, 9, 20, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2720, N'Cherry', 11, 10, 10, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2721, N'Cherry', 27, 10, 10, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2722, N'Cherry', 21, 1, 10, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2723, N'Pineapple', 24, 4, 30, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2724, N'Pineapple', 4, 5, 30, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2725, N'Pineapple', 23, 10, 30, NULL, 237)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2726, N'Apple', 36, 6, 20, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2727, N'Apple', 30, 9, 20, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2728, N'Apple', 11, 10, 20, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2729, N'Cherry', 31, 6, 10, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2730, N'Cherry', 3, 9, 10, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2731, N'Cherry', 30, 5, 10, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2732, N'Pineapple', 2, 2, 30, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2733, N'Pineapple', 21, 6, 30, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2734, N'Pineapple', 8, 7, 30, NULL, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2735, N'Blueberry', 22, 5, 7, 5, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2736, N'Blueberry', 5, 10, 7, 5, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2737, N'Blueberry', 10, 8, 7, 5, 238)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2738, N'Apple', 21, 14, 20, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2739, N'Apple', 23, 17, 20, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2740, N'Apple', 13, 5, 20, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2741, N'Cherry', 3, 10, 10, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2742, N'Cherry', 33, 19, 10, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2743, N'Cherry', 26, 9, 10, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2744, N'Pineapple', 12, 20, 30, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2745, N'Pineapple', 27, 18, 30, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2746, N'Pineapple', 39, 5, 30, NULL, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2747, N'Blueberry', 36, 2, 7, 5, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2748, N'Blueberry', 30, 18, 7, 5, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2749, N'Blueberry', 4, 4, 7, 5, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2750, N'Raspberry', 2, 13, 2, 1, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2751, N'Raspberry', 2, 20, 2, 1, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2752, N'Raspberry', 33, 20, 2, 1, 239)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2753, N'Apple', 2, 6, 20, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2754, N'Apple', 25, 11, 20, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2755, N'Apple', 4, 2, 20, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2756, N'Cherry', 10, 10, 10, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2757, N'Cherry', 28, 7, 10, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2758, N'Cherry', 25, 12, 10, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2759, N'Pineapple', 31, 6, 30, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2760, N'Pineapple', 21, 18, 30, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2761, N'Pineapple', 35, 14, 30, NULL, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2762, N'Blueberry', 35, 1, 7, 5, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2763, N'Blueberry', 25, 2, 7, 5, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2764, N'Blueberry', 36, 8, 7, 5, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2765, N'Raspberry', 36, 18, 2, 1, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2766, N'Raspberry', 36, 11, 2, 1, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2767, N'Raspberry', 5, 5, 2, 1, 240)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2768, N'Apple', 22, 20, 20, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2769, N'Apple', 13, 2, 20, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2770, N'Apple', 31, 16, 20, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2771, N'Cherry', 20, 6, 10, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2772, N'Cherry', 28, 10, 10, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2773, N'Cherry', 5, 7, 10, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2774, N'Pineapple', 4, 4, 30, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2775, N'Pineapple', 22, 6, 30, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2776, N'Pineapple', 21, 18, 30, NULL, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2777, N'Blueberry', 13, 20, 7, 5, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2778, N'Blueberry', 25, 1, 7, 5, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2779, N'Blueberry', 16, 1, 7, 5, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2780, N'Raspberry', 30, 11, 2, 1, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2781, N'Raspberry', 30, 14, 2, 1, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2782, N'Raspberry', 10, 12, 2, 1, 241)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2783, N'Apple', 36, 6, 20, NULL, 242)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2784, N'Apple', 2, 6, 20, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2785, N'Apple', 25, 11, 20, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2786, N'Cherry', 10, 10, 10, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2787, N'Cherry', 28, 7, 10, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2788, N'Cherry', 25, 12, 10, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2789, N'Pineapple', 31, 6, 30, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2790, N'Pineapple', 21, 18, 30, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2791, N'Pineapple', 35, 14, 30, NULL, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2792, N'Blueberry', 35, 1, 7, 5, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2793, N'Blueberry', 25, 2, 7, 5, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2794, N'Blueberry', 36, 8, 7, 5, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2795, N'Raspberry', 36, 18, 2, 1, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2796, N'Raspberry', 36, 11, 2, 1, 243)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2797, N'Pineapple', 21, 18, 30, NULL, 244)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2798, N'Apple', 17, 4, 20, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2799, N'Apple', 18, 5, 20, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2800, N'Apple', 14, 2, 20, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2801, N'Cherry', 5, 7, 10, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2802, N'Cherry', 19, 9, 10, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2803, N'Cherry', 9, 4, 10, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2804, N'Pineapple', 2, 1, 30, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2805, N'Pineapple', 5, 3, 30, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2806, N'Pineapple', 9, 5, 30, NULL, 245)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2807, N'Apple', 16, 4, 20, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2808, N'Apple', 29, 2, 20, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2809, N'Apple', 23, 10, 20, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2810, N'Cherry', 34, 5, 10, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2811, N'Cherry', 22, 8, 10, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2812, N'Cherry', 37, 3, 10, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2813, N'Pineapple', 37, 7, 30, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2814, N'Pineapple', 7, 7, 30, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2815, N'Pineapple', 14, 7, 30, NULL, 246)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2816, N'Apple', 32, 6, 20, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2817, N'Apple', 27, 8, 20, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2818, N'Apple', 3, 4, 20, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2819, N'Cherry', 21, 7, 10, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2820, N'Cherry', 28, 4, 10, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2821, N'Cherry', 24, 5, 10, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2822, N'Pineapple', 31, 6, 30, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2823, N'Pineapple', 4, 5, 30, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2824, N'Pineapple', 40, 4, 30, NULL, 247)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2825, N'Apple', 29, 6, 20, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2826, N'Apple', 19, 4, 20, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2827, N'Apple', 6, 2, 20, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2828, N'Cherry', 2, 8, 10, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2829, N'Cherry', 38, 1, 10, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2830, N'Cherry', 24, 10, 10, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2831, N'Pineapple', 36, 4, 30, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2832, N'Pineapple', 37, 8, 30, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2833, N'Pineapple', 8, 6, 30, NULL, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2834, N'Blueberry', 19, 8, 7, 5, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2835, N'Blueberry', 4, 3, 7, 5, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2836, N'Blueberry', 31, 4, 7, 5, 248)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2837, N'Apple', 11, 4, 20, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2838, N'Apple', 20, 10, 20, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2839, N'Apple', 6, 10, 20, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2840, N'Cherry', 3, 1, 10, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2841, N'Cherry', 11, 20, 10, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2842, N'Cherry', 13, 7, 10, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2843, N'Pineapple', 27, 15, 30, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2844, N'Pineapple', 16, 10, 30, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2845, N'Pineapple', 6, 7, 30, NULL, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2846, N'Blueberry', 18, 11, 7, 5, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2847, N'Blueberry', 15, 7, 7, 5, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2848, N'Blueberry', 28, 8, 7, 5, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2849, N'Raspberry', 27, 8, 2, 1, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2850, N'Raspberry', 23, 16, 2, 1, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2851, N'Raspberry', 9, 4, 2, 1, 249)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2852, N'Apple', 37, 13, 20, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2853, N'Apple', 36, 17, 20, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2854, N'Apple', 1, 16, 20, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2855, N'Cherry', 34, 10, 10, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2856, N'Cherry', 31, 20, 10, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2857, N'Cherry', 6, 2, 10, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2858, N'Pineapple', 31, 10, 30, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2859, N'Pineapple', 6, 7, 30, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2860, N'Pineapple', 3, 8, 30, NULL, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2861, N'Blueberry', 3, 18, 7, 5, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2862, N'Blueberry', 23, 16, 7, 5, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2863, N'Blueberry', 23, 18, 7, 5, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2864, N'Raspberry', 7, 7, 2, 1, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2865, N'Raspberry', 9, 10, 2, 1, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2866, N'Raspberry', 22, 18, 2, 1, 250)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2867, N'Apple', 31, 9, 20, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2868, N'Apple', 24, 6, 20, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2869, N'Apple', 32, 19, 20, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2870, N'Cherry', 4, 15, 10, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2871, N'Cherry', 1, 10, 10, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2872, N'Cherry', 24, 1, 10, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2873, N'Pineapple', 30, 20, 30, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2874, N'Pineapple', 10, 5, 30, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2875, N'Pineapple', 16, 11, 30, NULL, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2876, N'Blueberry', 17, 11, 7, 5, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2877, N'Blueberry', 21, 19, 7, 5, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2878, N'Blueberry', 21, 12, 7, 5, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2879, N'Raspberry', 22, 17, 2, 1, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2880, N'Raspberry', 34, 17, 2, 1, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2881, N'Raspberry', 12, 8, 2, 1, 251)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2882, N'Apple', 5, 7, 20, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2883, N'Apple', 18, 2, 20, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2884, N'Cherry', 15, 6, 10, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2885, N'Cherry', 20, 3, 10, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2886, N'Pineapple', 19, 4, 30, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2887, N'Pineapple', 18, 10, 30, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2888, N'Pineapple', 16, 9, 30, NULL, 252)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2889, N'Apple', 5, 1, 20, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2890, N'Apple', 15, 9, 20, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2891, N'Apple', 2, 4, 20, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2892, N'Cherry', 1, 8, 10, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2893, N'Cherry', 11, 10, 10, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2894, N'Cherry', 14, 3, 10, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2895, N'Pineapple', 8, 9, 30, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2896, N'Pineapple', 17, 6, 30, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2897, N'Pineapple', 10, 1, 30, NULL, 253)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2898, N'Apple', 40, 9, 20, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2899, N'Apple', 22, 5, 20, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2900, N'Apple', 27, 6, 20, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2901, N'Cherry', 2, 1, 10, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2902, N'Cherry', 16, 10, 10, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2903, N'Cherry', 20, 3, 10, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2904, N'Pineapple', 40, 8, 30, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2905, N'Pineapple', 11, 4, 30, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2906, N'Pineapple', 9, 4, 30, NULL, 254)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2907, N'Apple', 39, 2, 20, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2908, N'Apple', 26, 10, 20, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2909, N'Apple', 28, 6, 20, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2910, N'Cherry', 20, 6, 10, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2911, N'Cherry', 19, 2, 10, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2912, N'Cherry', 12, 2, 10, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2913, N'Pineapple', 13, 10, 30, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2914, N'Pineapple', 10, 8, 30, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2915, N'Pineapple', 35, 1, 30, NULL, 255)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2916, N'Apple', 16, 4, 20, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2917, N'Apple', 40, 4, 20, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2918, N'Apple', 2, 5, 20, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2919, N'Cherry', 20, 2, 10, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2920, N'Cherry', 19, 3, 10, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2921, N'Cherry', 18, 8, 10, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2922, N'Pineapple', 23, 4, 30, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2923, N'Pineapple', 10, 1, 30, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2924, N'Pineapple', 7, 5, 30, NULL, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2925, N'Blueberry', 21, 3, 7, 5, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2926, N'Blueberry', 37, 4, 7, 5, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2927, N'Blueberry', 10, 6, 7, 5, 256)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2928, N'Apple', 4, 6, 20, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2929, N'Apple', 2, 7, 20, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2930, N'Apple', 28, 11, 20, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2931, N'Cherry', 36, 4, 10, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2932, N'Cherry', 40, 18, 10, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2933, N'Cherry', 24, 10, 10, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2934, N'Pineapple', 28, 5, 30, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2935, N'Pineapple', 5, 15, 30, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2936, N'Pineapple', 8, 12, 30, NULL, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2937, N'Blueberry', 40, 5, 7, 5, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2938, N'Blueberry', 27, 9, 7, 5, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2939, N'Blueberry', 20, 3, 7, 5, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2940, N'Raspberry', 22, 20, 2, 1, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2941, N'Raspberry', 24, 6, 2, 1, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2942, N'Raspberry', 8, 11, 2, 1, 257)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2943, N'Apple', 24, 2, 20, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2944, N'Apple', 32, 3, 20, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2945, N'Apple', 40, 20, 20, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2946, N'Cherry', 13, 7, 10, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2947, N'Cherry', 19, 13, 10, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2948, N'Cherry', 18, 3, 10, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2949, N'Pineapple', 28, 5, 30, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2950, N'Pineapple', 37, 9, 30, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2951, N'Pineapple', 4, 14, 30, NULL, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2952, N'Blueberry', 12, 14, 7, 5, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2953, N'Blueberry', 11, 15, 7, 5, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2954, N'Blueberry', 4, 5, 7, 5, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2955, N'Raspberry', 36, 10, 2, 1, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2956, N'Raspberry', 1, 1, 2, 1, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2957, N'Raspberry', 25, 4, 2, 1, 258)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2958, N'Apple', 34, 2, 20, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2959, N'Apple', 26, 9, 20, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2960, N'Apple', 4, 7, 20, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2961, N'Cherry', 9, 11, 10, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2962, N'Cherry', 13, 1, 10, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2963, N'Cherry', 8, 14, 10, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2964, N'Pineapple', 35, 12, 30, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2965, N'Pineapple', 23, 10, 30, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2966, N'Pineapple', 13, 11, 30, NULL, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2967, N'Blueberry', 12, 6, 7, 5, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2968, N'Blueberry', 9, 5, 7, 5, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2969, N'Blueberry', 38, 19, 7, 5, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2970, N'Raspberry', 33, 5, 2, 1, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2971, N'Raspberry', 22, 16, 2, 1, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2972, N'Raspberry', 5, 20, 2, 1, 259)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2973, N'Apple', 36, 6, 20, NULL, 260)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2974, N'Apple', 30, 9, 20, NULL, 260)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2975, N'Apple', 11, 10, 20, NULL, 260)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2976, N'Cherry', 31, 6, 10, NULL, 260)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2977, N'Cherry', 30, 5, 10, NULL, 260)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2978, N'Apple', 9, 3, 20, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2979, N'Apple', 9, 2, 20, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2980, N'Apple', 20, 5, 20, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2981, N'Cherry', 15, 7, 10, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2982, N'Cherry', 7, 10, 10, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2983, N'Cherry', 1, 4, 10, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2984, N'Pineapple', 1, 10, 30, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2985, N'Pineapple', 4, 4, 30, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2986, N'Pineapple', 3, 1, 30, NULL, 261)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2987, N'Apple', 1, 4, 20, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2988, N'Apple', 31, 9, 20, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2989, N'Apple', 9, 8, 20, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2990, N'Cherry', 27, 5, 10, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2991, N'Cherry', 40, 2, 10, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2992, N'Cherry', 16, 2, 10, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2993, N'Pineapple', 7, 8, 30, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2994, N'Pineapple', 16, 6, 30, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2995, N'Pineapple', 20, 8, 30, NULL, 262)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2996, N'Apple', 17, 1, 20, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2997, N'Apple', 19, 7, 20, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2998, N'Apple', 26, 1, 20, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (2999, N'Cherry', 33, 4, 10, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3000, N'Cherry', 10, 3, 10, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3001, N'Cherry', 31, 9, 10, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3002, N'Pineapple', 34, 2, 30, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3003, N'Pineapple', 12, 2, 30, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3004, N'Pineapple', 32, 6, 30, NULL, 263)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3005, N'Apple', 10, 4, 20, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3006, N'Apple', 26, 8, 20, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3007, N'Apple', 27, 10, 20, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3008, N'Cherry', 4, 2, 10, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3009, N'Cherry', 26, 10, 10, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3010, N'Cherry', 40, 1, 10, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3011, N'Pineapple', 3, 7, 30, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3012, N'Pineapple', 8, 2, 30, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3013, N'Pineapple', 23, 1, 30, NULL, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3014, N'Blueberry', 1, 1, 7, 5, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3015, N'Blueberry', 29, 7, 7, 5, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3016, N'Blueberry', 8, 8, 7, 5, 264)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3017, N'Apple', 35, 5, 20, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3018, N'Apple', 24, 10, 20, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3019, N'Apple', 13, 17, 20, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3020, N'Cherry', 32, 11, 10, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3021, N'Cherry', 31, 3, 10, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3022, N'Cherry', 20, 19, 10, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3023, N'Pineapple', 18, 16, 30, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3024, N'Pineapple', 1, 19, 30, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3025, N'Pineapple', 32, 19, 30, NULL, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3026, N'Blueberry', 30, 20, 7, 5, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3027, N'Blueberry', 3, 18, 7, 5, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3028, N'Blueberry', 37, 15, 7, 5, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3029, N'Raspberry', 4, 5, 2, 1, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3030, N'Raspberry', 11, 4, 2, 1, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3031, N'Raspberry', 38, 19, 2, 1, 265)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3032, N'Apple', 25, 1, 20, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3033, N'Apple', 29, 9, 20, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3034, N'Apple', 7, 11, 20, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3035, N'Cherry', 36, 18, 10, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3036, N'Cherry', 13, 16, 10, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3037, N'Cherry', 5, 10, 10, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3038, N'Pineapple', 18, 10, 30, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3039, N'Pineapple', 20, 7, 30, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3040, N'Pineapple', 15, 9, 30, NULL, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3041, N'Blueberry', 15, 15, 7, 5, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3042, N'Blueberry', 37, 18, 7, 5, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3043, N'Blueberry', 31, 20, 7, 5, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3044, N'Raspberry', 28, 19, 2, 1, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3045, N'Raspberry', 30, 2, 2, 1, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3046, N'Raspberry', 22, 6, 2, 1, 266)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3047, N'Apple', 4, 14, 20, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3048, N'Apple', 2, 15, 20, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3049, N'Apple', 3, 1, 20, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3050, N'Cherry', 27, 14, 10, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3051, N'Cherry', 37, 4, 10, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3052, N'Cherry', 18, 12, 10, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3053, N'Pineapple', 11, 14, 30, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3054, N'Pineapple', 19, 7, 30, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3055, N'Pineapple', 33, 11, 30, NULL, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3056, N'Blueberry', 24, 14, 7, 5, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3057, N'Blueberry', 34, 2, 7, 5, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3058, N'Blueberry', 10, 19, 7, 5, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3059, N'Raspberry', 16, 1, 2, 1, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3060, N'Raspberry', 23, 15, 2, 1, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3061, N'Raspberry', 18, 9, 2, 1, 267)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3062, N'Apple', 6, 1, 20, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3063, N'Apple', 8, 10, 20, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3064, N'Apple', 15, 5, 20, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3065, N'Cherry', 15, 6, 10, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3066, N'Cherry', 20, 2, 10, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3067, N'Cherry', 4, 8, 10, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3068, N'Pineapple', 4, 10, 30, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3069, N'Pineapple', 11, 8, 30, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3070, N'Pineapple', 3, 7, 30, NULL, 268)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3071, N'Apple', 5, 7, 20, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3072, N'Apple', 20, 2, 20, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3073, N'Apple', 29, 2, 20, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3074, N'Cherry', 35, 7, 10, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3075, N'Cherry', 19, 3, 10, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3076, N'Cherry', 35, 5, 10, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3077, N'Pineapple', 7, 9, 30, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3078, N'Pineapple', 10, 8, 30, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3079, N'Pineapple', 11, 3, 30, NULL, 269)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3080, N'Apple', 35, 10, 20, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3081, N'Apple', 15, 4, 20, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3082, N'Apple', 24, 6, 20, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3083, N'Cherry', 28, 3, 10, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3084, N'Cherry', 19, 5, 10, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3085, N'Cherry', 2, 8, 10, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3086, N'Pineapple', 37, 7, 30, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3087, N'Pineapple', 6, 9, 30, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3088, N'Pineapple', 19, 3, 30, NULL, 270)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3089, N'Apple', 3, 8, 20, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3090, N'Apple', 36, 10, 20, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3091, N'Apple', 1, 6, 20, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3092, N'Cherry', 28, 4, 10, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3093, N'Cherry', 17, 9, 10, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3094, N'Cherry', 10, 7, 10, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3095, N'Pineapple', 23, 6, 30, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3096, N'Pineapple', 38, 5, 30, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3097, N'Pineapple', 5, 1, 30, NULL, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3098, N'Blueberry', 16, 6, 7, 5, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3099, N'Blueberry', 2, 1, 7, 5, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3100, N'Blueberry', 16, 8, 7, 5, 271)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3101, N'Apple', 8, 14, 20, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3102, N'Apple', 4, 11, 20, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3103, N'Apple', 1, 8, 20, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3104, N'Cherry', 7, 4, 10, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3105, N'Cherry', 29, 9, 10, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3106, N'Cherry', 35, 5, 10, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3107, N'Pineapple', 25, 5, 30, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3108, N'Pineapple', 20, 4, 30, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3109, N'Pineapple', 11, 8, 30, NULL, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3110, N'Blueberry', 22, 12, 7, 5, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3111, N'Blueberry', 37, 9, 7, 5, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3112, N'Blueberry', 38, 19, 7, 5, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3113, N'Raspberry', 24, 20, 2, 1, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3114, N'Raspberry', 10, 20, 2, 1, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3115, N'Raspberry', 26, 4, 2, 1, 272)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3116, N'Apple', 18, 2, 20, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3117, N'Apple', 11, 10, 20, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3118, N'Apple', 5, 15, 20, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3119, N'Cherry', 2, 16, 10, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3120, N'Cherry', 37, 13, 10, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3121, N'Cherry', 24, 6, 10, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3122, N'Pineapple', 16, 3, 30, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3123, N'Pineapple', 39, 11, 30, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3124, N'Pineapple', 30, 8, 30, NULL, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3125, N'Blueberry', 1, 7, 7, 5, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3126, N'Blueberry', 17, 18, 7, 5, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3127, N'Blueberry', 14, 15, 7, 5, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3128, N'Raspberry', 15, 11, 2, 1, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3129, N'Raspberry', 8, 6, 2, 1, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3130, N'Raspberry', 20, 18, 2, 1, 273)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3131, N'Apple', 31, 7, 20, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3132, N'Apple', 19, 18, 20, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3133, N'Apple', 21, 15, 20, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3134, N'Cherry', 1, 8, 10, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3135, N'Cherry', 22, 7, 10, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3136, N'Cherry', 13, 17, 10, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3137, N'Pineapple', 28, 15, 30, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3138, N'Pineapple', 29, 15, 30, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3139, N'Pineapple', 20, 16, 30, NULL, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3140, N'Blueberry', 23, 10, 7, 5, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3141, N'Blueberry', 5, 19, 7, 5, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3142, N'Blueberry', 28, 3, 7, 5, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3143, N'Raspberry', 29, 8, 2, 1, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3144, N'Raspberry', 14, 13, 2, 1, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3145, N'Raspberry', 15, 19, 2, 1, 274)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3146, N'Apple', 36, 6, 20, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3147, N'Apple', 30, 9, 20, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3148, N'Apple', 11, 10, 20, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3149, N'Cherry', 31, 6, 10, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3150, N'Cherry', 3, 9, 10, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3151, N'Cherry', 30, 5, 10, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3152, N'Pineapple', 21, 6, 30, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3153, N'Pineapple', 8, 7, 30, NULL, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3154, N'Blueberry', 22, 5, 7, 5, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3155, N'Blueberry', 5, 10, 7, 5, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3156, N'Blueberry', 10, 8, 7, 5, 275)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3157, N'Apple', 2, 6, 20, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3158, N'Apple', 25, 11, 20, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3159, N'Apple', 4, 2, 20, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3160, N'Cherry', 10, 10, 10, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3161, N'Cherry', 28, 7, 10, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3162, N'Cherry', 25, 12, 10, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3163, N'Pineapple', 31, 6, 30, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3164, N'Pineapple', 21, 18, 30, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3165, N'Pineapple', 35, 14, 30, NULL, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3166, N'Blueberry', 35, 1, 7, 5, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3167, N'Blueberry', 25, 2, 7, 5, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3168, N'Blueberry', 36, 8, 7, 5, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3169, N'Raspberry', 36, 18, 2, 1, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3170, N'Raspberry', 36, 11, 2, 1, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3171, N'Raspberry', 5, 5, 2, 1, 276)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3172, N'Apple', 12, 9, 20, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3173, N'Apple', 9, 9, 20, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3174, N'Apple', 17, 8, 20, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3175, N'Cherry', 8, 3, 10, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3176, N'Cherry', 10, 4, 10, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3177, N'Cherry', 6, 2, 10, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3178, N'Pineapple', 1, 9, 30, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3179, N'Pineapple', 10, 3, 30, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3180, N'Pineapple', 5, 5, 30, NULL, 277)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3181, N'Apple', 2, 9, 20, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3182, N'Apple', 18, 2, 20, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3183, N'Apple', 36, 5, 20, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3184, N'Cherry', 28, 2, 10, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3185, N'Cherry', 6, 9, 10, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3186, N'Cherry', 11, 3, 10, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3187, N'Pineapple', 24, 2, 30, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3188, N'Pineapple', 24, 5, 30, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3189, N'Pineapple', 24, 1, 30, NULL, 278)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3190, N'Apple', 3, 4, 20, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3191, N'Apple', 11, 6, 20, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3192, N'Apple', 21, 1, 20, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3193, N'Cherry', 33, 3, 10, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3194, N'Cherry', 22, 6, 10, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3195, N'Cherry', 18, 7, 10, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3196, N'Pineapple', 35, 3, 30, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3197, N'Pineapple', 1, 3, 30, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3198, N'Pineapple', 17, 5, 30, NULL, 279)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3199, N'Apple', 13, 9, 20, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3200, N'Apple', 39, 5, 20, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3201, N'Apple', 7, 3, 20, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3202, N'Cherry', 8, 9, 10, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3203, N'Cherry', 37, 4, 10, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3204, N'Cherry', 35, 6, 10, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3205, N'Pineapple', 11, 2, 30, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3206, N'Pineapple', 20, 1, 30, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3207, N'Pineapple', 36, 2, 30, NULL, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3208, N'Blueberry', 39, 9, 7, 5, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3209, N'Blueberry', 34, 7, 7, 5, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3210, N'Blueberry', 19, 1, 7, 5, 280)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3211, N'Apple', 26, 11, 20, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3212, N'Apple', 5, 9, 20, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3213, N'Apple', 15, 7, 20, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3214, N'Cherry', 14, 1, 10, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3215, N'Cherry', 37, 7, 10, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3216, N'Cherry', 24, 20, 10, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3217, N'Pineapple', 32, 15, 30, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3218, N'Pineapple', 8, 11, 30, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3219, N'Pineapple', 17, 11, 30, NULL, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3220, N'Blueberry', 12, 13, 7, 5, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3221, N'Blueberry', 12, 9, 7, 5, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3222, N'Blueberry', 17, 12, 7, 5, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3223, N'Raspberry', 13, 5, 2, 1, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3224, N'Raspberry', 28, 10, 2, 1, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3225, N'Raspberry', 29, 1, 2, 1, 281)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3226, N'Apple', 18, 4, 20, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3227, N'Apple', 2, 17, 20, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3228, N'Apple', 6, 14, 20, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3229, N'Cherry', 19, 8, 10, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3230, N'Cherry', 37, 9, 10, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3231, N'Cherry', 14, 8, 10, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3232, N'Pineapple', 2, 13, 30, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3233, N'Pineapple', 14, 10, 30, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3234, N'Pineapple', 30, 12, 30, NULL, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3235, N'Blueberry', 19, 18, 7, 5, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3236, N'Blueberry', 22, 16, 7, 5, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3237, N'Blueberry', 7, 8, 7, 5, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3238, N'Raspberry', 16, 10, 2, 1, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3239, N'Raspberry', 17, 5, 2, 1, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3240, N'Raspberry', 24, 14, 2, 1, 282)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3241, N'Apple', 8, 11, 20, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3242, N'Apple', 5, 16, 20, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3243, N'Apple', 22, 3, 20, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3244, N'Cherry', 8, 18, 10, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3245, N'Cherry', 23, 6, 10, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3246, N'Cherry', 30, 18, 10, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3247, N'Pineapple', 22, 8, 30, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3248, N'Pineapple', 6, 13, 30, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3249, N'Pineapple', 40, 4, 30, NULL, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3250, N'Blueberry', 9, 9, 7, 5, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3251, N'Blueberry', 5, 13, 7, 5, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3252, N'Blueberry', 11, 1, 7, 5, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3253, N'Raspberry', 11, 13, 2, 1, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3254, N'Raspberry', 34, 15, 2, 1, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3255, N'Raspberry', 15, 3, 2, 1, 283)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3256, N'Apple', 12, 10, 20, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3257, N'Apple', 2, 9, 20, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3258, N'Apple', 17, 7, 20, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3259, N'Cherry', 11, 9, 10, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3260, N'Cherry', 10, 9, 10, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3261, N'Cherry', 5, 5, 10, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3262, N'Pineapple', 19, 5, 30, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3263, N'Pineapple', 4, 10, 30, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3264, N'Pineapple', 1, 6, 30, NULL, 284)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3265, N'Apple', 10, 6, 20, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3266, N'Apple', 1, 2, 20, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3267, N'Apple', 20, 4, 20, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3268, N'Cherry', 31, 3, 10, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3269, N'Cherry', 20, 6, 10, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3270, N'Cherry', 19, 8, 10, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3271, N'Pineapple', 36, 3, 30, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3272, N'Pineapple', 25, 8, 30, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3273, N'Pineapple', 36, 1, 30, NULL, 285)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3274, N'Apple', 13, 9, 20, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3275, N'Apple', 27, 8, 20, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3276, N'Apple', 21, 8, 20, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3277, N'Cherry', 20, 3, 10, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3278, N'Cherry', 11, 4, 10, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3279, N'Cherry', 16, 5, 10, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3280, N'Pineapple', 36, 5, 30, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3281, N'Pineapple', 17, 9, 30, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3282, N'Pineapple', 32, 5, 30, NULL, 286)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3283, N'Apple', 3, 3, 20, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3284, N'Apple', 22, 5, 20, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3285, N'Apple', 26, 9, 20, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3286, N'Cherry', 30, 10, 10, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3287, N'Cherry', 26, 3, 10, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3288, N'Cherry', 7, 1, 10, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3289, N'Pineapple', 30, 1, 30, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3290, N'Pineapple', 16, 9, 30, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3291, N'Pineapple', 8, 9, 30, NULL, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3292, N'Blueberry', 33, 3, 7, 5, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3293, N'Blueberry', 34, 10, 7, 5, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3294, N'Blueberry', 19, 4, 7, 5, 287)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3295, N'Apple', 9, 4, 20, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3296, N'Apple', 19, 13, 20, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3297, N'Apple', 5, 3, 20, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3298, N'Cherry', 30, 5, 10, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3299, N'Cherry', 16, 14, 10, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3300, N'Cherry', 35, 9, 10, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3301, N'Pineapple', 30, 4, 30, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3302, N'Pineapple', 34, 1, 30, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3303, N'Pineapple', 38, 8, 30, NULL, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3304, N'Blueberry', 11, 12, 7, 5, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3305, N'Blueberry', 13, 11, 7, 5, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3306, N'Blueberry', 2, 14, 7, 5, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3307, N'Raspberry', 31, 4, 2, 1, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3308, N'Raspberry', 11, 8, 2, 1, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3309, N'Raspberry', 9, 5, 2, 1, 288)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3310, N'Apple', 20, 14, 20, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3311, N'Apple', 15, 20, 20, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3312, N'Apple', 18, 18, 20, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3313, N'Cherry', 7, 1, 10, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3314, N'Cherry', 31, 13, 10, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3315, N'Cherry', 14, 9, 10, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3316, N'Pineapple', 17, 3, 30, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3317, N'Pineapple', 10, 12, 30, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3318, N'Pineapple', 4, 15, 30, NULL, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3319, N'Blueberry', 3, 15, 7, 5, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3320, N'Blueberry', 2, 5, 7, 5, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3321, N'Blueberry', 8, 7, 7, 5, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3322, N'Raspberry', 40, 3, 2, 1, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3323, N'Raspberry', 30, 6, 2, 1, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3324, N'Raspberry', 5, 15, 2, 1, 289)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3325, N'Apple', 30, 11, 20, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3326, N'Apple', 11, 20, 20, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3327, N'Apple', 1, 15, 20, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3328, N'Cherry', 2, 20, 10, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3329, N'Cherry', 26, 16, 10, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3330, N'Cherry', 21, 17, 10, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3331, N'Pineapple', 3, 8, 30, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3332, N'Pineapple', 33, 14, 30, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3333, N'Pineapple', 23, 20, 30, NULL, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3334, N'Blueberry', 25, 1, 7, 5, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3335, N'Blueberry', 33, 5, 7, 5, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3336, N'Blueberry', 30, 14, 7, 5, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3337, N'Raspberry', 15, 2, 2, 1, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3338, N'Raspberry', 24, 4, 2, 1, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3339, N'Raspberry', 40, 3, 2, 1, 290)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3340, N'Apple', 16, 4, 20, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3341, N'Apple', 17, 8, 20, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3342, N'Apple', 3, 4, 20, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3343, N'Cherry', 5, 7, 10, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3344, N'Cherry', 1, 10, 10, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3345, N'Cherry', 9, 3, 10, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3346, N'Pineapple', 6, 5, 30, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3347, N'Pineapple', 1, 6, 30, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3348, N'Pineapple', 11, 8, 30, NULL, 291)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3349, N'Apple', 7, 3, 20, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3350, N'Apple', 3, 1, 20, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3351, N'Apple', 35, 2, 20, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3352, N'Cherry', 16, 3, 10, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3353, N'Cherry', 34, 3, 10, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3354, N'Cherry', 31, 2, 10, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3355, N'Pineapple', 6, 7, 30, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3356, N'Pineapple', 22, 2, 30, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3357, N'Pineapple', 5, 5, 30, NULL, 292)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3358, N'Apple', 20, 7, 20, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3359, N'Apple', 6, 9, 20, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3360, N'Apple', 16, 2, 20, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3361, N'Cherry', 27, 9, 10, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3362, N'Cherry', 38, 2, 10, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3363, N'Cherry', 19, 5, 10, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3364, N'Pineapple', 30, 10, 30, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3365, N'Pineapple', 15, 1, 30, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3366, N'Pineapple', 19, 7, 30, NULL, 293)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3367, N'Apple', 15, 2, 20, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3368, N'Apple', 27, 1, 20, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3369, N'Apple', 23, 4, 20, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3370, N'Cherry', 12, 5, 10, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3371, N'Cherry', 8, 10, 10, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3372, N'Cherry', 10, 2, 10, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3373, N'Pineapple', 1, 8, 30, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3374, N'Pineapple', 24, 9, 30, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3375, N'Pineapple', 40, 2, 30, NULL, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3376, N'Blueberry', 14, 6, 7, 5, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3377, N'Blueberry', 10, 1, 7, 5, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3378, N'Blueberry', 20, 10, 7, 5, 294)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3379, N'Apple', 7, 18, 20, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3380, N'Apple', 4, 1, 20, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3381, N'Apple', 34, 3, 20, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3382, N'Cherry', 8, 16, 10, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3383, N'Cherry', 8, 12, 10, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3384, N'Cherry', 38, 2, 10, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3385, N'Pineapple', 21, 11, 30, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3386, N'Pineapple', 4, 15, 30, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3387, N'Pineapple', 22, 17, 30, NULL, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3388, N'Blueberry', 34, 9, 7, 5, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3389, N'Blueberry', 5, 11, 7, 5, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3390, N'Blueberry', 33, 7, 7, 5, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3391, N'Raspberry', 7, 5, 2, 1, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3392, N'Raspberry', 8, 9, 2, 1, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3393, N'Raspberry', 24, 12, 2, 1, 295)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3394, N'Apple', 29, 7, 20, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3395, N'Apple', 9, 16, 20, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3396, N'Apple', 8, 12, 20, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3397, N'Cherry', 21, 4, 10, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3398, N'Cherry', 31, 5, 10, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3399, N'Cherry', 22, 4, 10, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3400, N'Pineapple', 3, 19, 30, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3401, N'Pineapple', 22, 11, 30, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3402, N'Pineapple', 2, 16, 30, NULL, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3403, N'Blueberry', 28, 18, 7, 5, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3404, N'Blueberry', 36, 16, 7, 5, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3405, N'Blueberry', 22, 19, 7, 5, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3406, N'Raspberry', 38, 5, 2, 1, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3407, N'Raspberry', 10, 6, 2, 1, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3408, N'Raspberry', 34, 15, 2, 1, 296)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3409, N'Apple', 27, 14, 20, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3410, N'Apple', 6, 19, 20, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3411, N'Apple', 11, 20, 20, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3412, N'Cherry', 32, 2, 10, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3413, N'Cherry', 17, 18, 10, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3414, N'Cherry', 13, 13, 10, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3415, N'Pineapple', 25, 18, 30, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3416, N'Pineapple', 38, 14, 30, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3417, N'Pineapple', 30, 12, 30, NULL, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3418, N'Blueberry', 7, 2, 7, 5, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3419, N'Blueberry', 21, 2, 7, 5, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3420, N'Blueberry', 28, 17, 7, 5, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3421, N'Raspberry', 14, 1, 2, 1, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3422, N'Raspberry', 24, 7, 2, 1, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3423, N'Raspberry', 10, 5, 2, 1, 297)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3424, N'Apple', 2, 6, 20, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3425, N'Apple', 25, 11, 20, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3426, N'Apple', 4, 2, 20, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3427, N'Cherry', 25, 12, 10, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3428, N'Pineapple', 31, 6, 30, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3429, N'Pineapple', 21, 18, 30, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3430, N'Pineapple', 35, 14, 30, NULL, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3431, N'Blueberry', 25, 2, 7, 5, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3432, N'Blueberry', 36, 8, 7, 5, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3433, N'Raspberry', 36, 18, 2, 1, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3434, N'Raspberry', 36, 11, 2, 1, 298)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3435, N'Apple', 13, 3, 20, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3436, N'Apple', 7, 2, 20, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3437, N'Apple', 16, 6, 20, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3438, N'Cherry', 6, 9, 10, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3439, N'Cherry', 12, 1, 10, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3440, N'Cherry', 14, 7, 10, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3441, N'Pineapple', 7, 3, 30, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3442, N'Pineapple', 2, 8, 30, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3443, N'Pineapple', 4, 5, 30, NULL, 299)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3444, N'Apple', 16, 2, 20, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3445, N'Apple', 5, 1, 20, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3446, N'Apple', 34, 5, 20, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3447, N'Cherry', 5, 3, 10, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3448, N'Cherry', 3, 2, 10, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3449, N'Cherry', 25, 10, 10, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3450, N'Pineapple', 28, 4, 30, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3451, N'Pineapple', 26, 5, 30, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3452, N'Pineapple', 28, 5, 30, NULL, 300)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3453, N'Apple', 20, 7, 20, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3454, N'Apple', 40, 7, 20, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3455, N'Apple', 39, 2, 20, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3456, N'Cherry', 21, 6, 10, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3457, N'Cherry', 6, 9, 10, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3458, N'Cherry', 17, 10, 10, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3459, N'Pineapple', 5, 2, 30, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3460, N'Pineapple', 14, 10, 30, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3461, N'Pineapple', 8, 4, 30, NULL, 301)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3462, N'Apple', 7, 4, 20, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3463, N'Apple', 40, 10, 20, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3464, N'Apple', 8, 1, 20, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3465, N'Cherry', 12, 1, 10, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3466, N'Cherry', 12, 5, 10, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3467, N'Cherry', 15, 2, 10, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3468, N'Pineapple', 16, 8, 30, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3469, N'Pineapple', 21, 6, 30, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3470, N'Pineapple', 38, 4, 30, NULL, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3471, N'Blueberry', 15, 10, 7, 5, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3472, N'Blueberry', 15, 4, 7, 5, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3473, N'Blueberry', 12, 9, 7, 5, 302)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3474, N'Apple', 19, 11, 20, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3475, N'Apple', 2, 11, 20, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3476, N'Apple', 21, 7, 20, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3477, N'Cherry', 18, 16, 10, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3478, N'Cherry', 34, 11, 10, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3479, N'Cherry', 13, 17, 10, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3480, N'Pineapple', 29, 16, 30, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3481, N'Pineapple', 36, 6, 30, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3482, N'Pineapple', 8, 9, 30, NULL, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3483, N'Blueberry', 19, 10, 7, 5, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3484, N'Blueberry', 40, 13, 7, 5, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3485, N'Blueberry', 14, 9, 7, 5, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3486, N'Raspberry', 16, 7, 2, 1, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3487, N'Raspberry', 12, 5, 2, 1, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3488, N'Raspberry', 27, 19, 2, 1, 303)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3489, N'Apple', 22, 2, 20, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3490, N'Apple', 35, 5, 20, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3491, N'Apple', 17, 13, 20, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3492, N'Cherry', 30, 13, 10, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3493, N'Cherry', 20, 18, 10, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3494, N'Cherry', 20, 9, 10, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3495, N'Pineapple', 39, 15, 30, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3496, N'Pineapple', 17, 9, 30, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3497, N'Pineapple', 38, 6, 30, NULL, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3498, N'Blueberry', 23, 7, 7, 5, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3499, N'Blueberry', 3, 11, 7, 5, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3500, N'Blueberry', 21, 17, 7, 5, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3501, N'Raspberry', 25, 4, 2, 1, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3502, N'Raspberry', 2, 2, 2, 1, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3503, N'Raspberry', 27, 7, 2, 1, 304)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3504, N'Apple', 23, 18, 20, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3505, N'Apple', 30, 13, 20, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3506, N'Apple', 25, 19, 20, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3507, N'Cherry', 4, 3, 10, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3508, N'Cherry', 24, 12, 10, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3509, N'Cherry', 31, 7, 10, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3510, N'Pineapple', 8, 2, 30, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3511, N'Pineapple', 35, 6, 30, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3512, N'Pineapple', 34, 19, 30, NULL, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3513, N'Blueberry', 17, 1, 7, 5, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3514, N'Blueberry', 18, 11, 7, 5, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3515, N'Blueberry', 17, 12, 7, 5, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3516, N'Raspberry', 13, 18, 2, 1, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3517, N'Raspberry', 16, 10, 2, 1, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3518, N'Raspberry', 22, 17, 2, 1, 305)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3519, N'Apple', 5, 7, 20, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3520, N'Apple', 8, 3, 20, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3521, N'Apple', 18, 2, 20, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3522, N'Cherry', 15, 6, 10, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3523, N'Cherry', 9, 3, 10, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3524, N'Cherry', 20, 3, 10, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3525, N'Pineapple', 19, 4, 30, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3526, N'Pineapple', 18, 10, 30, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3527, N'Pineapple', 16, 9, 30, NULL, 306)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3528, N'Apple', 9, 3, 20, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3529, N'Apple', 17, 9, 20, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3530, N'Apple', 15, 3, 20, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3531, N'Cherry', 17, 1, 10, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3532, N'Cherry', 9, 5, 10, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3533, N'Cherry', 20, 2, 10, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3534, N'Pineapple', 12, 3, 30, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3535, N'Pineapple', 9, 2, 30, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3536, N'Pineapple', 1, 10, 30, NULL, 307)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3537, N'Apple', 1, 8, 20, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3538, N'Apple', 10, 10, 20, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3539, N'Apple', 37, 6, 20, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3540, N'Cherry', 31, 10, 10, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3541, N'Cherry', 21, 3, 10, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3542, N'Cherry', 17, 5, 10, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3543, N'Pineapple', 30, 4, 30, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3544, N'Pineapple', 9, 5, 30, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3545, N'Pineapple', 30, 1, 30, NULL, 308)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3546, N'Apple', 32, 7, 20, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3547, N'Apple', 13, 5, 20, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3548, N'Apple', 6, 7, 20, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3549, N'Cherry', 23, 7, 10, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3550, N'Cherry', 30, 8, 10, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3551, N'Cherry', 39, 9, 10, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3552, N'Pineapple', 17, 2, 30, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3553, N'Pineapple', 10, 8, 30, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3554, N'Pineapple', 15, 9, 30, NULL, 309)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3555, N'Apple', 37, 9, 20, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3556, N'Apple', 11, 4, 20, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3557, N'Apple', 10, 5, 20, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3558, N'Cherry', 15, 7, 10, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3559, N'Cherry', 13, 8, 10, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3560, N'Cherry', 6, 1, 10, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3561, N'Pineapple', 3, 4, 30, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3562, N'Pineapple', 20, 6, 30, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3563, N'Pineapple', 14, 8, 30, NULL, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3564, N'Blueberry', 11, 7, 7, 5, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3565, N'Blueberry', 30, 4, 7, 5, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3566, N'Blueberry', 26, 1, 7, 5, 310)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3567, N'Apple', 23, 20, 20, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3568, N'Apple', 15, 17, 20, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3569, N'Apple', 9, 7, 20, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3570, N'Cherry', 34, 3, 10, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3571, N'Cherry', 5, 7, 10, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3572, N'Cherry', 14, 8, 10, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3573, N'Pineapple', 13, 8, 30, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3574, N'Pineapple', 19, 19, 30, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3575, N'Pineapple', 27, 12, 30, NULL, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3576, N'Blueberry', 10, 12, 7, 5, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3577, N'Blueberry', 23, 2, 7, 5, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3578, N'Blueberry', 2, 5, 7, 5, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3579, N'Raspberry', 22, 19, 2, 1, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3580, N'Raspberry', 18, 12, 2, 1, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3581, N'Raspberry', 26, 13, 2, 1, 311)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3582, N'Apple', 13, 3, 20, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3583, N'Apple', 24, 1, 20, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3584, N'Apple', 10, 4, 20, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3585, N'Cherry', 22, 15, 10, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3586, N'Cherry', 5, 16, 10, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3587, N'Cherry', 2, 11, 10, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3588, N'Pineapple', 16, 19, 30, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3589, N'Pineapple', 39, 20, 30, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3590, N'Pineapple', 36, 16, 30, NULL, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3591, N'Blueberry', 4, 19, 7, 5, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3592, N'Blueberry', 23, 14, 7, 5, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3593, N'Blueberry', 17, 5, 7, 5, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3594, N'Raspberry', 34, 5, 2, 1, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3595, N'Raspberry', 26, 6, 2, 1, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3596, N'Raspberry', 24, 8, 2, 1, 312)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3597, N'Apple', 17, 7, 20, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3598, N'Apple', 7, 20, 20, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3599, N'Apple', 9, 11, 20, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3600, N'Cherry', 30, 16, 10, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3601, N'Cherry', 9, 18, 10, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3602, N'Cherry', 6, 3, 10, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3603, N'Pineapple', 15, 10, 30, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3604, N'Pineapple', 15, 5, 30, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3605, N'Pineapple', 5, 5, 30, NULL, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3606, N'Blueberry', 18, 13, 7, 5, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3607, N'Blueberry', 11, 13, 7, 5, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3608, N'Blueberry', 13, 6, 7, 5, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3609, N'Raspberry', 8, 18, 2, 1, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3610, N'Raspberry', 23, 10, 2, 1, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3611, N'Raspberry', 35, 13, 2, 1, 313)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3612, N'Apple', 8, 8, 20, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3613, N'Apple', 9, 6, 20, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3614, N'Apple', 5, 7, 20, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3615, N'Cherry', 2, 6, 10, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3616, N'Cherry', 14, 8, 10, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3617, N'Cherry', 13, 10, 10, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3618, N'Pineapple', 9, 3, 30, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3619, N'Pineapple', 15, 10, 30, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3620, N'Pineapple', 5, 5, 30, NULL, 314)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3621, N'Apple', 17, 2, 20, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3622, N'Apple', 28, 4, 20, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3623, N'Apple', 1, 8, 20, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3624, N'Cherry', 11, 8, 10, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3625, N'Cherry', 5, 6, 10, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3626, N'Cherry', 20, 7, 10, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3627, N'Pineapple', 1, 9, 30, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3628, N'Pineapple', 28, 9, 30, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3629, N'Pineapple', 10, 8, 30, NULL, 315)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3630, N'Apple', 16, 6, 20, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3631, N'Apple', 9, 5, 20, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3632, N'Apple', 14, 9, 20, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3633, N'Cherry', 32, 8, 10, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3634, N'Cherry', 40, 9, 10, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3635, N'Cherry', 23, 9, 10, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3636, N'Pineapple', 12, 2, 30, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3637, N'Pineapple', 29, 2, 30, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3638, N'Pineapple', 25, 5, 30, NULL, 316)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3639, N'Apple', 19, 4, 20, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3640, N'Apple', 30, 4, 20, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3641, N'Apple', 11, 4, 20, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3642, N'Cherry', 40, 9, 10, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3643, N'Cherry', 39, 6, 10, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3644, N'Cherry', 5, 10, 10, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3645, N'Pineapple', 16, 10, 30, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3646, N'Pineapple', 38, 3, 30, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3647, N'Pineapple', 18, 8, 30, NULL, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3648, N'Blueberry', 33, 5, 7, 5, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3649, N'Blueberry', 14, 7, 7, 5, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3650, N'Blueberry', 23, 4, 7, 5, 317)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3651, N'Apple', 27, 18, 20, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3652, N'Apple', 13, 10, 20, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3653, N'Apple', 40, 19, 20, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3654, N'Cherry', 16, 19, 10, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3655, N'Cherry', 20, 8, 10, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3656, N'Cherry', 39, 6, 10, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3657, N'Pineapple', 29, 3, 30, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3658, N'Pineapple', 26, 5, 30, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3659, N'Pineapple', 38, 16, 30, NULL, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3660, N'Blueberry', 11, 16, 7, 5, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3661, N'Blueberry', 25, 3, 7, 5, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3662, N'Blueberry', 22, 11, 7, 5, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3663, N'Raspberry', 15, 7, 2, 1, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3664, N'Raspberry', 27, 10, 2, 1, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3665, N'Raspberry', 29, 14, 2, 1, 318)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3666, N'Apple', 11, 13, 20, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3667, N'Apple', 34, 17, 20, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3668, N'Apple', 15, 16, 20, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3669, N'Cherry', 20, 2, 10, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3670, N'Cherry', 40, 18, 10, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3671, N'Cherry', 20, 7, 10, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3672, N'Pineapple', 39, 14, 30, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3673, N'Pineapple', 11, 15, 30, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3674, N'Pineapple', 18, 1, 30, NULL, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3675, N'Blueberry', 23, 2, 7, 5, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3676, N'Blueberry', 6, 5, 7, 5, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3677, N'Blueberry', 4, 13, 7, 5, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3678, N'Raspberry', 38, 2, 2, 1, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3679, N'Raspberry', 24, 19, 2, 1, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3680, N'Raspberry', 9, 17, 2, 1, 319)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3681, N'Apple', 32, 1, 20, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3682, N'Apple', 7, 6, 20, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3683, N'Apple', 28, 13, 20, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3684, N'Cherry', 19, 4, 10, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3685, N'Cherry', 26, 13, 10, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3686, N'Cherry', 34, 3, 10, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3687, N'Pineapple', 36, 15, 30, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3688, N'Pineapple', 8, 18, 30, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3689, N'Pineapple', 8, 7, 30, NULL, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3690, N'Blueberry', 22, 20, 7, 5, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3691, N'Blueberry', 5, 8, 7, 5, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3692, N'Blueberry', 21, 11, 7, 5, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3693, N'Raspberry', 10, 17, 2, 1, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3694, N'Raspberry', 3, 9, 2, 1, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3695, N'Raspberry', 6, 14, 2, 1, 320)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3696, N'Apple', 18, 8, 20, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3697, N'Apple', 3, 9, 20, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3698, N'Apple', 18, 10, 20, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3699, N'Cherry', 6, 1, 10, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3700, N'Cherry', 15, 10, 10, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3701, N'Cherry', 17, 10, 10, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3702, N'Pineapple', 15, 9, 30, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3703, N'Pineapple', 12, 6, 30, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3704, N'Pineapple', 10, 10, 30, NULL, 321)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3705, N'Apple', 2, 5, 20, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3706, N'Apple', 3, 9, 20, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3707, N'Apple', 34, 4, 20, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3708, N'Cherry', 38, 6, 10, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3709, N'Cherry', 27, 5, 10, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3710, N'Cherry', 4, 3, 10, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3711, N'Pineapple', 13, 1, 30, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3712, N'Pineapple', 16, 4, 30, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3713, N'Pineapple', 2, 9, 30, NULL, 322)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3714, N'Apple', 3, 10, 20, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3715, N'Apple', 23, 5, 20, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3716, N'Apple', 14, 5, 20, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3717, N'Cherry', 35, 10, 10, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3718, N'Cherry', 33, 6, 10, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3719, N'Cherry', 37, 9, 10, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3720, N'Pineapple', 3, 6, 30, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3721, N'Pineapple', 20, 3, 30, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3722, N'Pineapple', 11, 10, 30, NULL, 323)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3723, N'Apple', 26, 5, 20, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3724, N'Apple', 38, 4, 20, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3725, N'Apple', 24, 1, 20, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3726, N'Cherry', 37, 7, 10, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3727, N'Cherry', 10, 3, 10, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3728, N'Cherry', 5, 7, 10, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3729, N'Pineapple', 14, 4, 30, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3730, N'Pineapple', 20, 1, 30, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3731, N'Pineapple', 28, 2, 30, NULL, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3732, N'Blueberry', 11, 1, 7, 5, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3733, N'Blueberry', 3, 5, 7, 5, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3734, N'Blueberry', 16, 6, 7, 5, 324)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3735, N'Apple', 17, 18, 20, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3736, N'Apple', 29, 20, 20, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3737, N'Apple', 4, 13, 20, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3738, N'Cherry', 20, 6, 10, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3739, N'Cherry', 2, 3, 10, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3740, N'Cherry', 24, 9, 10, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3741, N'Pineapple', 32, 7, 30, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3742, N'Pineapple', 13, 4, 30, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3743, N'Pineapple', 18, 4, 30, NULL, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3744, N'Blueberry', 18, 3, 7, 5, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3745, N'Blueberry', 26, 14, 7, 5, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3746, N'Blueberry', 26, 17, 7, 5, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3747, N'Raspberry', 27, 9, 2, 1, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3748, N'Raspberry', 6, 13, 2, 1, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3749, N'Raspberry', 21, 10, 2, 1, 325)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3750, N'Apple', 3, 20, 20, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3751, N'Apple', 18, 6, 20, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3752, N'Apple', 30, 6, 20, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3753, N'Cherry', 25, 3, 10, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3754, N'Cherry', 40, 10, 10, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3755, N'Cherry', 27, 11, 10, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3756, N'Pineapple', 22, 1, 30, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3757, N'Pineapple', 34, 7, 30, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3758, N'Pineapple', 11, 16, 30, NULL, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3759, N'Blueberry', 23, 8, 7, 5, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3760, N'Blueberry', 3, 8, 7, 5, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3761, N'Blueberry', 5, 4, 7, 5, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3762, N'Raspberry', 27, 14, 2, 1, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3763, N'Raspberry', 28, 18, 2, 1, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3764, N'Raspberry', 33, 1, 2, 1, 326)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3765, N'Apple', 32, 14, 20, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3766, N'Apple', 36, 3, 20, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3767, N'Apple', 16, 10, 20, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3768, N'Cherry', 39, 1, 10, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3769, N'Cherry', 3, 10, 10, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3770, N'Cherry', 8, 14, 10, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3771, N'Pineapple', 13, 2, 30, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3772, N'Pineapple', 18, 2, 30, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3773, N'Pineapple', 12, 5, 30, NULL, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3774, N'Blueberry', 32, 17, 7, 5, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3775, N'Blueberry', 17, 3, 7, 5, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3776, N'Blueberry', 28, 5, 7, 5, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3777, N'Raspberry', 15, 5, 2, 1, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3778, N'Raspberry', 21, 13, 2, 1, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3779, N'Raspberry', 4, 5, 2, 1, 327)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3780, N'Apple', 2, 5, 20, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3781, N'Apple', 4, 1, 20, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3782, N'Apple', 16, 10, 20, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3783, N'Cherry', 15, 6, 10, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3784, N'Cherry', 17, 7, 10, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3785, N'Cherry', 12, 6, 10, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3786, N'Pineapple', 6, 8, 30, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3787, N'Pineapple', 12, 8, 30, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3788, N'Pineapple', 14, 6, 30, NULL, 328)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3789, N'Apple', 32, 10, 20, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3790, N'Apple', 27, 1, 20, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3791, N'Apple', 30, 7, 20, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3792, N'Cherry', 6, 10, 10, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3793, N'Cherry', 36, 2, 10, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3794, N'Cherry', 3, 2, 10, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3795, N'Pineapple', 17, 5, 30, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3796, N'Pineapple', 20, 8, 30, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3797, N'Pineapple', 40, 5, 30, NULL, 329)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3798, N'Apple', 17, 8, 20, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3799, N'Apple', 3, 6, 20, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3800, N'Apple', 12, 5, 20, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3801, N'Cherry', 14, 9, 10, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3802, N'Cherry', 40, 1, 10, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3803, N'Cherry', 36, 9, 10, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3804, N'Pineapple', 22, 6, 30, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3805, N'Pineapple', 7, 7, 30, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3806, N'Pineapple', 22, 9, 30, NULL, 330)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3807, N'Apple', 5, 5, 20, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3808, N'Apple', 26, 9, 20, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3809, N'Apple', 35, 4, 20, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3810, N'Cherry', 37, 4, 10, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3811, N'Cherry', 27, 8, 10, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3812, N'Cherry', 33, 3, 10, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3813, N'Pineapple', 28, 1, 30, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3814, N'Pineapple', 35, 8, 30, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3815, N'Pineapple', 33, 2, 30, NULL, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3816, N'Blueberry', 28, 2, 7, 5, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3817, N'Blueberry', 3, 8, 7, 5, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3818, N'Blueberry', 20, 7, 7, 5, 331)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3819, N'Apple', 12, 5, 20, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3820, N'Apple', 13, 9, 20, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3821, N'Apple', 23, 18, 20, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3822, N'Cherry', 20, 15, 10, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3823, N'Cherry', 22, 7, 10, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3824, N'Cherry', 13, 12, 10, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3825, N'Pineapple', 4, 15, 30, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3826, N'Pineapple', 25, 11, 30, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3827, N'Pineapple', 9, 20, 30, NULL, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3828, N'Blueberry', 7, 13, 7, 5, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3829, N'Blueberry', 10, 15, 7, 5, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3830, N'Blueberry', 16, 8, 7, 5, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3831, N'Raspberry', 20, 9, 2, 1, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3832, N'Raspberry', 6, 6, 2, 1, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3833, N'Raspberry', 22, 19, 2, 1, 332)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3834, N'Apple', 12, 18, 20, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3835, N'Apple', 1, 1, 20, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3836, N'Apple', 38, 18, 20, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3837, N'Cherry', 14, 2, 10, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3838, N'Cherry', 17, 9, 10, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3839, N'Cherry', 11, 3, 10, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3840, N'Pineapple', 5, 19, 30, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3841, N'Pineapple', 13, 19, 30, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3842, N'Pineapple', 6, 19, 30, NULL, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3843, N'Blueberry', 27, 2, 7, 5, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3844, N'Blueberry', 25, 19, 7, 5, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3845, N'Blueberry', 15, 16, 7, 5, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3846, N'Raspberry', 24, 4, 2, 1, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3847, N'Raspberry', 10, 4, 2, 1, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3848, N'Raspberry', 40, 7, 2, 1, 333)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3849, N'Apple', 23, 7, 20, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3850, N'Apple', 12, 13, 20, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3851, N'Apple', 25, 16, 20, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3852, N'Cherry', 17, 4, 10, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3853, N'Cherry', 3, 13, 10, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3854, N'Cherry', 22, 16, 10, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3855, N'Pineapple', 12, 8, 30, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3856, N'Pineapple', 6, 7, 30, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3857, N'Pineapple', 23, 10, 30, NULL, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3858, N'Blueberry', 26, 15, 7, 5, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3859, N'Blueberry', 24, 13, 7, 5, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3860, N'Blueberry', 7, 14, 7, 5, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3861, N'Raspberry', 15, 2, 2, 1, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3862, N'Raspberry', 4, 3, 2, 1, 334)
GO
INSERT [dbo].[Benefits] ([GameObjectID], [Type], [X], [Y], [AmountOfEffect], [Effect], [MapID]) VALUES (3863, N'Raspberry', 11, 12, 2, 1, 334)
GO
SET IDENTITY_INSERT [dbo].[Benefits] OFF
GO
SET IDENTITY_INSERT [dbo].[BestPassage] ON 
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (80, N'danil', 66, 1, CAST(N'2022-02-10' AS Date), 235)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (81, N'danil', 74, 2, CAST(N'2022-02-10' AS Date), 236)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (82, N'danil', 95, 3, CAST(N'2022-02-10' AS Date), 237)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (83, N'danil', 121, 4, CAST(N'2022-02-10' AS Date), 238)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (84, N'danil', 140, 5, CAST(N'2022-02-10' AS Date), 239)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (85, N'danil', 136, 6, CAST(N'2022-02-10' AS Date), 240)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (86, N'danil', 500, 7, CAST(N'2022-02-10' AS Date), 241)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (106, N'vitya', 61, 1, CAST(N'2022-02-10' AS Date), 252)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (107, N'vitya', 84, 2, CAST(N'2022-02-10' AS Date), 236)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (108, N'vitya', 78, 1, CAST(N'2022-02-10' AS Date), 235)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (109, N'vitya', 95, 2, CAST(N'2022-02-10' AS Date), 236)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (110, N'vitya', 125, 3, CAST(N'2022-02-10' AS Date), 237)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (111, N'vitya', 104, 4, CAST(N'2022-02-10' AS Date), 238)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (112, N'mashsa', 76, 1, CAST(N'2022-02-10' AS Date), 235)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (113, N'mashsa', 87, 2, CAST(N'2022-02-10' AS Date), 236)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (114, N'mashsa', 81, 3, CAST(N'2022-02-10' AS Date), 237)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (115, N'mashsa', 104, 4, CAST(N'2022-02-10' AS Date), 238)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (116, N'mashsa', 194, 5, CAST(N'2022-02-10' AS Date), 239)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (117, N'mashsa', 139, 6, CAST(N'2022-02-10' AS Date), 240)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (118, N'danil', 140, 6, CAST(N'2022-02-10' AS Date), 244)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (119, N'danil', 153, 6, CAST(N'2022-02-10' AS Date), 240)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (120, N'danil', 247, 6, CAST(N'2022-02-10' AS Date), 240)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (121, N'danil', 138, 6, CAST(N'2022-02-10' AS Date), 244)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (122, N'danil', 196, 6, CAST(N'2022-02-10' AS Date), 240)
GO
INSERT [dbo].[BestPassage] ([BestPassageID], [Username], [Result], [DifficultyLevel], [DateOfPassage], [MapID]) VALUES (123, N'danil', 190, 6, CAST(N'2022-02-10' AS Date), 240)
GO
SET IDENTITY_INSERT [dbo].[BestPassage] OFF
GO
SET IDENTITY_INSERT [dbo].[GameLevels] ON 
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (214, 1, 235)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (215, 2, 236)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (216, 3, 237)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (217, 4, 238)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (218, 5, 239)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (219, 6, 240)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (220, 7, 241)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (221, 1, 245)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (222, 2, 246)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (223, 3, 247)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (224, 4, 248)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (225, 5, 249)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (226, 6, 250)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (227, 7, 251)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (228, 1, 253)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (229, 2, 254)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (230, 3, 255)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (231, 4, 256)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (232, 5, 257)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (233, 6, 258)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (234, 7, 259)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (235, 1, 261)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (236, 2, 262)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (237, 3, 263)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (238, 4, 264)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (239, 5, 265)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (240, 6, 266)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (241, 7, 267)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (242, 1, 268)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (243, 2, 269)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (244, 3, 270)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (245, 4, 271)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (246, 5, 272)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (247, 6, 273)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (248, 7, 274)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (249, 1, 277)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (250, 2, 278)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (251, 3, 279)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (252, 4, 280)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (253, 5, 281)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (254, 6, 282)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (255, 7, 283)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (256, 1, 284)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (257, 2, 285)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (258, 3, 286)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (259, 4, 287)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (260, 5, 288)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (261, 6, 289)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (262, 7, 290)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (263, 1, 291)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (264, 2, 292)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (265, 3, 293)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (266, 4, 294)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (267, 5, 295)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (268, 6, 296)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (269, 7, 297)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (270, 1, 299)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (271, 2, 300)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (272, 3, 301)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (273, 4, 302)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (274, 5, 303)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (275, 6, 304)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (276, 7, 305)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (277, 1, 307)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (278, 2, 308)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (279, 3, 309)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (280, 4, 310)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (281, 5, 311)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (282, 6, 312)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (283, 7, 313)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (284, 1, 314)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (285, 2, 315)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (286, 3, 316)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (287, 4, 317)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (288, 5, 318)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (289, 6, 319)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (290, 7, 320)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (291, 1, 321)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (292, 2, 322)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (293, 3, 323)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (294, 4, 324)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (295, 5, 325)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (296, 6, 326)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (297, 7, 327)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (298, 1, 328)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (299, 2, 329)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (300, 3, 330)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (301, 4, 331)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (302, 5, 332)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (303, 6, 333)
GO
INSERT [dbo].[GameLevels] ([LvlID], [DifficultyLevel], [MapID]) VALUES (304, 7, 334)
GO
SET IDENTITY_INSERT [dbo].[GameLevels] OFF
GO
SET IDENTITY_INSERT [dbo].[MapM] ON 
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (235, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (236, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (237, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (238, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (239, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (240, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (241, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (242, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (243, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (244, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (245, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (246, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (247, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (248, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (249, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (250, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (251, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (252, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (253, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (254, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (255, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (256, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (257, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (258, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (259, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (260, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (261, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (262, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (263, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (264, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (265, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (266, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (267, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (268, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (269, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (270, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (271, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (272, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (273, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (274, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (275, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (276, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (277, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (278, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (279, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (280, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (281, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (282, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (283, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (284, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (285, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (286, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (287, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (288, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (289, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (290, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (291, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (292, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (293, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (294, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (295, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (296, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (297, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (298, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (299, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (300, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (301, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (302, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (303, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (304, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (305, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (306, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (307, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (308, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (309, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (310, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (311, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (312, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (313, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (314, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (315, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (316, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (317, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (318, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (319, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (320, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (321, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (322, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (323, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (324, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (325, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (326, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (327, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (328, 10, 20)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (329, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (330, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (331, 10, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (332, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (333, 20, 40)
GO
INSERT [dbo].[MapM] ([MapID], [Height], [Width]) VALUES (334, 20, 40)
GO
SET IDENTITY_INSERT [dbo].[MapM] OFF
GO
SET IDENTITY_INSERT [dbo].[MovableObject] ON 
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1088, N'PlayerClass', 1, 1, 100, NULL, 0, 235)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1089, N'PlayerClass', 1, 1, 100, NULL, 0, 236)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1090, N'Wolf', 24, 9, 100, 30, 0, 236)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1091, N'Wolf', 32, 2, 100, 30, 0, 236)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1092, N'Wolf', 38, 7, 100, 30, 0, 236)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1093, N'PlayerClass', 1, 1, 100, NULL, 0, 237)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1094, N'Wolf', 13, 7, 100, 30, 0, 237)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1095, N'Wolf', 34, 7, 100, 30, 0, 237)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1096, N'Wolf', 22, 1, 100, 30, 0, 237)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1097, N'PlayerClass', 1, 1, 100, NULL, 0, 238)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1098, N'Wolf', 1, 6, 100, 30, 0, 238)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1099, N'Wolf', 18, 9, 100, 30, 0, 238)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1100, N'Wolf', 18, 10, 100, 30, 0, 238)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1101, N'PlayerClass', 1, 1, 100, NULL, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1102, N'Wolf', 22, 10, 100, 30, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1103, N'Wolf', 1, 17, 100, 30, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1104, N'Wolf', 16, 1, 100, 30, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1105, N'Bear', 32, 4, 100, 40, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1106, N'Bear', 38, 1, 100, 40, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1107, N'Bear', 21, 18, 100, 40, 0, 239)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1108, N'PlayerClass', 1, 1, 100, NULL, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1109, N'Wolf', 32, 7, 100, 30, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1110, N'Wolf', 18, 10, 100, 30, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1111, N'Wolf', 25, 8, 100, 30, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1112, N'Wolf', 5, 12, 100, 30, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1113, N'Fox', 30, 13, 100, 20, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1114, N'Fox', 24, 12, 100, 20, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1115, N'Fox', 30, 19, 100, 20, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1116, N'Fox', 9, 6, 100, 20, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1117, N'Bear', 19, 10, 100, 40, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1118, N'Bear', 8, 1, 100, 40, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1119, N'Bear', 8, 18, 100, 40, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1120, N'Bear', 27, 14, 100, 40, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1121, N'Bear', 34, 3, 100, 40, 0, 240)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1122, N'PlayerClass', 1, 1, 100, NULL, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1123, N'Wolf', 4, 7, 100, 30, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1124, N'Wolf', 16, 3, 100, 30, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1125, N'Wolf', 9, 15, 100, 30, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1126, N'Wolf', 34, 6, 100, 30, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1127, N'Fox', 2, 19, 100, 20, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1128, N'Fox', 30, 16, 100, 20, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1129, N'Fox', 28, 8, 100, 20, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1130, N'Fox', 38, 1, 100, 20, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1131, N'Bear', 9, 8, 100, 40, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1132, N'Bear', 8, 9, 100, 40, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1133, N'Bear', 26, 3, 100, 40, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1134, N'Bear', 10, 19, 100, 40, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1135, N'Bear', 36, 9, 100, 40, 0, 241)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1136, N'PlayerClass', 33, 9, 100, NULL, 0, 242)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1137, N'Wolf', 11, 6, 100, 30, 0, 242)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1138, N'Wolf', 20, 7, 100, 30, 0, 242)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1139, N'Wolf', 29, 6, 100, 30, 0, 242)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1140, N'PlayerClass', 5, 6, 100, NULL, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1141, N'Wolf', 29, 8, 100, 30, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1142, N'Wolf', 14, 15, 100, 30, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1143, N'Wolf', 25, 7, 100, 30, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1144, N'Wolf', 6, 15, 100, 30, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1145, N'Fox', 33, 13, 100, 20, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1146, N'Fox', 23, 11, 100, 20, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1147, N'Fox', 30, 19, 100, 20, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1148, N'Fox', 12, 4, 100, 20, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1149, N'Bear', 22, 14, 100, 40, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1150, N'Bear', 2, 1, 100, 40, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1151, N'Bear', 11, 17, 100, 40, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1152, N'Bear', 26, 17, 100, 40, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1153, N'Bear', 32, 3, 100, 40, 0, 243)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1154, N'PlayerClass', 31, 18, 100, NULL, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1155, N'Wolf', 26, 3, 100, 30, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1156, N'Wolf', 2, 14, 100, 30, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1157, N'Wolf', 32, 4, 100, 30, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1158, N'Wolf', 6, 16, 100, 30, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1159, N'Fox', 39, 16, 100, 20, 7, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1160, N'Fox', 19, 1, 100, 20, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1161, N'Fox', 26, 12, 100, 20, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1162, N'Fox', 14, 3, 100, 20, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1163, N'Bear', 9, 18, 100, 40, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1164, N'Bear', 1, 9, 100, 40, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1165, N'Bear', 33, 17, 100, 40, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1166, N'Bear', 34, 17, 100, 40, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1167, N'Bear', 37, 6, 100, 40, 0, 244)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1168, N'PlayerClass', 1, 1, 100, NULL, 0, 245)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1169, N'PlayerClass', 1, 1, 100, NULL, 0, 246)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1170, N'Wolf', 36, 3, 100, 30, 0, 246)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1171, N'Wolf', 18, 6, 100, 30, 0, 246)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1172, N'Wolf', 9, 10, 100, 30, 0, 246)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1173, N'PlayerClass', 1, 1, 100, NULL, 0, 247)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1174, N'Wolf', 5, 4, 100, 30, 0, 247)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1175, N'Wolf', 1, 2, 100, 30, 0, 247)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1176, N'Wolf', 24, 1, 100, 30, 0, 247)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1177, N'PlayerClass', 1, 1, 100, NULL, 0, 248)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1178, N'Wolf', 11, 8, 100, 30, 0, 248)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1179, N'Wolf', 10, 7, 100, 30, 0, 248)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1180, N'Wolf', 13, 8, 100, 30, 0, 248)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1181, N'PlayerClass', 1, 1, 100, NULL, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1182, N'Wolf', 28, 2, 100, 30, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1183, N'Wolf', 39, 13, 100, 30, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1184, N'Wolf', 27, 12, 100, 30, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1185, N'Bear', 12, 8, 100, 40, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1186, N'Bear', 18, 11, 100, 40, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1187, N'Bear', 6, 15, 100, 40, 0, 249)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1188, N'PlayerClass', 1, 1, 100, NULL, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1189, N'Wolf', 16, 3, 100, 30, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1190, N'Wolf', 31, 5, 100, 30, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1191, N'Wolf', 7, 6, 100, 30, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1192, N'Wolf', 38, 18, 100, 30, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1193, N'Fox', 33, 15, 100, 20, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1194, N'Fox', 4, 9, 100, 20, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1195, N'Fox', 23, 12, 100, 20, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1196, N'Fox', 36, 15, 100, 20, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1197, N'Bear', 34, 2, 100, 40, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1198, N'Bear', 31, 8, 100, 40, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1199, N'Bear', 23, 16, 100, 40, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1200, N'Bear', 15, 16, 100, 40, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1201, N'Bear', 35, 14, 100, 40, 0, 250)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1202, N'PlayerClass', 1, 1, 100, NULL, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1203, N'Wolf', 32, 14, 100, 30, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1204, N'Wolf', 31, 2, 100, 30, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1205, N'Wolf', 13, 6, 100, 30, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1206, N'Wolf', 7, 20, 100, 30, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1207, N'Fox', 19, 9, 100, 20, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1208, N'Fox', 6, 8, 100, 20, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1209, N'Fox', 4, 7, 100, 20, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1210, N'Fox', 7, 17, 100, 20, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1211, N'Bear', 8, 3, 100, 40, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1212, N'Bear', 17, 14, 100, 40, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1213, N'Bear', 14, 6, 100, 40, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1214, N'Bear', 29, 14, 100, 40, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1215, N'Bear', 5, 7, 100, 40, 0, 251)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1216, N'PlayerClass', 9, 3, 100, NULL, 0, 252)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1217, N'PlayerClass', 1, 1, 100, NULL, 0, 253)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1218, N'PlayerClass', 1, 1, 100, NULL, 0, 254)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1219, N'Wolf', 29, 4, 100, 30, 0, 254)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1220, N'Wolf', 37, 8, 100, 30, 0, 254)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1221, N'Wolf', 18, 5, 100, 30, 0, 254)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1222, N'PlayerClass', 1, 1, 100, NULL, 0, 255)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1223, N'Wolf', 36, 6, 100, 30, 0, 255)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1224, N'Wolf', 38, 9, 100, 30, 0, 255)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1225, N'Wolf', 37, 2, 100, 30, 0, 255)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1226, N'PlayerClass', 1, 1, 100, NULL, 0, 256)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1227, N'Wolf', 9, 8, 100, 30, 0, 256)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1228, N'Wolf', 2, 6, 100, 30, 0, 256)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1229, N'Wolf', 9, 7, 100, 30, 0, 256)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1230, N'PlayerClass', 1, 1, 100, NULL, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1231, N'Wolf', 3, 12, 100, 30, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1232, N'Wolf', 28, 1, 100, 30, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1233, N'Wolf', 27, 18, 100, 30, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1234, N'Bear', 21, 2, 100, 40, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1235, N'Bear', 17, 8, 100, 40, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1236, N'Bear', 29, 11, 100, 40, 0, 257)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1237, N'PlayerClass', 1, 1, 100, NULL, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1238, N'Wolf', 10, 5, 100, 30, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1239, N'Wolf', 4, 5, 100, 30, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1240, N'Wolf', 21, 20, 100, 30, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1241, N'Wolf', 10, 19, 100, 30, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1242, N'Fox', 36, 1, 100, 20, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1243, N'Fox', 3, 17, 100, 20, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1244, N'Fox', 14, 11, 100, 20, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1245, N'Fox', 14, 1, 100, 20, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1246, N'Bear', 28, 9, 100, 40, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1247, N'Bear', 19, 9, 100, 40, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1248, N'Bear', 14, 11, 100, 40, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1249, N'Bear', 36, 8, 100, 40, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1250, N'Bear', 22, 17, 100, 40, 0, 258)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1251, N'PlayerClass', 1, 1, 100, NULL, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1252, N'Wolf', 19, 12, 100, 30, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1253, N'Wolf', 5, 13, 100, 30, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1254, N'Wolf', 34, 12, 100, 30, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1255, N'Wolf', 33, 7, 100, 30, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1256, N'Fox', 17, 19, 100, 20, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1257, N'Fox', 29, 13, 100, 20, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1258, N'Fox', 26, 3, 100, 20, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1259, N'Fox', 34, 10, 100, 20, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1260, N'Bear', 34, 16, 100, 40, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1261, N'Bear', 18, 6, 100, 40, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1262, N'Bear', 14, 14, 100, 40, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1263, N'Bear', 24, 8, 100, 40, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1264, N'Bear', 17, 5, 100, 40, 0, 259)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1265, N'PlayerClass', 22, 6, 100, NULL, 0, 260)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1266, N'Wolf', 5, 4, 100, 30, 0, 260)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1267, N'Wolf', 8, 8, 100, 30, 0, 260)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1268, N'Wolf', 22, 5, 100, 30, 7, 260)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1269, N'PlayerClass', 1, 1, 100, NULL, 0, 261)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1270, N'PlayerClass', 1, 1, 100, NULL, 0, 262)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1271, N'Wolf', 40, 6, 100, 30, 0, 262)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1272, N'Wolf', 20, 3, 100, 30, 0, 262)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1273, N'Wolf', 11, 4, 100, 30, 0, 262)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1274, N'PlayerClass', 1, 1, 100, NULL, 0, 263)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1275, N'Wolf', 37, 4, 100, 30, 0, 263)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1276, N'Wolf', 23, 6, 100, 30, 0, 263)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1277, N'Wolf', 12, 2, 100, 30, 0, 263)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1278, N'PlayerClass', 1, 1, 100, NULL, 0, 264)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1279, N'Wolf', 17, 2, 100, 30, 0, 264)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1280, N'Wolf', 9, 5, 100, 30, 0, 264)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1281, N'Wolf', 19, 1, 100, 30, 0, 264)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1282, N'PlayerClass', 1, 1, 100, NULL, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1283, N'Wolf', 6, 18, 100, 30, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1284, N'Wolf', 10, 1, 100, 30, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1285, N'Wolf', 38, 2, 100, 30, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1286, N'Bear', 20, 17, 100, 40, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1287, N'Bear', 14, 7, 100, 40, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1288, N'Bear', 30, 2, 100, 40, 0, 265)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1289, N'PlayerClass', 1, 1, 100, NULL, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1290, N'Wolf', 11, 13, 100, 30, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1291, N'Wolf', 3, 4, 100, 30, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1292, N'Wolf', 8, 2, 100, 30, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1293, N'Wolf', 11, 17, 100, 30, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1294, N'Fox', 17, 5, 100, 20, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1295, N'Fox', 31, 19, 100, 20, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1296, N'Fox', 23, 19, 100, 20, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1297, N'Fox', 15, 16, 100, 20, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1298, N'Bear', 8, 1, 100, 40, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1299, N'Bear', 36, 18, 100, 40, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1300, N'Bear', 22, 17, 100, 40, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1301, N'Bear', 16, 17, 100, 40, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1302, N'Bear', 7, 9, 100, 40, 0, 266)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1303, N'PlayerClass', 1, 1, 100, NULL, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1304, N'Wolf', 16, 1, 100, 30, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1305, N'Wolf', 10, 3, 100, 30, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1306, N'Wolf', 14, 19, 100, 30, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1307, N'Wolf', 19, 15, 100, 30, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1308, N'Fox', 22, 17, 100, 20, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1309, N'Fox', 10, 20, 100, 20, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1310, N'Fox', 36, 6, 100, 20, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1311, N'Fox', 11, 11, 100, 20, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1312, N'Bear', 34, 15, 100, 40, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1313, N'Bear', 7, 6, 100, 40, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1314, N'Bear', 5, 8, 100, 40, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1315, N'Bear', 7, 15, 100, 40, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1316, N'Bear', 11, 19, 100, 40, 0, 267)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1317, N'PlayerClass', 1, 1, 100, NULL, 0, 268)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1318, N'PlayerClass', 1, 1, 100, NULL, 0, 269)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1319, N'Wolf', 22, 2, 100, 30, 0, 269)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1320, N'Wolf', 33, 4, 100, 30, 0, 269)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1321, N'Wolf', 7, 7, 100, 30, 0, 269)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1322, N'PlayerClass', 1, 1, 100, NULL, 0, 270)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1323, N'Wolf', 32, 8, 100, 30, 0, 270)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1324, N'Wolf', 8, 5, 100, 30, 0, 270)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1325, N'Wolf', 14, 2, 100, 30, 0, 270)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1326, N'PlayerClass', 1, 1, 100, NULL, 0, 271)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1327, N'Wolf', 13, 2, 100, 30, 0, 271)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1328, N'Wolf', 38, 7, 100, 30, 0, 271)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1329, N'Wolf', 16, 2, 100, 30, 0, 271)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1330, N'PlayerClass', 1, 1, 100, NULL, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1331, N'Wolf', 11, 14, 100, 30, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1332, N'Wolf', 19, 12, 100, 30, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1333, N'Wolf', 23, 1, 100, 30, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1334, N'Bear', 32, 12, 100, 40, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1335, N'Bear', 14, 2, 100, 40, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1336, N'Bear', 8, 2, 100, 40, 0, 272)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1337, N'PlayerClass', 1, 1, 100, NULL, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1338, N'Wolf', 12, 1, 100, 30, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1339, N'Wolf', 20, 5, 100, 30, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1340, N'Wolf', 12, 15, 100, 30, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1341, N'Wolf', 2, 12, 100, 30, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1342, N'Fox', 34, 3, 100, 20, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1343, N'Fox', 7, 10, 100, 20, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1344, N'Fox', 30, 17, 100, 20, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1345, N'Fox', 5, 5, 100, 20, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1346, N'Bear', 8, 12, 100, 40, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1347, N'Bear', 23, 6, 100, 40, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1348, N'Bear', 2, 5, 100, 40, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1349, N'Bear', 25, 9, 100, 40, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1350, N'Bear', 25, 4, 100, 40, 0, 273)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1351, N'PlayerClass', 1, 1, 100, NULL, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1352, N'Wolf', 8, 12, 100, 30, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1353, N'Wolf', 4, 1, 100, 30, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1354, N'Wolf', 31, 9, 100, 30, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1355, N'Wolf', 29, 16, 100, 30, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1356, N'Fox', 16, 3, 100, 20, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1357, N'Fox', 28, 8, 100, 20, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1358, N'Fox', 18, 6, 100, 20, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1359, N'Fox', 1, 9, 100, 20, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1360, N'Bear', 15, 1, 100, 40, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1361, N'Bear', 12, 18, 100, 40, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1362, N'Bear', 18, 10, 100, 40, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1363, N'Bear', 36, 8, 100, 40, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1364, N'Bear', 24, 15, 100, 40, 0, 274)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1365, N'PlayerClass', 5, 2, 100, NULL, 0, 275)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1366, N'Wolf', 3, 8, 100, 30, 0, 275)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1367, N'Wolf', 13, 5, 100, 30, 0, 275)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1368, N'Wolf', 19, 10, 100, 30, 0, 275)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1369, N'PlayerClass', 1, 1, 100, NULL, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1370, N'Wolf', 32, 7, 100, 30, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1371, N'Wolf', 18, 10, 100, 30, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1372, N'Wolf', 25, 8, 100, 30, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1373, N'Wolf', 5, 12, 100, 30, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1374, N'Fox', 30, 13, 100, 20, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1375, N'Fox', 24, 12, 100, 20, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1376, N'Fox', 30, 19, 100, 20, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1377, N'Fox', 9, 6, 100, 20, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1378, N'Bear', 19, 10, 100, 40, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1379, N'Bear', 8, 1, 100, 40, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1380, N'Bear', 8, 18, 100, 40, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1381, N'Bear', 27, 14, 100, 40, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1382, N'Bear', 34, 3, 100, 40, 0, 276)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1383, N'PlayerClass', 1, 1, 100, NULL, 0, 277)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1384, N'PlayerClass', 1, 1, 100, NULL, 0, 278)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1385, N'Wolf', 9, 3, 100, 30, 0, 278)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1386, N'Wolf', 39, 6, 100, 30, 0, 278)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1387, N'Wolf', 33, 3, 100, 30, 0, 278)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1388, N'PlayerClass', 1, 1, 100, NULL, 0, 279)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1389, N'Wolf', 11, 4, 100, 30, 0, 279)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1390, N'Wolf', 1, 8, 100, 30, 0, 279)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1391, N'Wolf', 1, 1, 100, 30, 0, 279)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1392, N'PlayerClass', 1, 1, 100, NULL, 0, 280)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1393, N'Wolf', 28, 5, 100, 30, 0, 280)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1394, N'Wolf', 32, 10, 100, 30, 0, 280)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1395, N'Wolf', 33, 1, 100, 30, 0, 280)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1396, N'PlayerClass', 1, 1, 100, NULL, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1397, N'Wolf', 33, 2, 100, 30, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1398, N'Wolf', 16, 4, 100, 30, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1399, N'Wolf', 5, 1, 100, 30, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1400, N'Bear', 35, 4, 100, 40, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1401, N'Bear', 23, 17, 100, 40, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1402, N'Bear', 11, 17, 100, 40, 0, 281)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1403, N'PlayerClass', 1, 1, 100, NULL, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1404, N'Wolf', 12, 10, 100, 30, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1405, N'Wolf', 17, 1, 100, 30, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1406, N'Wolf', 7, 9, 100, 30, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1407, N'Wolf', 37, 7, 100, 30, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1408, N'Fox', 5, 15, 100, 20, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1409, N'Fox', 12, 17, 100, 20, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1410, N'Fox', 14, 11, 100, 20, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1411, N'Fox', 22, 11, 100, 20, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1412, N'Bear', 20, 1, 100, 40, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1413, N'Bear', 6, 12, 100, 40, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1414, N'Bear', 15, 6, 100, 40, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1415, N'Bear', 12, 20, 100, 40, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1416, N'Bear', 5, 9, 100, 40, 0, 282)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1417, N'PlayerClass', 1, 1, 100, NULL, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1418, N'Wolf', 35, 16, 100, 30, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1419, N'Wolf', 20, 11, 100, 30, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1420, N'Wolf', 5, 15, 100, 30, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1421, N'Wolf', 30, 2, 100, 30, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1422, N'Fox', 31, 2, 100, 20, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1423, N'Fox', 34, 6, 100, 20, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1424, N'Fox', 1, 6, 100, 20, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1425, N'Fox', 6, 8, 100, 20, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1426, N'Bear', 28, 18, 100, 40, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1427, N'Bear', 38, 15, 100, 40, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1428, N'Bear', 38, 3, 100, 40, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1429, N'Bear', 23, 9, 100, 40, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1430, N'Bear', 3, 12, 100, 40, 0, 283)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1431, N'PlayerClass', 1, 1, 100, NULL, 0, 284)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1432, N'PlayerClass', 1, 1, 100, NULL, 0, 285)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1433, N'Wolf', 26, 10, 100, 30, 0, 285)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1434, N'Wolf', 37, 4, 100, 30, 0, 285)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1435, N'Wolf', 27, 1, 100, 30, 0, 285)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1436, N'PlayerClass', 1, 1, 100, NULL, 0, 286)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1437, N'Wolf', 30, 9, 100, 30, 0, 286)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1438, N'Wolf', 34, 1, 100, 30, 0, 286)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1439, N'Wolf', 33, 3, 100, 30, 0, 286)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1440, N'PlayerClass', 1, 1, 100, NULL, 0, 287)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1441, N'Wolf', 20, 8, 100, 30, 0, 287)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1442, N'Wolf', 29, 5, 100, 30, 0, 287)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1443, N'Wolf', 37, 3, 100, 30, 0, 287)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1444, N'PlayerClass', 1, 1, 100, NULL, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1445, N'Wolf', 13, 16, 100, 30, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1446, N'Wolf', 38, 17, 100, 30, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1447, N'Wolf', 30, 14, 100, 30, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1448, N'Bear', 1, 5, 100, 40, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1449, N'Bear', 37, 7, 100, 40, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1450, N'Bear', 13, 18, 100, 40, 0, 288)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1451, N'PlayerClass', 1, 1, 100, NULL, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1452, N'Wolf', 23, 15, 100, 30, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1453, N'Wolf', 18, 8, 100, 30, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1454, N'Wolf', 9, 5, 100, 30, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1455, N'Wolf', 7, 17, 100, 30, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1456, N'Fox', 28, 1, 100, 20, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1457, N'Fox', 16, 16, 100, 20, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1458, N'Fox', 36, 12, 100, 20, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1459, N'Fox', 23, 16, 100, 20, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1460, N'Bear', 23, 16, 100, 40, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1461, N'Bear', 32, 17, 100, 40, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1462, N'Bear', 31, 19, 100, 40, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1463, N'Bear', 26, 12, 100, 40, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1464, N'Bear', 16, 3, 100, 40, 0, 289)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1465, N'PlayerClass', 1, 1, 100, NULL, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1466, N'Wolf', 38, 4, 100, 30, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1467, N'Wolf', 25, 12, 100, 30, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1468, N'Wolf', 36, 3, 100, 30, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1469, N'Wolf', 38, 20, 100, 30, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1470, N'Fox', 18, 14, 100, 20, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1471, N'Fox', 10, 4, 100, 20, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1472, N'Fox', 2, 18, 100, 20, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1473, N'Fox', 17, 6, 100, 20, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1474, N'Bear', 39, 13, 100, 40, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1475, N'Bear', 15, 17, 100, 40, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1476, N'Bear', 7, 5, 100, 40, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1477, N'Bear', 6, 1, 100, 40, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1478, N'Bear', 9, 3, 100, 40, 0, 290)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1479, N'PlayerClass', 1, 1, 100, NULL, 0, 291)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1480, N'PlayerClass', 1, 1, 100, NULL, 0, 292)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1481, N'Wolf', 4, 4, 100, 30, 0, 292)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1482, N'Wolf', 28, 2, 100, 30, 0, 292)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1483, N'Wolf', 4, 9, 100, 30, 0, 292)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1484, N'PlayerClass', 1, 1, 100, NULL, 0, 293)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1485, N'Wolf', 40, 1, 100, 30, 0, 293)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1486, N'Wolf', 18, 8, 100, 30, 0, 293)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1487, N'Wolf', 22, 7, 100, 30, 0, 293)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1488, N'PlayerClass', 1, 1, 100, NULL, 0, 294)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1489, N'Wolf', 19, 2, 100, 30, 0, 294)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1490, N'Wolf', 21, 1, 100, 30, 0, 294)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1491, N'Wolf', 17, 7, 100, 30, 0, 294)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1492, N'PlayerClass', 1, 1, 100, NULL, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1493, N'Wolf', 22, 3, 100, 30, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1494, N'Wolf', 7, 11, 100, 30, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1495, N'Wolf', 34, 6, 100, 30, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1496, N'Bear', 25, 3, 100, 40, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1497, N'Bear', 13, 4, 100, 40, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1498, N'Bear', 24, 4, 100, 40, 0, 295)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1499, N'PlayerClass', 1, 1, 100, NULL, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1500, N'Wolf', 31, 17, 100, 30, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1501, N'Wolf', 13, 9, 100, 30, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1502, N'Wolf', 26, 19, 100, 30, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1503, N'Wolf', 33, 3, 100, 30, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1504, N'Fox', 2, 6, 100, 20, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1505, N'Fox', 27, 8, 100, 20, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1506, N'Fox', 13, 14, 100, 20, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1507, N'Fox', 16, 1, 100, 20, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1508, N'Bear', 24, 10, 100, 40, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1509, N'Bear', 10, 6, 100, 40, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1510, N'Bear', 35, 3, 100, 40, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1511, N'Bear', 32, 6, 100, 40, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1512, N'Bear', 27, 7, 100, 40, 0, 296)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1513, N'PlayerClass', 1, 1, 100, NULL, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1514, N'Wolf', 18, 20, 100, 30, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1515, N'Wolf', 29, 8, 100, 30, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1516, N'Wolf', 34, 7, 100, 30, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1517, N'Wolf', 19, 9, 100, 30, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1518, N'Fox', 32, 9, 100, 20, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1519, N'Fox', 21, 10, 100, 20, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1520, N'Fox', 33, 18, 100, 20, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1521, N'Fox', 31, 10, 100, 20, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1522, N'Bear', 32, 11, 100, 40, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1523, N'Bear', 25, 2, 100, 40, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1524, N'Bear', 30, 10, 100, 40, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1525, N'Bear', 6, 14, 100, 40, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1526, N'Bear', 39, 20, 100, 40, 0, 297)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1527, N'PlayerClass', 28, 6, 100, NULL, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1528, N'Wolf', 32, 15, 100, 30, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1529, N'Wolf', 18, 9, 100, 30, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1530, N'Wolf', 29, 1, 100, 30, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1531, N'Wolf', 11, 9, 100, 30, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1532, N'Fox', 34, 8, 100, 20, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1533, N'Fox', 31, 17, 100, 20, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1534, N'Fox', 29, 5, 100, 20, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1535, N'Fox', 10, 1, 100, 20, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1536, N'Bear', 19, 17, 100, 40, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1537, N'Bear', 12, 5, 100, 40, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1538, N'Bear', 18, 15, 100, 40, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1539, N'Bear', 29, 13, 100, 40, 0, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1540, N'Bear', 35, 3, 100, 40, 7, 298)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1541, N'PlayerClass', 1, 1, 100, NULL, 0, 299)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1542, N'PlayerClass', 1, 1, 100, NULL, 0, 300)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1543, N'Wolf', 4, 10, 100, 30, 0, 300)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1544, N'Wolf', 33, 8, 100, 30, 0, 300)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1545, N'Wolf', 2, 2, 100, 30, 0, 300)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1546, N'PlayerClass', 1, 1, 100, NULL, 0, 301)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1547, N'Wolf', 28, 8, 100, 30, 0, 301)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1548, N'Wolf', 15, 8, 100, 30, 0, 301)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1549, N'Wolf', 34, 7, 100, 30, 0, 301)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1550, N'PlayerClass', 1, 1, 100, NULL, 0, 302)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1551, N'Wolf', 3, 5, 100, 30, 0, 302)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1552, N'Wolf', 1, 9, 100, 30, 0, 302)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1553, N'Wolf', 33, 9, 100, 30, 0, 302)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1554, N'PlayerClass', 1, 1, 100, NULL, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1555, N'Wolf', 5, 18, 100, 30, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1556, N'Wolf', 13, 11, 100, 30, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1557, N'Wolf', 22, 1, 100, 30, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1558, N'Bear', 37, 8, 100, 40, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1559, N'Bear', 18, 19, 100, 40, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1560, N'Bear', 13, 12, 100, 40, 0, 303)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1561, N'PlayerClass', 1, 1, 100, NULL, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1562, N'Wolf', 11, 4, 100, 30, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1563, N'Wolf', 27, 9, 100, 30, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1564, N'Wolf', 40, 13, 100, 30, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1565, N'Wolf', 27, 12, 100, 30, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1566, N'Fox', 21, 14, 100, 20, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1567, N'Fox', 11, 4, 100, 20, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1568, N'Fox', 36, 11, 100, 20, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1569, N'Fox', 33, 12, 100, 20, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1570, N'Bear', 19, 15, 100, 40, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1571, N'Bear', 33, 3, 100, 40, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1572, N'Bear', 32, 17, 100, 40, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1573, N'Bear', 15, 7, 100, 40, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1574, N'Bear', 19, 3, 100, 40, 0, 304)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1575, N'PlayerClass', 1, 1, 100, NULL, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1576, N'Wolf', 5, 3, 100, 30, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1577, N'Wolf', 18, 16, 100, 30, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1578, N'Wolf', 39, 5, 100, 30, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1579, N'Wolf', 17, 1, 100, 30, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1580, N'Fox', 14, 6, 100, 20, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1581, N'Fox', 37, 19, 100, 20, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1582, N'Fox', 30, 18, 100, 20, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1583, N'Fox', 19, 7, 100, 20, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1584, N'Bear', 15, 17, 100, 40, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1585, N'Bear', 30, 18, 100, 40, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1586, N'Bear', 6, 8, 100, 40, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1587, N'Bear', 13, 16, 100, 40, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1588, N'Bear', 36, 11, 100, 40, 0, 305)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1589, N'PlayerClass', 1, 1, 100, NULL, 0, 306)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1590, N'PlayerClass', 1, 1, 100, NULL, 0, 307)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1591, N'PlayerClass', 1, 1, 100, NULL, 0, 308)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1592, N'Wolf', 26, 10, 100, 30, 0, 308)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1593, N'Wolf', 32, 1, 100, 30, 0, 308)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1594, N'Wolf', 30, 4, 100, 30, 0, 308)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1595, N'PlayerClass', 1, 1, 100, NULL, 0, 309)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1596, N'Wolf', 17, 10, 100, 30, 0, 309)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1597, N'Wolf', 7, 5, 100, 30, 0, 309)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1598, N'Wolf', 2, 10, 100, 30, 0, 309)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1599, N'PlayerClass', 1, 1, 100, NULL, 0, 310)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1600, N'Wolf', 23, 8, 100, 30, 0, 310)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1601, N'Wolf', 21, 10, 100, 30, 0, 310)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1602, N'Wolf', 14, 9, 100, 30, 0, 310)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1603, N'PlayerClass', 1, 1, 100, NULL, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1604, N'Wolf', 28, 14, 100, 30, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1605, N'Wolf', 30, 7, 100, 30, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1606, N'Wolf', 11, 4, 100, 30, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1607, N'Bear', 29, 14, 100, 40, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1608, N'Bear', 23, 20, 100, 40, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1609, N'Bear', 8, 11, 100, 40, 0, 311)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1610, N'PlayerClass', 1, 1, 100, NULL, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1611, N'Wolf', 8, 6, 100, 30, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1612, N'Wolf', 38, 5, 100, 30, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1613, N'Wolf', 24, 17, 100, 30, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1614, N'Wolf', 39, 18, 100, 30, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1615, N'Fox', 25, 12, 100, 20, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1616, N'Fox', 35, 4, 100, 20, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1617, N'Fox', 39, 3, 100, 20, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1618, N'Fox', 10, 16, 100, 20, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1619, N'Bear', 17, 15, 100, 40, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1620, N'Bear', 15, 2, 100, 40, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1621, N'Bear', 11, 1, 100, 40, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1622, N'Bear', 7, 7, 100, 40, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1623, N'Bear', 17, 9, 100, 40, 0, 312)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1624, N'PlayerClass', 1, 1, 100, NULL, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1625, N'Wolf', 15, 20, 100, 30, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1626, N'Wolf', 4, 8, 100, 30, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1627, N'Wolf', 40, 2, 100, 30, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1628, N'Wolf', 12, 6, 100, 30, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1629, N'Fox', 12, 14, 100, 20, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1630, N'Fox', 13, 8, 100, 20, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1631, N'Fox', 8, 11, 100, 20, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1632, N'Fox', 9, 20, 100, 20, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1633, N'Bear', 28, 5, 100, 40, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1634, N'Bear', 30, 1, 100, 40, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1635, N'Bear', 7, 2, 100, 40, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1636, N'Bear', 22, 9, 100, 40, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1637, N'Bear', 10, 16, 100, 40, 0, 313)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1638, N'PlayerClass', 1, 1, 100, NULL, 0, 314)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1639, N'PlayerClass', 1, 1, 100, NULL, 0, 315)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1640, N'Wolf', 28, 10, 100, 30, 0, 315)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1641, N'Wolf', 3, 7, 100, 30, 0, 315)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1642, N'Wolf', 29, 3, 100, 30, 0, 315)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1643, N'PlayerClass', 1, 1, 100, NULL, 0, 316)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1644, N'Wolf', 37, 5, 100, 30, 0, 316)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1645, N'Wolf', 20, 3, 100, 30, 0, 316)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1646, N'Wolf', 37, 8, 100, 30, 0, 316)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1647, N'PlayerClass', 1, 1, 100, NULL, 0, 317)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1648, N'Wolf', 34, 1, 100, 30, 0, 317)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1649, N'Wolf', 10, 5, 100, 30, 0, 317)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1650, N'Wolf', 23, 2, 100, 30, 0, 317)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1651, N'PlayerClass', 1, 1, 100, NULL, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1652, N'Wolf', 30, 19, 100, 30, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1653, N'Wolf', 7, 10, 100, 30, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1654, N'Wolf', 19, 2, 100, 30, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1655, N'Bear', 4, 14, 100, 40, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1656, N'Bear', 40, 14, 100, 40, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1657, N'Bear', 30, 12, 100, 40, 0, 318)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1658, N'PlayerClass', 1, 1, 100, NULL, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1659, N'Wolf', 34, 11, 100, 30, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1660, N'Wolf', 6, 10, 100, 30, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1661, N'Wolf', 37, 13, 100, 30, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1662, N'Wolf', 1, 8, 100, 30, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1663, N'Fox', 20, 6, 100, 20, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1664, N'Fox', 35, 14, 100, 20, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1665, N'Fox', 29, 6, 100, 20, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1666, N'Fox', 5, 18, 100, 20, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1667, N'Bear', 37, 12, 100, 40, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1668, N'Bear', 34, 19, 100, 40, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1669, N'Bear', 33, 16, 100, 40, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1670, N'Bear', 35, 18, 100, 40, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1671, N'Bear', 2, 16, 100, 40, 0, 319)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1672, N'PlayerClass', 1, 1, 100, NULL, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1673, N'Wolf', 21, 11, 100, 30, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1674, N'Wolf', 19, 5, 100, 30, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1675, N'Wolf', 32, 19, 100, 30, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1676, N'Wolf', 2, 7, 100, 30, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1677, N'Fox', 9, 8, 100, 20, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1678, N'Fox', 20, 7, 100, 20, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1679, N'Fox', 25, 13, 100, 20, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1680, N'Fox', 14, 1, 100, 20, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1681, N'Bear', 19, 9, 100, 40, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1682, N'Bear', 36, 9, 100, 40, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1683, N'Bear', 12, 17, 100, 40, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1684, N'Bear', 25, 20, 100, 40, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1685, N'Bear', 19, 12, 100, 40, 0, 320)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1686, N'PlayerClass', 1, 1, 100, NULL, 0, 321)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1687, N'PlayerClass', 1, 1, 100, NULL, 0, 322)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1688, N'Wolf', 29, 5, 100, 30, 0, 322)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1689, N'Wolf', 32, 3, 100, 30, 0, 322)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1690, N'Wolf', 34, 6, 100, 30, 0, 322)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1691, N'PlayerClass', 1, 1, 100, NULL, 0, 323)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1692, N'Wolf', 40, 8, 100, 30, 0, 323)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1693, N'Wolf', 24, 8, 100, 30, 0, 323)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1694, N'Wolf', 2, 4, 100, 30, 0, 323)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1695, N'PlayerClass', 1, 1, 100, NULL, 0, 324)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1696, N'Wolf', 22, 1, 100, 30, 0, 324)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1697, N'Wolf', 4, 8, 100, 30, 0, 324)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1698, N'Wolf', 30, 3, 100, 30, 0, 324)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1699, N'PlayerClass', 1, 1, 100, NULL, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1700, N'Wolf', 24, 19, 100, 30, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1701, N'Wolf', 15, 2, 100, 30, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1702, N'Wolf', 13, 18, 100, 30, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1703, N'Bear', 1, 8, 100, 40, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1704, N'Bear', 7, 13, 100, 40, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1705, N'Bear', 39, 8, 100, 40, 0, 325)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1706, N'PlayerClass', 1, 1, 100, NULL, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1707, N'Wolf', 28, 16, 100, 30, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1708, N'Wolf', 2, 11, 100, 30, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1709, N'Wolf', 40, 9, 100, 30, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1710, N'Wolf', 20, 5, 100, 30, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1711, N'Fox', 21, 20, 100, 20, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1712, N'Fox', 4, 13, 100, 20, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1713, N'Fox', 40, 11, 100, 20, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1714, N'Fox', 36, 12, 100, 20, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1715, N'Bear', 7, 19, 100, 40, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1716, N'Bear', 28, 18, 100, 40, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1717, N'Bear', 32, 20, 100, 40, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1718, N'Bear', 25, 16, 100, 40, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1719, N'Bear', 2, 11, 100, 40, 0, 326)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1720, N'PlayerClass', 1, 1, 100, NULL, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1721, N'Wolf', 25, 17, 100, 30, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1722, N'Wolf', 31, 5, 100, 30, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1723, N'Wolf', 20, 5, 100, 30, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1724, N'Wolf', 17, 11, 100, 30, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1725, N'Fox', 38, 18, 100, 20, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1726, N'Fox', 27, 16, 100, 20, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1727, N'Fox', 29, 7, 100, 20, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1728, N'Fox', 37, 12, 100, 20, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1729, N'Bear', 25, 5, 100, 40, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1730, N'Bear', 17, 14, 100, 40, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1731, N'Bear', 29, 3, 100, 40, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1732, N'Bear', 11, 14, 100, 40, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1733, N'Bear', 11, 12, 100, 40, 0, 327)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1734, N'PlayerClass', 1, 1, 100, NULL, 0, 328)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1735, N'PlayerClass', 1, 1, 100, NULL, 0, 329)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1736, N'Wolf', 20, 1, 100, 30, 0, 329)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1737, N'Wolf', 33, 6, 100, 30, 0, 329)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1738, N'Wolf', 34, 4, 100, 30, 0, 329)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1739, N'PlayerClass', 1, 1, 100, NULL, 0, 330)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1740, N'Wolf', 8, 7, 100, 30, 0, 330)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1741, N'Wolf', 3, 6, 100, 30, 0, 330)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1742, N'Wolf', 27, 7, 100, 30, 0, 330)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1743, N'PlayerClass', 1, 1, 100, NULL, 0, 331)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1744, N'Wolf', 4, 3, 100, 30, 0, 331)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1745, N'Wolf', 32, 7, 100, 30, 0, 331)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1746, N'Wolf', 6, 1, 100, 30, 0, 331)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1747, N'PlayerClass', 1, 1, 100, NULL, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1748, N'Wolf', 9, 13, 100, 30, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1749, N'Wolf', 5, 3, 100, 30, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1750, N'Wolf', 2, 6, 100, 30, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1751, N'Bear', 18, 20, 100, 40, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1752, N'Bear', 10, 1, 100, 40, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1753, N'Bear', 6, 4, 100, 40, 0, 332)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1754, N'PlayerClass', 1, 1, 100, NULL, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1755, N'Wolf', 16, 2, 100, 30, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1756, N'Wolf', 19, 20, 100, 30, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1757, N'Wolf', 6, 9, 100, 30, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1758, N'Wolf', 26, 15, 100, 30, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1759, N'Fox', 8, 3, 100, 20, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1760, N'Fox', 23, 17, 100, 20, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1761, N'Fox', 11, 15, 100, 20, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1762, N'Fox', 37, 19, 100, 20, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1763, N'Bear', 25, 3, 100, 40, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1764, N'Bear', 34, 6, 100, 40, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1765, N'Bear', 32, 11, 100, 40, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1766, N'Bear', 22, 6, 100, 40, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1767, N'Bear', 31, 12, 100, 40, 0, 333)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1768, N'PlayerClass', 1, 1, 100, NULL, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1769, N'Wolf', 27, 11, 100, 30, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1770, N'Wolf', 33, 10, 100, 30, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1771, N'Wolf', 3, 17, 100, 30, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1772, N'Wolf', 7, 5, 100, 30, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1773, N'Fox', 10, 17, 100, 20, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1774, N'Fox', 20, 20, 100, 20, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1775, N'Fox', 13, 5, 100, 20, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1776, N'Fox', 6, 5, 100, 20, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1777, N'Bear', 2, 19, 100, 40, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1778, N'Bear', 34, 14, 100, 40, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1779, N'Bear', 21, 3, 100, 40, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1780, N'Bear', 12, 10, 100, 40, 0, 334)
GO
INSERT [dbo].[MovableObject] ([MovableID], [Type], [X], [Y], [HP], [Damage], [Lightness], [MapID]) VALUES (1781, N'Bear', 20, 9, 100, 40, 0, 334)
GO
SET IDENTITY_INSERT [dbo].[MovableObject] OFF
GO
SET IDENTITY_INSERT [dbo].[Obstacles] ON 
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4123, N'Bush', 14, 5, 5, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4124, N'Bush', 16, 2, 5, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4125, N'Bush', 16, 4, 5, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4126, N'Bush', 6, 10, 5, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4127, N'Bush', 17, 5, 5, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4128, N'Stone', 8, 9, NULL, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4129, N'Stone', 4, 7, NULL, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4130, N'Stone', 11, 10, NULL, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4131, N'Stone', 16, 10, NULL, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4132, N'Stone', 18, 8, NULL, 235)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4133, N'Bush', 18, 2, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4134, N'Bush', 2, 8, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4135, N'Bush', 2, 6, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4136, N'Bush', 6, 3, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4137, N'Bush', 20, 6, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4138, N'Bush', 20, 7, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4139, N'Bush', 32, 4, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4140, N'Bush', 33, 1, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4141, N'Bush', 26, 5, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4142, N'Bush', 27, 2, 5, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4143, N'Stone', 19, 2, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4144, N'Stone', 32, 7, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4145, N'Stone', 13, 5, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4146, N'Stone', 37, 3, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4147, N'Stone', 19, 4, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4148, N'Stone', 23, 8, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4149, N'Stone', 4, 9, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4150, N'Stone', 39, 3, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4151, N'Stone', 36, 8, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4152, N'Stone', 11, 7, NULL, 236)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4153, N'Bush', 23, 3, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4154, N'Bush', 13, 9, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4155, N'Bush', 17, 4, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4156, N'Bush', 35, 9, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4157, N'Bush', 38, 8, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4158, N'Bush', 9, 8, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4159, N'Bush', 2, 1, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4160, N'Bush', 16, 2, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4161, N'Bush', 26, 8, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4162, N'Bush', 40, 5, 5, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4163, N'Stone', 26, 10, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4164, N'Stone', 31, 10, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4165, N'Stone', 33, 10, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4166, N'Stone', 36, 7, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4167, N'Stone', 10, 1, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4168, N'Stone', 30, 6, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4169, N'Stone', 23, 5, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4170, N'Stone', 30, 3, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4171, N'Stone', 6, 2, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4172, N'Stone', 33, 9, NULL, 237)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4173, N'Bush', 36, 2, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4174, N'Bush', 25, 9, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4175, N'Bush', 21, 2, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4176, N'Bush', 15, 3, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4177, N'Bush', 21, 5, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4178, N'Bush', 9, 9, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4179, N'Bush', 12, 1, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4180, N'Bush', 5, 5, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4181, N'Bush', 28, 4, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4182, N'Bush', 3, 3, 5, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4183, N'Stone', 37, 4, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4184, N'Stone', 1, 10, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4185, N'Stone', 36, 10, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4186, N'Stone', 30, 6, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4187, N'Stone', 35, 6, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4188, N'Stone', 38, 8, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4189, N'Stone', 31, 4, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4190, N'Stone', 32, 4, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4191, N'Stone', 13, 2, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4192, N'Stone', 22, 1, NULL, 238)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4193, N'Bush', 11, 16, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4194, N'Bush', 14, 20, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4195, N'Bush', 20, 10, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4196, N'Bush', 6, 4, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4197, N'Bush', 32, 17, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4198, N'Bush', 5, 16, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4199, N'Bush', 5, 14, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4200, N'Bush', 30, 1, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4201, N'Bush', 9, 6, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4202, N'Bush', 11, 13, 5, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4203, N'Stone', 15, 8, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4204, N'Stone', 33, 3, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4205, N'Stone', 17, 20, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4206, N'Stone', 19, 7, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4207, N'Stone', 33, 16, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4208, N'Stone', 38, 1, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4209, N'Stone', 3, 5, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4210, N'Stone', 24, 12, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4211, N'Stone', 40, 12, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4212, N'Stone', 10, 6, NULL, 239)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4213, N'Bush', 31, 2, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4214, N'Bush', 25, 1, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4215, N'Bush', 32, 13, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4216, N'Bush', 34, 16, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4217, N'Bush', 3, 10, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4218, N'Bush', 5, 19, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4219, N'Bush', 34, 11, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4220, N'Bush', 14, 11, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4221, N'Bush', 26, 6, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4222, N'Bush', 16, 6, 5, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4223, N'Stone', 22, 10, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4224, N'Stone', 23, 15, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4225, N'Stone', 6, 3, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4226, N'Stone', 35, 10, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4227, N'Stone', 15, 12, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4228, N'Stone', 34, 15, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4229, N'Stone', 33, 5, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4230, N'Stone', 31, 14, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4231, N'Stone', 38, 2, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4232, N'Stone', 23, 10, NULL, 240)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4233, N'Bush', 8, 12, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4234, N'Bush', 1, 18, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4235, N'Bush', 23, 4, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4236, N'Bush', 21, 8, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4237, N'Bush', 4, 15, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4238, N'Bush', 23, 12, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4239, N'Bush', 26, 9, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4240, N'Bush', 37, 14, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4241, N'Bush', 28, 5, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4242, N'Bush', 13, 18, 5, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4243, N'Stone', 38, 19, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4244, N'Stone', 4, 3, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4245, N'Stone', 32, 5, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4246, N'Stone', 32, 9, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4247, N'Stone', 8, 7, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4248, N'Stone', 36, 6, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4249, N'Stone', 22, 15, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4250, N'Stone', 28, 3, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4251, N'Stone', 40, 7, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4252, N'Stone', 11, 6, NULL, 241)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4253, N'Bush', 36, 2, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4254, N'Bush', 25, 9, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4255, N'Bush', 21, 2, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4256, N'Bush', 15, 3, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4257, N'Bush', 21, 5, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4258, N'Bush', 9, 9, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4259, N'Bush', 12, 1, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4260, N'Bush', 5, 5, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4261, N'Bush', 28, 4, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4262, N'Bush', 3, 3, 5, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4263, N'Stone', 37, 4, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4264, N'Stone', 1, 10, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4265, N'Stone', 36, 10, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4266, N'Stone', 30, 6, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4267, N'Stone', 35, 6, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4268, N'Stone', 38, 8, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4269, N'Stone', 31, 4, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4270, N'Stone', 32, 4, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4271, N'Stone', 13, 2, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4272, N'Stone', 22, 1, NULL, 242)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4273, N'Bush', 31, 2, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4274, N'Bush', 25, 1, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4275, N'Bush', 32, 13, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4276, N'Bush', 34, 16, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4277, N'Bush', 3, 10, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4278, N'Bush', 5, 19, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4279, N'Bush', 34, 11, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4280, N'Bush', 14, 11, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4281, N'Bush', 26, 6, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4282, N'Bush', 16, 6, 5, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4283, N'Stone', 22, 10, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4284, N'Stone', 23, 15, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4285, N'Stone', 6, 3, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4286, N'Stone', 35, 10, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4287, N'Stone', 15, 12, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4288, N'Stone', 34, 15, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4289, N'Stone', 33, 5, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4290, N'Stone', 31, 14, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4291, N'Stone', 38, 2, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4292, N'Stone', 23, 10, NULL, 243)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4293, N'Bush', 31, 2, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4294, N'Bush', 25, 1, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4295, N'Bush', 32, 13, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4296, N'Bush', 34, 16, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4297, N'Bush', 3, 10, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4298, N'Bush', 5, 19, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4299, N'Bush', 34, 11, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4300, N'Bush', 14, 11, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4301, N'Bush', 26, 6, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4302, N'Bush', 16, 6, 5, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4303, N'Stone', 22, 10, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4304, N'Stone', 23, 15, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4305, N'Stone', 6, 3, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4306, N'Stone', 35, 10, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4307, N'Stone', 15, 12, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4308, N'Stone', 34, 15, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4309, N'Stone', 33, 5, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4310, N'Stone', 31, 14, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4311, N'Stone', 38, 2, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4312, N'Stone', 23, 10, NULL, 244)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4313, N'Bush', 17, 1, 5, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4314, N'Bush', 9, 3, 5, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4315, N'Bush', 8, 9, 5, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4316, N'Bush', 19, 10, 5, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4317, N'Bush', 7, 6, 5, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4318, N'Stone', 20, 9, NULL, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4319, N'Stone', 12, 4, NULL, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4320, N'Stone', 13, 6, NULL, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4321, N'Stone', 5, 10, NULL, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4322, N'Stone', 11, 10, NULL, 245)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4323, N'Bush', 3, 9, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4324, N'Bush', 7, 3, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4325, N'Bush', 15, 3, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4326, N'Bush', 19, 7, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4327, N'Bush', 22, 3, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4328, N'Bush', 37, 9, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4329, N'Bush', 35, 5, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4330, N'Bush', 16, 6, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4331, N'Bush', 34, 1, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4332, N'Bush', 22, 5, 5, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4333, N'Stone', 7, 5, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4334, N'Stone', 27, 6, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4335, N'Stone', 35, 8, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4336, N'Stone', 15, 2, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4337, N'Stone', 8, 10, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4338, N'Stone', 40, 10, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4339, N'Stone', 21, 10, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4340, N'Stone', 22, 4, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4341, N'Stone', 10, 1, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4342, N'Stone', 18, 5, NULL, 246)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4343, N'Bush', 8, 3, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4344, N'Bush', 26, 7, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4345, N'Bush', 38, 9, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4346, N'Bush', 26, 10, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4347, N'Bush', 17, 7, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4348, N'Bush', 36, 1, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4349, N'Bush', 10, 7, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4350, N'Bush', 21, 1, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4351, N'Bush', 2, 8, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4352, N'Bush', 38, 3, 5, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4353, N'Stone', 40, 7, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4354, N'Stone', 11, 3, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4355, N'Stone', 21, 6, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4356, N'Stone', 32, 5, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4357, N'Stone', 15, 4, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4358, N'Stone', 32, 7, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4359, N'Stone', 22, 1, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4360, N'Stone', 16, 9, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4361, N'Stone', 24, 9, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4362, N'Stone', 19, 10, NULL, 247)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4363, N'Bush', 20, 8, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4364, N'Bush', 2, 10, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4365, N'Bush', 21, 2, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4366, N'Bush', 1, 3, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4367, N'Bush', 16, 7, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4368, N'Bush', 38, 10, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4369, N'Bush', 40, 2, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4370, N'Bush', 30, 1, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4371, N'Bush', 26, 2, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4372, N'Bush', 11, 2, 5, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4373, N'Stone', 40, 8, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4374, N'Stone', 23, 5, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4375, N'Stone', 28, 8, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4376, N'Stone', 38, 4, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4377, N'Stone', 37, 7, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4378, N'Stone', 9, 2, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4379, N'Stone', 36, 8, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4380, N'Stone', 17, 5, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4381, N'Stone', 36, 2, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4382, N'Stone', 14, 5, NULL, 248)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4383, N'Bush', 17, 1, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4384, N'Bush', 37, 20, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4385, N'Bush', 28, 5, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4386, N'Bush', 11, 15, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4387, N'Bush', 13, 9, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4388, N'Bush', 30, 12, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4389, N'Bush', 16, 9, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4390, N'Bush', 40, 11, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4391, N'Bush', 2, 13, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4392, N'Bush', 31, 17, 5, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4393, N'Stone', 38, 15, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4394, N'Stone', 26, 9, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4395, N'Stone', 34, 8, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4396, N'Stone', 21, 5, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4397, N'Stone', 30, 15, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4398, N'Stone', 31, 4, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4399, N'Stone', 6, 18, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4400, N'Stone', 4, 14, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4401, N'Stone', 34, 14, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4402, N'Stone', 38, 9, NULL, 249)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4403, N'Bush', 18, 17, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4404, N'Bush', 35, 13, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4405, N'Bush', 30, 15, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4406, N'Bush', 3, 2, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4407, N'Bush', 24, 15, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4408, N'Bush', 18, 10, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4409, N'Bush', 19, 8, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4410, N'Bush', 26, 15, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4411, N'Bush', 3, 15, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4412, N'Bush', 13, 16, 5, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4413, N'Stone', 14, 20, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4414, N'Stone', 29, 12, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4415, N'Stone', 23, 8, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4416, N'Stone', 14, 19, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4417, N'Stone', 12, 7, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4418, N'Stone', 22, 4, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4419, N'Stone', 22, 12, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4420, N'Stone', 22, 19, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4421, N'Stone', 27, 13, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4422, N'Stone', 7, 15, NULL, 250)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4423, N'Bush', 6, 1, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4424, N'Bush', 6, 4, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4425, N'Bush', 14, 12, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4426, N'Bush', 33, 6, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4427, N'Bush', 25, 11, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4428, N'Bush', 26, 14, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4429, N'Bush', 28, 1, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4430, N'Bush', 1, 16, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4431, N'Bush', 34, 10, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4432, N'Bush', 8, 6, 5, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4433, N'Stone', 18, 3, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4434, N'Stone', 12, 4, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4435, N'Stone', 39, 2, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4436, N'Stone', 20, 19, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4437, N'Stone', 30, 12, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4438, N'Stone', 14, 9, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4439, N'Stone', 34, 1, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4440, N'Stone', 15, 16, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4441, N'Stone', 7, 3, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4442, N'Stone', 40, 10, NULL, 251)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4443, N'Bush', 14, 5, 5, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4444, N'Bush', 16, 2, 5, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4445, N'Bush', 16, 4, 5, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4446, N'Bush', 6, 10, 5, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4447, N'Bush', 17, 5, 5, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4448, N'Stone', 8, 9, NULL, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4449, N'Stone', 4, 7, NULL, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4450, N'Stone', 11, 10, NULL, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4451, N'Stone', 16, 10, NULL, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4452, N'Stone', 18, 8, NULL, 252)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4453, N'Bush', 5, 5, 5, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4454, N'Bush', 11, 9, 5, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4455, N'Bush', 11, 5, 5, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4456, N'Bush', 20, 8, 5, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4457, N'Bush', 13, 4, 5, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4458, N'Stone', 20, 6, NULL, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4459, N'Stone', 2, 5, NULL, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4460, N'Stone', 9, 10, NULL, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4461, N'Stone', 5, 6, NULL, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4462, N'Stone', 13, 6, NULL, 253)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4463, N'Bush', 2, 5, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4464, N'Bush', 28, 10, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4465, N'Bush', 34, 7, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4466, N'Bush', 39, 2, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4467, N'Bush', 14, 8, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4468, N'Bush', 19, 1, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4469, N'Bush', 26, 7, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4470, N'Bush', 32, 10, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4471, N'Bush', 26, 4, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4472, N'Bush', 26, 1, 5, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4473, N'Stone', 34, 6, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4474, N'Stone', 6, 4, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4475, N'Stone', 32, 5, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4476, N'Stone', 39, 6, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4477, N'Stone', 8, 7, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4478, N'Stone', 13, 1, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4479, N'Stone', 4, 10, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4480, N'Stone', 6, 5, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4481, N'Stone', 6, 10, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4482, N'Stone', 30, 7, NULL, 254)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4483, N'Bush', 11, 7, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4484, N'Bush', 34, 2, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4485, N'Bush', 32, 4, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4486, N'Bush', 35, 4, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4487, N'Bush', 36, 6, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4488, N'Bush', 3, 8, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4489, N'Bush', 10, 5, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4490, N'Bush', 37, 9, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4491, N'Bush', 1, 9, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4492, N'Bush', 38, 2, 5, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4493, N'Stone', 7, 1, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4494, N'Stone', 16, 9, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4495, N'Stone', 35, 10, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4496, N'Stone', 20, 9, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4497, N'Stone', 20, 4, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4498, N'Stone', 25, 2, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4499, N'Stone', 25, 6, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4500, N'Stone', 11, 3, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4501, N'Stone', 12, 7, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4502, N'Stone', 4, 10, NULL, 255)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4503, N'Bush', 20, 3, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4504, N'Bush', 1, 8, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4505, N'Bush', 26, 10, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4506, N'Bush', 9, 10, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4507, N'Bush', 8, 5, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4508, N'Bush', 1, 9, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4509, N'Bush', 22, 6, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4510, N'Bush', 7, 3, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4511, N'Bush', 24, 5, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4512, N'Bush', 24, 7, 5, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4513, N'Stone', 27, 8, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4514, N'Stone', 20, 7, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4515, N'Stone', 33, 8, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4516, N'Stone', 32, 5, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4517, N'Stone', 18, 5, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4518, N'Stone', 24, 10, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4519, N'Stone', 2, 9, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4520, N'Stone', 34, 9, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4521, N'Stone', 2, 1, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4522, N'Stone', 11, 6, NULL, 256)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4523, N'Bush', 8, 18, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4524, N'Bush', 20, 19, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4525, N'Bush', 11, 12, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4526, N'Bush', 27, 20, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4527, N'Bush', 8, 8, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4528, N'Bush', 1, 17, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4529, N'Bush', 6, 20, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4530, N'Bush', 7, 4, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4531, N'Bush', 16, 19, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4532, N'Bush', 28, 15, 5, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4533, N'Stone', 11, 14, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4534, N'Stone', 7, 6, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4535, N'Stone', 34, 12, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4536, N'Stone', 17, 3, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4537, N'Stone', 36, 13, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4538, N'Stone', 8, 6, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4539, N'Stone', 39, 19, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4540, N'Stone', 21, 20, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4541, N'Stone', 17, 11, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4542, N'Stone', 5, 19, NULL, 257)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4543, N'Bush', 4, 13, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4544, N'Bush', 21, 20, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4545, N'Bush', 30, 9, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4546, N'Bush', 18, 18, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4547, N'Bush', 7, 3, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4548, N'Bush', 17, 8, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4549, N'Bush', 10, 6, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4550, N'Bush', 26, 19, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4551, N'Bush', 16, 9, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4552, N'Bush', 5, 3, 5, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4553, N'Stone', 40, 18, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4554, N'Stone', 29, 2, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4555, N'Stone', 35, 2, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4556, N'Stone', 8, 5, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4557, N'Stone', 31, 20, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4558, N'Stone', 25, 10, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4559, N'Stone', 6, 7, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4560, N'Stone', 16, 12, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4561, N'Stone', 36, 12, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4562, N'Stone', 4, 12, NULL, 258)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4563, N'Bush', 13, 20, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4564, N'Bush', 21, 15, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4565, N'Bush', 24, 18, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4566, N'Bush', 20, 13, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4567, N'Bush', 37, 10, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4568, N'Bush', 2, 16, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4569, N'Bush', 38, 10, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4570, N'Bush', 12, 17, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4571, N'Bush', 7, 15, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4572, N'Bush', 2, 3, 5, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4573, N'Stone', 15, 17, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4574, N'Stone', 27, 1, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4575, N'Stone', 10, 1, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4576, N'Stone', 31, 18, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4577, N'Stone', 33, 7, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4578, N'Stone', 27, 15, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4579, N'Stone', 15, 1, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4580, N'Stone', 32, 14, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4581, N'Stone', 8, 2, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4582, N'Stone', 37, 11, NULL, 259)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4583, N'Bush', 36, 2, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4584, N'Bush', 25, 9, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4585, N'Bush', 21, 2, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4586, N'Bush', 15, 3, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4587, N'Bush', 21, 5, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4588, N'Bush', 9, 9, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4589, N'Bush', 12, 1, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4590, N'Bush', 5, 5, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4591, N'Bush', 28, 4, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4592, N'Bush', 3, 3, 5, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4593, N'Stone', 37, 4, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4594, N'Stone', 1, 10, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4595, N'Stone', 36, 10, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4596, N'Stone', 30, 6, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4597, N'Stone', 35, 6, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4598, N'Stone', 38, 8, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4599, N'Stone', 31, 4, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4600, N'Stone', 32, 4, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4601, N'Stone', 13, 2, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4602, N'Stone', 22, 1, NULL, 260)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4603, N'Bush', 4, 9, 5, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4604, N'Bush', 3, 8, 5, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4605, N'Bush', 5, 1, 5, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4606, N'Bush', 12, 10, 5, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4607, N'Bush', 13, 2, 5, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4608, N'Stone', 1, 2, NULL, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4609, N'Stone', 2, 6, NULL, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4610, N'Stone', 10, 7, NULL, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4611, N'Stone', 13, 5, NULL, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4612, N'Stone', 16, 4, NULL, 261)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4613, N'Bush', 31, 4, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4614, N'Bush', 5, 4, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4615, N'Bush', 17, 9, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4616, N'Bush', 6, 3, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4617, N'Bush', 21, 7, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4618, N'Bush', 12, 3, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4619, N'Bush', 24, 2, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4620, N'Bush', 8, 6, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4621, N'Bush', 13, 5, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4622, N'Bush', 22, 3, 5, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4623, N'Stone', 28, 1, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4624, N'Stone', 38, 6, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4625, N'Stone', 37, 7, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4626, N'Stone', 34, 6, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4627, N'Stone', 17, 10, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4628, N'Stone', 16, 7, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4629, N'Stone', 13, 1, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4630, N'Stone', 35, 3, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4631, N'Stone', 25, 4, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4632, N'Stone', 18, 1, NULL, 262)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4633, N'Bush', 35, 5, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4634, N'Bush', 13, 1, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4635, N'Bush', 7, 9, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4636, N'Bush', 22, 5, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4637, N'Bush', 26, 8, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4638, N'Bush', 36, 4, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4639, N'Bush', 2, 8, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4640, N'Bush', 37, 1, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4641, N'Bush', 17, 8, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4642, N'Bush', 39, 10, 5, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4643, N'Stone', 26, 2, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4644, N'Stone', 29, 1, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4645, N'Stone', 3, 10, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4646, N'Stone', 22, 3, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4647, N'Stone', 8, 4, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4648, N'Stone', 2, 10, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4649, N'Stone', 37, 7, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4650, N'Stone', 4, 9, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4651, N'Stone', 17, 10, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4652, N'Stone', 24, 7, NULL, 263)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4653, N'Bush', 22, 9, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4654, N'Bush', 17, 1, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4655, N'Bush', 10, 2, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4656, N'Bush', 1, 4, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4657, N'Bush', 11, 6, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4658, N'Bush', 7, 6, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4659, N'Bush', 13, 10, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4660, N'Bush', 27, 6, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4661, N'Bush', 21, 8, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4662, N'Bush', 34, 6, 5, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4663, N'Stone', 33, 8, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4664, N'Stone', 36, 1, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4665, N'Stone', 25, 10, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4666, N'Stone', 40, 2, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4667, N'Stone', 14, 8, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4668, N'Stone', 5, 3, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4669, N'Stone', 37, 7, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4670, N'Stone', 26, 9, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4671, N'Stone', 5, 9, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4672, N'Stone', 25, 2, NULL, 264)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4673, N'Bush', 11, 8, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4674, N'Bush', 29, 9, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4675, N'Bush', 1, 20, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4676, N'Bush', 16, 10, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4677, N'Bush', 30, 3, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4678, N'Bush', 28, 17, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4679, N'Bush', 24, 6, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4680, N'Bush', 17, 6, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4681, N'Bush', 36, 7, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4682, N'Bush', 5, 3, 5, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4683, N'Stone', 16, 11, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4684, N'Stone', 16, 17, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4685, N'Stone', 26, 3, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4686, N'Stone', 33, 11, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4687, N'Stone', 9, 15, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4688, N'Stone', 7, 13, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4689, N'Stone', 4, 13, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4690, N'Stone', 8, 12, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4691, N'Stone', 15, 4, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4692, N'Stone', 10, 19, NULL, 265)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4693, N'Bush', 13, 10, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4694, N'Bush', 19, 5, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4695, N'Bush', 39, 14, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4696, N'Bush', 14, 15, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4697, N'Bush', 8, 18, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4698, N'Bush', 11, 20, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4699, N'Bush', 29, 1, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4700, N'Bush', 19, 19, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4701, N'Bush', 24, 1, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4702, N'Bush', 33, 17, 5, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4703, N'Stone', 23, 17, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4704, N'Stone', 2, 20, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4705, N'Stone', 31, 13, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4706, N'Stone', 12, 19, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4707, N'Stone', 20, 12, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4708, N'Stone', 33, 2, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4709, N'Stone', 33, 13, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4710, N'Stone', 21, 8, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4711, N'Stone', 10, 18, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4712, N'Stone', 10, 14, NULL, 266)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4713, N'Bush', 8, 12, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4714, N'Bush', 33, 8, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4715, N'Bush', 4, 19, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4716, N'Bush', 26, 5, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4717, N'Bush', 33, 10, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4718, N'Bush', 34, 19, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4719, N'Bush', 19, 17, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4720, N'Bush', 37, 16, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4721, N'Bush', 33, 1, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4722, N'Bush', 2, 14, 5, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4723, N'Stone', 16, 18, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4724, N'Stone', 31, 6, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4725, N'Stone', 39, 1, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4726, N'Stone', 28, 10, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4727, N'Stone', 37, 18, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4728, N'Stone', 2, 2, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4729, N'Stone', 16, 13, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4730, N'Stone', 24, 19, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4731, N'Stone', 36, 12, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4732, N'Stone', 32, 11, NULL, 267)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4733, N'Bush', 14, 4, 5, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4734, N'Bush', 9, 5, 5, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4735, N'Bush', 6, 2, 5, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4736, N'Bush', 8, 3, 5, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4737, N'Bush', 11, 4, 5, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4738, N'Stone', 13, 4, NULL, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4739, N'Stone', 14, 3, NULL, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4740, N'Stone', 6, 3, NULL, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4741, N'Stone', 9, 3, NULL, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4742, N'Stone', 18, 10, NULL, 268)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4743, N'Bush', 5, 8, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4744, N'Bush', 16, 1, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4745, N'Bush', 8, 3, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4746, N'Bush', 7, 4, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4747, N'Bush', 8, 4, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4748, N'Bush', 29, 8, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4749, N'Bush', 36, 3, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4750, N'Bush', 9, 7, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4751, N'Bush', 35, 1, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4752, N'Bush', 21, 1, 5, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4753, N'Stone', 30, 4, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4754, N'Stone', 18, 2, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4755, N'Stone', 19, 1, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4756, N'Stone', 20, 9, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4757, N'Stone', 10, 6, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4758, N'Stone', 15, 2, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4759, N'Stone', 23, 5, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4760, N'Stone', 28, 6, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4761, N'Stone', 40, 3, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4762, N'Stone', 31, 10, NULL, 269)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4763, N'Bush', 26, 6, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4764, N'Bush', 14, 6, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4765, N'Bush', 5, 8, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4766, N'Bush', 17, 10, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4767, N'Bush', 26, 1, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4768, N'Bush', 20, 1, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4769, N'Bush', 22, 5, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4770, N'Bush', 4, 4, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4771, N'Bush', 4, 6, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4772, N'Bush', 16, 3, 5, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4773, N'Stone', 16, 9, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4774, N'Stone', 26, 8, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4775, N'Stone', 13, 2, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4776, N'Stone', 5, 9, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4777, N'Stone', 33, 10, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4778, N'Stone', 31, 4, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4779, N'Stone', 20, 4, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4780, N'Stone', 30, 10, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4781, N'Stone', 39, 6, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4782, N'Stone', 20, 5, NULL, 270)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4783, N'Bush', 6, 8, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4784, N'Bush', 34, 1, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4785, N'Bush', 27, 1, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4786, N'Bush', 25, 2, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4787, N'Bush', 8, 4, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4788, N'Bush', 37, 5, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4789, N'Bush', 24, 6, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4790, N'Bush', 35, 10, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4791, N'Bush', 21, 3, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4792, N'Bush', 19, 7, 5, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4793, N'Stone', 14, 7, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4794, N'Stone', 30, 3, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4795, N'Stone', 39, 7, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4796, N'Stone', 29, 5, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4797, N'Stone', 8, 6, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4798, N'Stone', 38, 8, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4799, N'Stone', 4, 1, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4800, N'Stone', 21, 9, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4801, N'Stone', 25, 8, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4802, N'Stone', 1, 10, NULL, 271)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4803, N'Bush', 2, 7, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4804, N'Bush', 30, 14, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4805, N'Bush', 1, 14, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4806, N'Bush', 34, 7, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4807, N'Bush', 13, 10, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4808, N'Bush', 36, 2, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4809, N'Bush', 33, 6, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4810, N'Bush', 29, 14, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4811, N'Bush', 13, 2, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4812, N'Bush', 19, 17, 5, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4813, N'Stone', 34, 18, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4814, N'Stone', 3, 8, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4815, N'Stone', 17, 7, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4816, N'Stone', 9, 6, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4817, N'Stone', 30, 6, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4818, N'Stone', 38, 7, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4819, N'Stone', 6, 8, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4820, N'Stone', 13, 16, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4821, N'Stone', 3, 7, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4822, N'Stone', 34, 10, NULL, 272)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4823, N'Bush', 39, 7, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4824, N'Bush', 33, 15, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4825, N'Bush', 22, 2, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4826, N'Bush', 9, 2, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4827, N'Bush', 17, 17, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4828, N'Bush', 13, 4, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4829, N'Bush', 33, 5, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4830, N'Bush', 7, 11, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4831, N'Bush', 26, 20, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4832, N'Bush', 11, 7, 5, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4833, N'Stone', 30, 11, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4834, N'Stone', 14, 9, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4835, N'Stone', 6, 14, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4836, N'Stone', 18, 9, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4837, N'Stone', 14, 3, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4838, N'Stone', 37, 2, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4839, N'Stone', 7, 12, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4840, N'Stone', 28, 11, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4841, N'Stone', 34, 16, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4842, N'Stone', 24, 19, NULL, 273)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4843, N'Bush', 2, 10, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4844, N'Bush', 12, 6, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4845, N'Bush', 39, 2, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4846, N'Bush', 12, 17, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4847, N'Bush', 38, 15, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4848, N'Bush', 4, 10, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4849, N'Bush', 33, 4, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4850, N'Bush', 6, 6, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4851, N'Bush', 14, 15, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4852, N'Bush', 14, 20, 5, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4853, N'Stone', 4, 7, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4854, N'Stone', 31, 12, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4855, N'Stone', 36, 15, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4856, N'Stone', 31, 18, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4857, N'Stone', 39, 14, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4858, N'Stone', 30, 1, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4859, N'Stone', 31, 1, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4860, N'Stone', 24, 19, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4861, N'Stone', 11, 2, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4862, N'Stone', 40, 14, NULL, 274)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4863, N'Bush', 36, 2, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4864, N'Bush', 25, 9, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4865, N'Bush', 21, 2, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4866, N'Bush', 15, 3, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4867, N'Bush', 21, 5, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4868, N'Bush', 9, 9, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4869, N'Bush', 12, 1, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4870, N'Bush', 5, 5, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4871, N'Bush', 28, 4, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4872, N'Bush', 3, 3, 5, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4873, N'Stone', 37, 4, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4874, N'Stone', 1, 10, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4875, N'Stone', 36, 10, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4876, N'Stone', 30, 6, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4877, N'Stone', 35, 6, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4878, N'Stone', 38, 8, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4879, N'Stone', 31, 4, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4880, N'Stone', 32, 4, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4881, N'Stone', 13, 2, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4882, N'Stone', 22, 1, NULL, 275)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4883, N'Bush', 31, 2, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4884, N'Bush', 25, 1, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4885, N'Bush', 32, 13, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4886, N'Bush', 34, 16, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4887, N'Bush', 3, 10, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4888, N'Bush', 5, 19, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4889, N'Bush', 34, 11, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4890, N'Bush', 14, 11, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4891, N'Bush', 26, 6, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4892, N'Bush', 16, 6, 5, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4893, N'Stone', 22, 10, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4894, N'Stone', 23, 15, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4895, N'Stone', 6, 3, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4896, N'Stone', 35, 10, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4897, N'Stone', 15, 12, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4898, N'Stone', 34, 15, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4899, N'Stone', 33, 5, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4900, N'Stone', 31, 14, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4901, N'Stone', 38, 2, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4902, N'Stone', 23, 10, NULL, 276)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4903, N'Bush', 13, 6, 5, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4904, N'Bush', 5, 6, 5, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4905, N'Bush', 10, 5, 5, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4906, N'Bush', 7, 2, 5, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4907, N'Bush', 4, 1, 5, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4908, N'Stone', 2, 3, NULL, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4909, N'Stone', 15, 3, NULL, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4910, N'Stone', 8, 2, NULL, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4911, N'Stone', 7, 1, NULL, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4912, N'Stone', 19, 10, NULL, 277)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4913, N'Bush', 35, 1, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4914, N'Bush', 36, 2, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4915, N'Bush', 26, 8, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4916, N'Bush', 17, 3, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4917, N'Bush', 2, 7, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4918, N'Bush', 9, 1, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4919, N'Bush', 25, 6, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4920, N'Bush', 38, 2, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4921, N'Bush', 15, 8, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4922, N'Bush', 31, 8, 5, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4923, N'Stone', 29, 5, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4924, N'Stone', 19, 9, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4925, N'Stone', 39, 5, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4926, N'Stone', 30, 9, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4927, N'Stone', 18, 8, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4928, N'Stone', 38, 6, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4929, N'Stone', 13, 6, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4930, N'Stone', 36, 6, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4931, N'Stone', 6, 5, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4932, N'Stone', 35, 7, NULL, 278)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4933, N'Bush', 25, 9, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4934, N'Bush', 24, 5, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4935, N'Bush', 27, 10, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4936, N'Bush', 27, 7, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4937, N'Bush', 17, 1, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4938, N'Bush', 29, 5, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4939, N'Bush', 11, 2, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4940, N'Bush', 22, 4, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4941, N'Bush', 23, 3, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4942, N'Bush', 17, 10, 5, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4943, N'Stone', 24, 1, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4944, N'Stone', 39, 4, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4945, N'Stone', 18, 4, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4946, N'Stone', 14, 2, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4947, N'Stone', 3, 10, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4948, N'Stone', 17, 2, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4949, N'Stone', 34, 7, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4950, N'Stone', 5, 5, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4951, N'Stone', 40, 3, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4952, N'Stone', 21, 2, NULL, 279)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4953, N'Bush', 28, 1, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4954, N'Bush', 14, 4, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4955, N'Bush', 12, 3, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4956, N'Bush', 34, 2, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4957, N'Bush', 30, 4, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4958, N'Bush', 4, 5, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4959, N'Bush', 13, 8, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4960, N'Bush', 4, 7, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4961, N'Bush', 37, 1, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4962, N'Bush', 6, 7, 5, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4963, N'Stone', 39, 1, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4964, N'Stone', 32, 2, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4965, N'Stone', 36, 3, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4966, N'Stone', 14, 8, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4967, N'Stone', 20, 4, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4968, N'Stone', 23, 2, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4969, N'Stone', 27, 3, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4970, N'Stone', 34, 3, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4971, N'Stone', 8, 10, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4972, N'Stone', 26, 4, NULL, 280)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4973, N'Bush', 21, 20, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4974, N'Bush', 19, 20, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4975, N'Bush', 27, 6, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4976, N'Bush', 12, 10, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4977, N'Bush', 28, 19, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4978, N'Bush', 5, 11, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4979, N'Bush', 26, 4, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4980, N'Bush', 15, 4, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4981, N'Bush', 38, 2, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4982, N'Bush', 23, 7, 5, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4983, N'Stone', 23, 20, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4984, N'Stone', 24, 19, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4985, N'Stone', 7, 13, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4986, N'Stone', 35, 3, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4987, N'Stone', 15, 13, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4988, N'Stone', 27, 10, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4989, N'Stone', 9, 5, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4990, N'Stone', 31, 16, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4991, N'Stone', 35, 15, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4992, N'Stone', 16, 2, NULL, 281)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4993, N'Bush', 2, 7, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4994, N'Bush', 36, 8, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4995, N'Bush', 14, 5, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4996, N'Bush', 16, 17, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4997, N'Bush', 14, 19, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4998, N'Bush', 33, 16, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (4999, N'Bush', 8, 7, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5000, N'Bush', 37, 4, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5001, N'Bush', 5, 1, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5002, N'Bush', 3, 19, 5, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5003, N'Stone', 1, 12, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5004, N'Stone', 23, 7, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5005, N'Stone', 4, 18, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5006, N'Stone', 34, 7, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5007, N'Stone', 27, 19, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5008, N'Stone', 2, 11, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5009, N'Stone', 26, 10, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5010, N'Stone', 2, 2, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5011, N'Stone', 35, 12, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5012, N'Stone', 19, 11, NULL, 282)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5013, N'Bush', 28, 8, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5014, N'Bush', 12, 15, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5015, N'Bush', 26, 16, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5016, N'Bush', 25, 8, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5017, N'Bush', 5, 14, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5018, N'Bush', 19, 16, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5019, N'Bush', 12, 20, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5020, N'Bush', 6, 4, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5021, N'Bush', 8, 6, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5022, N'Bush', 27, 7, 5, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5023, N'Stone', 38, 7, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5024, N'Stone', 9, 14, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5025, N'Stone', 30, 10, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5026, N'Stone', 37, 17, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5027, N'Stone', 36, 12, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5028, N'Stone', 23, 15, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5029, N'Stone', 3, 5, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5030, N'Stone', 10, 2, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5031, N'Stone', 15, 19, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5032, N'Stone', 12, 9, NULL, 283)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5033, N'Bush', 17, 9, 5, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5034, N'Bush', 1, 5, 5, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5035, N'Bush', 19, 7, 5, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5036, N'Bush', 2, 7, 5, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5037, N'Bush', 2, 2, 5, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5038, N'Stone', 13, 2, NULL, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5039, N'Stone', 17, 3, NULL, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5040, N'Stone', 2, 8, NULL, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5041, N'Stone', 10, 1, NULL, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5042, N'Stone', 10, 3, NULL, 284)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5043, N'Bush', 27, 7, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5044, N'Bush', 31, 8, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5045, N'Bush', 22, 5, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5046, N'Bush', 19, 4, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5047, N'Bush', 37, 9, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5048, N'Bush', 20, 9, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5049, N'Bush', 20, 1, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5050, N'Bush', 9, 8, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5051, N'Bush', 7, 10, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5052, N'Bush', 38, 6, 5, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5053, N'Stone', 13, 9, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5054, N'Stone', 32, 7, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5055, N'Stone', 5, 6, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5056, N'Stone', 21, 1, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5057, N'Stone', 27, 9, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5058, N'Stone', 27, 6, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5059, N'Stone', 36, 4, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5060, N'Stone', 30, 10, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5061, N'Stone', 8, 7, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5062, N'Stone', 30, 3, NULL, 285)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5063, N'Bush', 15, 10, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5064, N'Bush', 26, 7, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5065, N'Bush', 32, 10, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5066, N'Bush', 34, 6, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5067, N'Bush', 15, 8, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5068, N'Bush', 27, 5, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5069, N'Bush', 12, 10, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5070, N'Bush', 2, 3, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5071, N'Bush', 33, 7, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5072, N'Bush', 12, 1, 5, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5073, N'Stone', 26, 6, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5074, N'Stone', 6, 2, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5075, N'Stone', 39, 10, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5076, N'Stone', 5, 8, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5077, N'Stone', 32, 2, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5078, N'Stone', 7, 5, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5079, N'Stone', 8, 2, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5080, N'Stone', 6, 9, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5081, N'Stone', 35, 8, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5082, N'Stone', 30, 2, NULL, 286)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5083, N'Bush', 6, 10, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5084, N'Bush', 25, 5, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5085, N'Bush', 36, 1, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5086, N'Bush', 33, 4, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5087, N'Bush', 10, 5, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5088, N'Bush', 31, 10, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5089, N'Bush', 4, 3, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5090, N'Bush', 29, 6, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5091, N'Bush', 29, 5, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5092, N'Bush', 40, 9, 5, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5093, N'Stone', 17, 1, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5094, N'Stone', 21, 8, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5095, N'Stone', 11, 1, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5096, N'Stone', 24, 1, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5097, N'Stone', 24, 9, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5098, N'Stone', 21, 5, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5099, N'Stone', 6, 9, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5100, N'Stone', 19, 8, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5101, N'Stone', 2, 4, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5102, N'Stone', 14, 1, NULL, 287)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5103, N'Bush', 34, 15, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5104, N'Bush', 30, 3, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5105, N'Bush', 16, 16, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5106, N'Bush', 32, 1, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5107, N'Bush', 26, 6, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5108, N'Bush', 29, 19, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5109, N'Bush', 3, 1, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5110, N'Bush', 4, 9, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5111, N'Bush', 39, 4, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5112, N'Bush', 11, 10, 5, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5113, N'Stone', 22, 14, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5114, N'Stone', 35, 15, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5115, N'Stone', 8, 1, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5116, N'Stone', 18, 1, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5117, N'Stone', 4, 17, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5118, N'Stone', 22, 1, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5119, N'Stone', 28, 10, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5120, N'Stone', 30, 12, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5121, N'Stone', 16, 6, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5122, N'Stone', 17, 2, NULL, 288)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5123, N'Bush', 40, 5, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5124, N'Bush', 15, 16, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5125, N'Bush', 36, 12, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5126, N'Bush', 35, 3, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5127, N'Bush', 28, 6, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5128, N'Bush', 32, 12, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5129, N'Bush', 2, 16, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5130, N'Bush', 25, 11, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5131, N'Bush', 31, 18, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5132, N'Bush', 23, 11, 5, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5133, N'Stone', 18, 9, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5134, N'Stone', 7, 13, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5135, N'Stone', 9, 4, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5136, N'Stone', 7, 11, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5137, N'Stone', 37, 10, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5138, N'Stone', 5, 20, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5139, N'Stone', 37, 1, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5140, N'Stone', 16, 18, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5141, N'Stone', 26, 5, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5142, N'Stone', 13, 17, NULL, 289)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5143, N'Bush', 32, 16, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5144, N'Bush', 30, 8, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5145, N'Bush', 22, 14, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5146, N'Bush', 33, 17, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5147, N'Bush', 26, 18, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5148, N'Bush', 1, 9, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5149, N'Bush', 35, 16, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5150, N'Bush', 37, 5, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5151, N'Bush', 39, 13, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5152, N'Bush', 5, 7, 5, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5153, N'Stone', 22, 2, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5154, N'Stone', 9, 16, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5155, N'Stone', 17, 8, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5156, N'Stone', 3, 5, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5157, N'Stone', 37, 10, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5158, N'Stone', 39, 1, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5159, N'Stone', 1, 4, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5160, N'Stone', 21, 15, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5161, N'Stone', 8, 2, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5162, N'Stone', 9, 17, NULL, 290)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5163, N'Bush', 8, 7, 5, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5164, N'Bush', 7, 4, 5, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5165, N'Bush', 8, 3, 5, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5166, N'Bush', 14, 2, 5, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5167, N'Bush', 3, 2, 5, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5168, N'Stone', 14, 10, NULL, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5169, N'Stone', 12, 1, NULL, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5170, N'Stone', 13, 6, NULL, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5171, N'Stone', 17, 5, NULL, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5172, N'Stone', 2, 1, NULL, 291)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5173, N'Bush', 35, 3, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5174, N'Bush', 24, 3, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5175, N'Bush', 38, 10, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5176, N'Bush', 40, 4, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5177, N'Bush', 4, 6, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5178, N'Bush', 39, 8, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5179, N'Bush', 17, 9, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5180, N'Bush', 10, 9, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5181, N'Bush', 1, 7, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5182, N'Bush', 2, 10, 5, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5183, N'Stone', 30, 10, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5184, N'Stone', 5, 10, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5185, N'Stone', 28, 8, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5186, N'Stone', 35, 6, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5187, N'Stone', 9, 8, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5188, N'Stone', 35, 8, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5189, N'Stone', 25, 6, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5190, N'Stone', 26, 4, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5191, N'Stone', 36, 7, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5192, N'Stone', 15, 10, NULL, 292)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5193, N'Bush', 39, 2, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5194, N'Bush', 35, 9, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5195, N'Bush', 35, 10, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5196, N'Bush', 12, 6, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5197, N'Bush', 16, 3, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5198, N'Bush', 40, 8, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5199, N'Bush', 13, 5, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5200, N'Bush', 37, 7, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5201, N'Bush', 3, 8, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5202, N'Bush', 11, 8, 5, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5203, N'Stone', 18, 1, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5204, N'Stone', 39, 8, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5205, N'Stone', 18, 9, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5206, N'Stone', 34, 5, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5207, N'Stone', 37, 10, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5208, N'Stone', 19, 2, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5209, N'Stone', 5, 2, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5210, N'Stone', 4, 5, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5211, N'Stone', 19, 1, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5212, N'Stone', 15, 6, NULL, 293)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5213, N'Bush', 8, 5, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5214, N'Bush', 21, 2, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5215, N'Bush', 22, 10, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5216, N'Bush', 5, 8, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5217, N'Bush', 26, 8, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5218, N'Bush', 1, 10, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5219, N'Bush', 18, 3, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5220, N'Bush', 24, 7, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5221, N'Bush', 16, 4, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5222, N'Bush', 14, 4, 5, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5223, N'Stone', 19, 3, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5224, N'Stone', 17, 4, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5225, N'Stone', 28, 4, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5226, N'Stone', 16, 1, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5227, N'Stone', 16, 10, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5228, N'Stone', 18, 5, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5229, N'Stone', 29, 5, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5230, N'Stone', 33, 7, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5231, N'Stone', 8, 1, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5232, N'Stone', 30, 10, NULL, 294)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5233, N'Bush', 17, 14, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5234, N'Bush', 39, 18, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5235, N'Bush', 37, 3, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5236, N'Bush', 2, 13, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5237, N'Bush', 2, 19, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5238, N'Bush', 24, 8, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5239, N'Bush', 8, 8, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5240, N'Bush', 37, 14, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5241, N'Bush', 5, 18, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5242, N'Bush', 29, 16, 5, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5243, N'Stone', 18, 14, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5244, N'Stone', 7, 3, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5245, N'Stone', 14, 16, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5246, N'Stone', 39, 11, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5247, N'Stone', 33, 16, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5248, N'Stone', 3, 4, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5249, N'Stone', 11, 14, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5250, N'Stone', 23, 12, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5251, N'Stone', 22, 19, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5252, N'Stone', 28, 6, NULL, 295)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5253, N'Bush', 18, 14, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5254, N'Bush', 35, 3, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5255, N'Bush', 36, 9, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5256, N'Bush', 6, 2, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5257, N'Bush', 28, 5, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5258, N'Bush', 1, 15, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5259, N'Bush', 16, 14, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5260, N'Bush', 26, 8, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5261, N'Bush', 14, 7, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5262, N'Bush', 4, 2, 5, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5263, N'Stone', 16, 19, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5264, N'Stone', 26, 2, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5265, N'Stone', 16, 2, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5266, N'Stone', 5, 14, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5267, N'Stone', 19, 16, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5268, N'Stone', 17, 19, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5269, N'Stone', 27, 3, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5270, N'Stone', 1, 6, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5271, N'Stone', 3, 13, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5272, N'Stone', 38, 2, NULL, 296)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5273, N'Bush', 15, 13, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5274, N'Bush', 14, 15, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5275, N'Bush', 21, 5, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5276, N'Bush', 5, 17, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5277, N'Bush', 16, 2, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5278, N'Bush', 35, 7, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5279, N'Bush', 33, 4, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5280, N'Bush', 38, 7, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5281, N'Bush', 38, 17, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5282, N'Bush', 19, 9, 5, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5283, N'Stone', 6, 11, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5284, N'Stone', 29, 13, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5285, N'Stone', 39, 19, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5286, N'Stone', 32, 3, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5287, N'Stone', 5, 1, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5288, N'Stone', 10, 11, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5289, N'Stone', 35, 8, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5290, N'Stone', 15, 11, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5291, N'Stone', 32, 10, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5292, N'Stone', 2, 12, NULL, 297)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5293, N'Bush', 31, 2, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5294, N'Bush', 25, 1, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5295, N'Bush', 32, 13, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5296, N'Bush', 34, 16, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5297, N'Bush', 3, 10, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5298, N'Bush', 5, 19, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5299, N'Bush', 34, 11, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5300, N'Bush', 14, 11, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5301, N'Bush', 26, 6, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5302, N'Bush', 16, 6, 5, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5303, N'Stone', 22, 10, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5304, N'Stone', 23, 15, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5305, N'Stone', 6, 3, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5306, N'Stone', 35, 10, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5307, N'Stone', 15, 12, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5308, N'Stone', 34, 15, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5309, N'Stone', 33, 5, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5310, N'Stone', 31, 14, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5311, N'Stone', 38, 2, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5312, N'Stone', 23, 10, NULL, 298)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5313, N'Bush', 6, 2, 5, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5314, N'Bush', 10, 8, 5, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5315, N'Bush', 11, 4, 5, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5316, N'Bush', 5, 7, 5, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5317, N'Bush', 14, 3, 5, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5318, N'Stone', 8, 10, NULL, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5319, N'Stone', 20, 3, NULL, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5320, N'Stone', 10, 4, NULL, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5321, N'Stone', 1, 1, NULL, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5322, N'Stone', 14, 10, NULL, 299)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5323, N'Bush', 6, 3, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5324, N'Bush', 23, 6, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5325, N'Bush', 10, 5, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5326, N'Bush', 15, 2, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5327, N'Bush', 3, 4, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5328, N'Bush', 38, 5, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5329, N'Bush', 29, 4, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5330, N'Bush', 34, 10, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5331, N'Bush', 19, 5, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5332, N'Bush', 34, 1, 5, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5333, N'Stone', 3, 8, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5334, N'Stone', 24, 2, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5335, N'Stone', 17, 3, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5336, N'Stone', 27, 7, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5337, N'Stone', 6, 9, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5338, N'Stone', 2, 9, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5339, N'Stone', 26, 2, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5340, N'Stone', 10, 7, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5341, N'Stone', 6, 2, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5342, N'Stone', 5, 7, NULL, 300)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5343, N'Bush', 21, 5, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5344, N'Bush', 23, 9, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5345, N'Bush', 22, 10, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5346, N'Bush', 28, 4, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5347, N'Bush', 4, 6, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5348, N'Bush', 21, 4, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5349, N'Bush', 10, 3, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5350, N'Bush', 9, 1, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5351, N'Bush', 14, 3, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5352, N'Bush', 35, 10, 5, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5353, N'Stone', 23, 6, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5354, N'Stone', 16, 4, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5355, N'Stone', 33, 4, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5356, N'Stone', 27, 4, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5357, N'Stone', 7, 8, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5358, N'Stone', 22, 7, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5359, N'Stone', 17, 6, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5360, N'Stone', 30, 2, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5361, N'Stone', 36, 8, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5362, N'Stone', 20, 3, NULL, 301)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5363, N'Bush', 35, 10, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5364, N'Bush', 3, 6, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5365, N'Bush', 14, 3, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5366, N'Bush', 27, 9, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5367, N'Bush', 18, 10, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5368, N'Bush', 24, 8, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5369, N'Bush', 36, 1, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5370, N'Bush', 29, 8, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5371, N'Bush', 20, 10, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5372, N'Bush', 11, 6, 5, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5373, N'Stone', 7, 3, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5374, N'Stone', 39, 7, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5375, N'Stone', 21, 9, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5376, N'Stone', 11, 8, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5377, N'Stone', 2, 6, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5378, N'Stone', 22, 7, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5379, N'Stone', 16, 6, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5380, N'Stone', 30, 9, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5381, N'Stone', 19, 3, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5382, N'Stone', 2, 4, NULL, 302)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5383, N'Bush', 10, 2, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5384, N'Bush', 15, 9, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5385, N'Bush', 25, 13, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5386, N'Bush', 39, 3, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5387, N'Bush', 20, 2, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5388, N'Bush', 29, 15, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5389, N'Bush', 14, 6, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5390, N'Bush', 23, 5, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5391, N'Bush', 11, 6, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5392, N'Bush', 38, 3, 5, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5393, N'Stone', 17, 20, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5394, N'Stone', 36, 19, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5395, N'Stone', 12, 16, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5396, N'Stone', 14, 10, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5397, N'Stone', 24, 10, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5398, N'Stone', 25, 5, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5399, N'Stone', 30, 14, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5400, N'Stone', 39, 4, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5401, N'Stone', 35, 19, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5402, N'Stone', 1, 14, NULL, 303)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5403, N'Bush', 14, 13, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5404, N'Bush', 8, 14, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5405, N'Bush', 22, 9, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5406, N'Bush', 39, 20, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5407, N'Bush', 32, 9, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5408, N'Bush', 1, 20, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5409, N'Bush', 36, 16, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5410, N'Bush', 37, 20, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5411, N'Bush', 6, 7, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5412, N'Bush', 28, 3, 5, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5413, N'Stone', 16, 19, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5414, N'Stone', 29, 19, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5415, N'Stone', 18, 7, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5416, N'Stone', 32, 11, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5417, N'Stone', 39, 4, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5418, N'Stone', 31, 9, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5419, N'Stone', 19, 5, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5420, N'Stone', 21, 15, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5421, N'Stone', 5, 13, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5422, N'Stone', 21, 3, NULL, 304)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5423, N'Bush', 1, 15, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5424, N'Bush', 19, 20, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5425, N'Bush', 38, 13, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5426, N'Bush', 21, 9, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5427, N'Bush', 30, 20, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5428, N'Bush', 3, 14, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5429, N'Bush', 30, 5, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5430, N'Bush', 21, 1, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5431, N'Bush', 21, 11, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5432, N'Bush', 5, 19, 5, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5433, N'Stone', 4, 20, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5434, N'Stone', 35, 4, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5435, N'Stone', 6, 1, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5436, N'Stone', 39, 20, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5437, N'Stone', 2, 18, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5438, N'Stone', 11, 15, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5439, N'Stone', 35, 5, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5440, N'Stone', 4, 12, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5441, N'Stone', 33, 6, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5442, N'Stone', 19, 16, NULL, 305)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5443, N'Bush', 14, 5, 5, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5444, N'Bush', 16, 2, 5, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5445, N'Bush', 16, 4, 5, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5446, N'Bush', 6, 10, 5, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5447, N'Bush', 17, 5, 5, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5448, N'Stone', 8, 9, NULL, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5449, N'Stone', 4, 7, NULL, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5450, N'Stone', 11, 10, NULL, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5451, N'Stone', 16, 10, NULL, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5452, N'Stone', 18, 8, NULL, 306)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5453, N'Bush', 3, 3, 5, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5454, N'Bush', 16, 5, 5, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5455, N'Bush', 7, 2, 5, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5456, N'Bush', 17, 10, 5, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5457, N'Bush', 4, 8, 5, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5458, N'Stone', 7, 6, NULL, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5459, N'Stone', 13, 2, NULL, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5460, N'Stone', 1, 4, NULL, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5461, N'Stone', 11, 5, NULL, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5462, N'Stone', 20, 6, NULL, 307)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5463, N'Bush', 12, 5, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5464, N'Bush', 6, 1, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5465, N'Bush', 25, 7, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5466, N'Bush', 19, 5, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5467, N'Bush', 5, 5, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5468, N'Bush', 27, 2, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5469, N'Bush', 18, 2, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5470, N'Bush', 31, 1, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5471, N'Bush', 2, 9, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5472, N'Bush', 5, 9, 5, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5473, N'Stone', 1, 9, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5474, N'Stone', 30, 2, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5475, N'Stone', 15, 7, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5476, N'Stone', 35, 4, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5477, N'Stone', 27, 9, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5478, N'Stone', 33, 10, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5479, N'Stone', 12, 10, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5480, N'Stone', 8, 7, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5481, N'Stone', 32, 10, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5482, N'Stone', 28, 4, NULL, 308)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5483, N'Bush', 4, 6, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5484, N'Bush', 14, 8, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5485, N'Bush', 11, 8, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5486, N'Bush', 18, 4, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5487, N'Bush', 32, 5, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5488, N'Bush', 4, 4, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5489, N'Bush', 32, 8, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5490, N'Bush', 25, 1, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5491, N'Bush', 32, 9, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5492, N'Bush', 37, 4, 5, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5493, N'Stone', 29, 4, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5494, N'Stone', 7, 5, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5495, N'Stone', 14, 3, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5496, N'Stone', 23, 1, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5497, N'Stone', 12, 9, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5498, N'Stone', 39, 3, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5499, N'Stone', 5, 2, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5500, N'Stone', 39, 5, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5501, N'Stone', 6, 1, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5502, N'Stone', 16, 5, NULL, 309)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5503, N'Bush', 33, 1, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5504, N'Bush', 9, 3, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5505, N'Bush', 35, 7, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5506, N'Bush', 9, 7, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5507, N'Bush', 29, 9, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5508, N'Bush', 12, 2, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5509, N'Bush', 1, 7, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5510, N'Bush', 19, 6, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5511, N'Bush', 20, 2, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5512, N'Bush', 22, 1, 5, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5513, N'Stone', 8, 6, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5514, N'Stone', 39, 9, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5515, N'Stone', 31, 4, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5516, N'Stone', 13, 5, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5517, N'Stone', 5, 10, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5518, N'Stone', 14, 4, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5519, N'Stone', 32, 2, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5520, N'Stone', 17, 9, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5521, N'Stone', 34, 2, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5522, N'Stone', 20, 5, NULL, 310)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5523, N'Bush', 16, 18, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5524, N'Bush', 19, 17, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5525, N'Bush', 40, 4, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5526, N'Bush', 15, 20, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5527, N'Bush', 30, 9, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5528, N'Bush', 19, 15, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5529, N'Bush', 11, 1, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5530, N'Bush', 40, 11, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5531, N'Bush', 39, 4, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5532, N'Bush', 1, 10, 5, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5533, N'Stone', 12, 20, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5534, N'Stone', 23, 3, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5535, N'Stone', 15, 2, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5536, N'Stone', 21, 16, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5537, N'Stone', 27, 3, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5538, N'Stone', 19, 2, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5539, N'Stone', 33, 9, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5540, N'Stone', 38, 19, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5541, N'Stone', 6, 17, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5542, N'Stone', 38, 8, NULL, 311)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5543, N'Bush', 23, 18, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5544, N'Bush', 32, 15, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5545, N'Bush', 31, 10, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5546, N'Bush', 28, 19, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5547, N'Bush', 1, 13, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5548, N'Bush', 10, 9, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5549, N'Bush', 35, 18, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5550, N'Bush', 38, 12, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5551, N'Bush', 17, 16, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5552, N'Bush', 23, 11, 5, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5553, N'Stone', 35, 14, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5554, N'Stone', 38, 17, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5555, N'Stone', 34, 20, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5556, N'Stone', 11, 8, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5557, N'Stone', 40, 16, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5558, N'Stone', 3, 9, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5559, N'Stone', 20, 20, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5560, N'Stone', 12, 8, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5561, N'Stone', 28, 5, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5562, N'Stone', 34, 10, NULL, 312)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5563, N'Bush', 2, 19, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5564, N'Bush', 29, 5, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5565, N'Bush', 12, 8, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5566, N'Bush', 15, 17, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5567, N'Bush', 15, 16, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5568, N'Bush', 3, 2, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5569, N'Bush', 13, 20, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5570, N'Bush', 31, 12, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5571, N'Bush', 27, 10, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5572, N'Bush', 17, 13, 5, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5573, N'Stone', 13, 12, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5574, N'Stone', 24, 10, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5575, N'Stone', 5, 2, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5576, N'Stone', 2, 8, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5577, N'Stone', 30, 20, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5578, N'Stone', 33, 20, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5579, N'Stone', 32, 2, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5580, N'Stone', 28, 2, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5581, N'Stone', 11, 6, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5582, N'Stone', 12, 18, NULL, 313)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5583, N'Bush', 19, 8, 5, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5584, N'Bush', 8, 3, 5, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5585, N'Bush', 12, 7, 5, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5586, N'Bush', 11, 6, 5, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5587, N'Bush', 15, 8, 5, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5588, N'Stone', 7, 7, NULL, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5589, N'Stone', 20, 2, NULL, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5590, N'Stone', 18, 7, NULL, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5591, N'Stone', 8, 6, NULL, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5592, N'Stone', 1, 5, NULL, 314)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5593, N'Bush', 3, 8, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5594, N'Bush', 26, 1, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5595, N'Bush', 23, 7, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5596, N'Bush', 11, 1, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5597, N'Bush', 14, 1, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5598, N'Bush', 16, 6, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5599, N'Bush', 35, 3, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5600, N'Bush', 10, 1, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5601, N'Bush', 19, 2, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5602, N'Bush', 3, 4, 5, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5603, N'Stone', 17, 3, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5604, N'Stone', 2, 8, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5605, N'Stone', 34, 9, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5606, N'Stone', 37, 4, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5607, N'Stone', 39, 8, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5608, N'Stone', 13, 2, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5609, N'Stone', 18, 3, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5610, N'Stone', 36, 4, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5611, N'Stone', 40, 4, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5612, N'Stone', 25, 6, NULL, 315)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5613, N'Bush', 32, 4, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5614, N'Bush', 18, 1, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5615, N'Bush', 24, 2, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5616, N'Bush', 37, 2, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5617, N'Bush', 14, 3, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5618, N'Bush', 12, 10, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5619, N'Bush', 30, 9, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5620, N'Bush', 21, 5, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5621, N'Bush', 28, 9, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5622, N'Bush', 38, 2, 5, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5623, N'Stone', 4, 6, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5624, N'Stone', 24, 3, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5625, N'Stone', 17, 2, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5626, N'Stone', 11, 5, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5627, N'Stone', 28, 2, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5628, N'Stone', 13, 6, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5629, N'Stone', 20, 7, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5630, N'Stone', 28, 4, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5631, N'Stone', 17, 5, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5632, N'Stone', 34, 5, NULL, 316)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5633, N'Bush', 33, 2, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5634, N'Bush', 21, 1, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5635, N'Bush', 3, 6, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5636, N'Bush', 18, 5, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5637, N'Bush', 15, 9, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5638, N'Bush', 35, 10, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5639, N'Bush', 3, 5, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5640, N'Bush', 14, 10, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5641, N'Bush', 24, 7, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5642, N'Bush', 1, 3, 5, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5643, N'Stone', 8, 6, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5644, N'Stone', 28, 8, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5645, N'Stone', 11, 1, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5646, N'Stone', 15, 1, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5647, N'Stone', 36, 3, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5648, N'Stone', 16, 2, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5649, N'Stone', 6, 6, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5650, N'Stone', 5, 7, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5651, N'Stone', 17, 3, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5652, N'Stone', 9, 4, NULL, 317)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5653, N'Bush', 26, 2, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5654, N'Bush', 30, 8, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5655, N'Bush', 3, 14, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5656, N'Bush', 11, 4, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5657, N'Bush', 4, 19, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5658, N'Bush', 14, 10, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5659, N'Bush', 1, 17, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5660, N'Bush', 24, 12, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5661, N'Bush', 8, 19, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5662, N'Bush', 38, 8, 5, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5663, N'Stone', 23, 8, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5664, N'Stone', 7, 20, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5665, N'Stone', 26, 3, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5666, N'Stone', 20, 17, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5667, N'Stone', 28, 20, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5668, N'Stone', 26, 12, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5669, N'Stone', 35, 18, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5670, N'Stone', 12, 2, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5671, N'Stone', 10, 18, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5672, N'Stone', 11, 10, NULL, 318)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5673, N'Bush', 20, 20, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5674, N'Bush', 28, 10, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5675, N'Bush', 21, 6, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5676, N'Bush', 39, 6, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5677, N'Bush', 1, 15, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5678, N'Bush', 12, 4, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5679, N'Bush', 10, 15, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5680, N'Bush', 14, 11, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5681, N'Bush', 37, 11, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5682, N'Bush', 40, 11, 5, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5683, N'Stone', 2, 17, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5684, N'Stone', 28, 20, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5685, N'Stone', 1, 10, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5686, N'Stone', 17, 9, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5687, N'Stone', 6, 12, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5688, N'Stone', 33, 14, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5689, N'Stone', 6, 18, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5690, N'Stone', 10, 2, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5691, N'Stone', 27, 6, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5692, N'Stone', 18, 4, NULL, 319)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5693, N'Bush', 2, 4, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5694, N'Bush', 5, 18, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5695, N'Bush', 23, 14, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5696, N'Bush', 11, 10, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5697, N'Bush', 37, 17, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5698, N'Bush', 35, 17, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5699, N'Bush', 28, 7, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5700, N'Bush', 17, 15, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5701, N'Bush', 32, 16, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5702, N'Bush', 31, 18, 5, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5703, N'Stone', 37, 7, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5704, N'Stone', 1, 6, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5705, N'Stone', 28, 5, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5706, N'Stone', 7, 15, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5707, N'Stone', 1, 14, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5708, N'Stone', 3, 20, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5709, N'Stone', 33, 7, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5710, N'Stone', 6, 2, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5711, N'Stone', 7, 3, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5712, N'Stone', 22, 19, NULL, 320)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5713, N'Bush', 2, 4, 5, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5714, N'Bush', 8, 1, 5, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5715, N'Bush', 13, 2, 5, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5716, N'Bush', 16, 4, 5, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5717, N'Bush', 15, 2, 5, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5718, N'Stone', 14, 1, NULL, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5719, N'Stone', 1, 8, NULL, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5720, N'Stone', 3, 6, NULL, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5721, N'Stone', 12, 1, NULL, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5722, N'Stone', 9, 2, NULL, 321)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5723, N'Bush', 36, 7, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5724, N'Bush', 6, 5, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5725, N'Bush', 3, 5, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5726, N'Bush', 31, 5, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5727, N'Bush', 20, 7, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5728, N'Bush', 3, 1, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5729, N'Bush', 30, 1, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5730, N'Bush', 28, 4, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5731, N'Bush', 17, 1, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5732, N'Bush', 21, 7, 5, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5733, N'Stone', 14, 1, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5734, N'Stone', 4, 8, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5735, N'Stone', 17, 9, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5736, N'Stone', 29, 10, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5737, N'Stone', 35, 5, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5738, N'Stone', 27, 6, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5739, N'Stone', 28, 3, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5740, N'Stone', 21, 3, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5741, N'Stone', 5, 6, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5742, N'Stone', 25, 7, NULL, 322)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5743, N'Bush', 3, 1, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5744, N'Bush', 26, 10, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5745, N'Bush', 15, 6, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5746, N'Bush', 36, 4, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5747, N'Bush', 12, 1, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5748, N'Bush', 17, 4, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5749, N'Bush', 12, 3, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5750, N'Bush', 25, 5, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5751, N'Bush', 5, 1, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5752, N'Bush', 8, 10, 5, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5753, N'Stone', 16, 9, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5754, N'Stone', 33, 7, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5755, N'Stone', 38, 7, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5756, N'Stone', 38, 1, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5757, N'Stone', 12, 10, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5758, N'Stone', 1, 1, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5759, N'Stone', 36, 9, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5760, N'Stone', 4, 9, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5761, N'Stone', 18, 2, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5762, N'Stone', 2, 4, NULL, 323)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5763, N'Bush', 8, 8, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5764, N'Bush', 13, 5, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5765, N'Bush', 31, 2, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5766, N'Bush', 22, 9, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5767, N'Bush', 30, 5, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5768, N'Bush', 3, 8, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5769, N'Bush', 32, 5, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5770, N'Bush', 34, 5, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5771, N'Bush', 27, 3, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5772, N'Bush', 11, 9, 5, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5773, N'Stone', 19, 2, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5774, N'Stone', 3, 2, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5775, N'Stone', 38, 8, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5776, N'Stone', 2, 8, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5777, N'Stone', 7, 5, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5778, N'Stone', 10, 1, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5779, N'Stone', 26, 4, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5780, N'Stone', 2, 3, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5781, N'Stone', 29, 7, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5782, N'Stone', 35, 1, NULL, 324)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5783, N'Bush', 37, 16, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5784, N'Bush', 18, 18, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5785, N'Bush', 16, 20, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5786, N'Bush', 15, 8, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5787, N'Bush', 13, 3, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5788, N'Bush', 34, 4, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5789, N'Bush', 4, 19, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5790, N'Bush', 11, 6, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5791, N'Bush', 16, 6, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5792, N'Bush', 9, 19, 5, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5793, N'Stone', 14, 15, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5794, N'Stone', 14, 6, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5795, N'Stone', 12, 10, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5796, N'Stone', 25, 6, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5797, N'Stone', 2, 9, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5798, N'Stone', 28, 15, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5799, N'Stone', 22, 9, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5800, N'Stone', 12, 9, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5801, N'Stone', 26, 20, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5802, N'Stone', 7, 13, NULL, 325)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5803, N'Bush', 34, 19, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5804, N'Bush', 24, 4, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5805, N'Bush', 3, 17, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5806, N'Bush', 10, 7, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5807, N'Bush', 38, 2, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5808, N'Bush', 36, 9, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5809, N'Bush', 19, 7, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5810, N'Bush', 28, 15, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5811, N'Bush', 33, 10, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5812, N'Bush', 27, 13, 5, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5813, N'Stone', 13, 11, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5814, N'Stone', 26, 17, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5815, N'Stone', 20, 6, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5816, N'Stone', 32, 14, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5817, N'Stone', 13, 10, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5818, N'Stone', 24, 14, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5819, N'Stone', 38, 11, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5820, N'Stone', 9, 2, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5821, N'Stone', 29, 6, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5822, N'Stone', 23, 2, NULL, 326)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5823, N'Bush', 15, 11, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5824, N'Bush', 11, 7, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5825, N'Bush', 5, 2, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5826, N'Bush', 32, 13, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5827, N'Bush', 22, 7, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5828, N'Bush', 20, 5, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5829, N'Bush', 29, 8, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5830, N'Bush', 32, 1, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5831, N'Bush', 8, 8, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5832, N'Bush', 25, 12, 5, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5833, N'Stone', 21, 7, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5834, N'Stone', 11, 2, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5835, N'Stone', 28, 7, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5836, N'Stone', 12, 12, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5837, N'Stone', 5, 6, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5838, N'Stone', 37, 19, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5839, N'Stone', 12, 17, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5840, N'Stone', 30, 20, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5841, N'Stone', 13, 18, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5842, N'Stone', 19, 1, NULL, 327)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5843, N'Bush', 2, 6, 5, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5844, N'Bush', 10, 8, 5, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5845, N'Bush', 10, 3, 5, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5846, N'Bush', 11, 6, 5, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5847, N'Bush', 18, 6, 5, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5848, N'Stone', 18, 5, NULL, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5849, N'Stone', 5, 5, NULL, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5850, N'Stone', 13, 7, NULL, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5851, N'Stone', 10, 5, NULL, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5852, N'Stone', 9, 10, NULL, 328)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5853, N'Bush', 40, 6, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5854, N'Bush', 20, 4, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5855, N'Bush', 18, 8, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5856, N'Bush', 15, 2, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5857, N'Bush', 16, 3, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5858, N'Bush', 27, 3, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5859, N'Bush', 14, 2, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5860, N'Bush', 11, 6, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5861, N'Bush', 7, 8, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5862, N'Bush', 33, 3, 5, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5863, N'Stone', 28, 3, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5864, N'Stone', 24, 10, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5865, N'Stone', 36, 5, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5866, N'Stone', 39, 9, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5867, N'Stone', 14, 1, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5868, N'Stone', 33, 5, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5869, N'Stone', 13, 1, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5870, N'Stone', 31, 2, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5871, N'Stone', 7, 4, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5872, N'Stone', 34, 3, NULL, 329)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5873, N'Bush', 33, 8, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5874, N'Bush', 10, 10, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5875, N'Bush', 35, 10, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5876, N'Bush', 33, 9, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5877, N'Bush', 9, 2, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5878, N'Bush', 33, 2, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5879, N'Bush', 40, 3, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5880, N'Bush', 2, 7, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5881, N'Bush', 11, 9, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5882, N'Bush', 28, 6, 5, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5883, N'Stone', 6, 3, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5884, N'Stone', 23, 7, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5885, N'Stone', 18, 10, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5886, N'Stone', 32, 7, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5887, N'Stone', 19, 2, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5888, N'Stone', 27, 8, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5889, N'Stone', 12, 2, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5890, N'Stone', 8, 5, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5891, N'Stone', 37, 5, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5892, N'Stone', 6, 10, NULL, 330)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5893, N'Bush', 15, 10, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5894, N'Bush', 8, 1, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5895, N'Bush', 30, 1, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5896, N'Bush', 38, 2, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5897, N'Bush', 2, 6, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5898, N'Bush', 26, 5, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5899, N'Bush', 40, 5, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5900, N'Bush', 33, 5, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5901, N'Bush', 12, 8, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5902, N'Bush', 39, 3, 5, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5903, N'Stone', 15, 1, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5904, N'Stone', 13, 2, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5905, N'Stone', 9, 1, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5906, N'Stone', 8, 8, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5907, N'Stone', 4, 8, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5908, N'Stone', 12, 10, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5909, N'Stone', 30, 7, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5910, N'Stone', 33, 6, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5911, N'Stone', 26, 2, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5912, N'Stone', 31, 7, NULL, 331)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5913, N'Bush', 16, 12, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5914, N'Bush', 40, 3, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5915, N'Bush', 14, 17, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5916, N'Bush', 32, 11, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5917, N'Bush', 13, 4, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5918, N'Bush', 33, 10, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5919, N'Bush', 38, 14, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5920, N'Bush', 9, 8, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5921, N'Bush', 25, 10, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5922, N'Bush', 32, 19, 5, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5923, N'Stone', 28, 17, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5924, N'Stone', 16, 20, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5925, N'Stone', 36, 15, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5926, N'Stone', 29, 14, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5927, N'Stone', 20, 2, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5928, N'Stone', 1, 4, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5929, N'Stone', 10, 5, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5930, N'Stone', 12, 17, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5931, N'Stone', 35, 4, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5932, N'Stone', 15, 11, NULL, 332)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5933, N'Bush', 22, 2, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5934, N'Bush', 10, 1, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5935, N'Bush', 40, 15, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5936, N'Bush', 26, 5, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5937, N'Bush', 37, 19, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5938, N'Bush', 33, 9, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5939, N'Bush', 3, 13, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5940, N'Bush', 32, 10, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5941, N'Bush', 36, 10, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5942, N'Bush', 37, 20, 5, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5943, N'Stone', 39, 13, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5944, N'Stone', 39, 6, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5945, N'Stone', 26, 19, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5946, N'Stone', 11, 14, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5947, N'Stone', 5, 10, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5948, N'Stone', 13, 2, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5949, N'Stone', 10, 19, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5950, N'Stone', 3, 20, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5951, N'Stone', 8, 4, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5952, N'Stone', 24, 20, NULL, 333)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5953, N'Bush', 23, 4, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5954, N'Bush', 8, 17, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5955, N'Bush', 9, 3, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5956, N'Bush', 5, 14, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5957, N'Bush', 35, 16, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5958, N'Bush', 37, 6, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5959, N'Bush', 24, 15, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5960, N'Bush', 8, 9, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5961, N'Bush', 29, 8, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5962, N'Bush', 21, 4, 5, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5963, N'Stone', 3, 18, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5964, N'Stone', 11, 15, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5965, N'Stone', 19, 12, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5966, N'Stone', 35, 9, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5967, N'Stone', 29, 2, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5968, N'Stone', 4, 8, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5969, N'Stone', 20, 8, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5970, N'Stone', 37, 13, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5971, N'Stone', 17, 11, NULL, 334)
GO
INSERT [dbo].[Obstacles] ([ObstaclesID], [Type], [X], [Y], [Damage], [MapID]) VALUES (5972, N'Stone', 10, 7, NULL, 334)
GO
SET IDENTITY_INSERT [dbo].[Obstacles] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerSaves] ON 
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (8, N'danil', CAST(N'2022-02-10' AS Date), 4, 113, 242)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (9, N'danil', CAST(N'2022-02-10' AS Date), 6, 15, 243)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (10, N'danil', CAST(N'2022-02-10' AS Date), 6, 126, 244)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (11, N'vitya', CAST(N'2022-02-10' AS Date), 1, 10, 252)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (12, N'vitya', CAST(N'2022-02-10' AS Date), 4, 38, 260)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (13, N'mashsa', CAST(N'2022-02-10' AS Date), 4, 7, 275)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (14, N'mashsa', CAST(N'2022-02-10' AS Date), 6, 0, 276)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (15, N'danil', CAST(N'2022-02-10' AS Date), 6, 63, 298)
GO
INSERT [dbo].[PlayerSaves] ([PlayerSavesID], [UserName], [DateOfPassage], [DifficultyLevel], [SpeedOfPassage], [MapID]) VALUES (16, N'danil', CAST(N'2022-02-10' AS Date), 1, 3, 306)
GO
SET IDENTITY_INSERT [dbo].[PlayerSaves] OFF
GO
SET IDENTITY_INSERT [dbo].[Traps] ON 
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (172, N'MouseTrap', 30, 12, 0, 5, 1, 241)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (173, N'MouseTrap', 10, 10, 0, 5, 1, 241)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (174, N'MouseTrap', 30, 12, 0, 5, 1, 241)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (175, N'Pitfall', 22, 19, 0, 20, 2, 241)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (176, N'Pitfall', 33, 15, 0, 20, 2, 241)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (177, N'Pitfall', 15, 2, 0, 20, 2, 241)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (178, N'MouseTrap', 5, 16, 0, 5, 1, 251)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (179, N'MouseTrap', 18, 14, 0, 5, 1, 251)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (180, N'MouseTrap', 25, 13, 0, 5, 1, 251)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (181, N'Pitfall', 17, 6, 0, 20, 2, 251)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (182, N'Pitfall', 34, 19, 0, 20, 2, 251)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (183, N'Pitfall', 23, 15, 0, 20, 2, 251)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (184, N'MouseTrap', 10, 1, 0, 5, 1, 259)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (185, N'MouseTrap', 25, 15, 0, 5, 1, 259)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (186, N'MouseTrap', 37, 6, 0, 5, 1, 259)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (187, N'Pitfall', 33, 14, 0, 20, 2, 259)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (188, N'Pitfall', 17, 2, 0, 20, 2, 259)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (189, N'Pitfall', 34, 8, 0, 20, 2, 259)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (190, N'MouseTrap', 15, 2, 0, 5, 1, 267)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (191, N'MouseTrap', 10, 7, 0, 5, 1, 267)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (192, N'MouseTrap', 20, 17, 0, 5, 1, 267)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (193, N'Pitfall', 18, 19, 0, 20, 2, 267)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (194, N'Pitfall', 12, 4, 0, 20, 2, 267)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (195, N'Pitfall', 13, 15, 0, 20, 2, 267)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (196, N'MouseTrap', 22, 1, 0, 5, 1, 274)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (197, N'MouseTrap', 7, 15, 0, 5, 1, 274)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (198, N'MouseTrap', 15, 18, 0, 5, 1, 274)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (199, N'Pitfall', 28, 3, 0, 20, 2, 274)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (200, N'Pitfall', 36, 2, 0, 20, 2, 274)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (201, N'Pitfall', 33, 6, 0, 20, 2, 274)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (202, N'MouseTrap', 27, 16, 0, 5, 1, 283)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (203, N'MouseTrap', 17, 3, 0, 5, 1, 283)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (204, N'MouseTrap', 6, 11, 0, 5, 1, 283)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (205, N'Pitfall', 17, 10, 0, 20, 2, 283)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (206, N'Pitfall', 35, 3, 0, 20, 2, 283)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (207, N'Pitfall', 32, 3, 0, 20, 2, 283)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (208, N'MouseTrap', 25, 3, 0, 5, 1, 290)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (209, N'MouseTrap', 3, 1, 0, 5, 1, 290)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (210, N'MouseTrap', 12, 8, 0, 5, 1, 290)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (211, N'Pitfall', 30, 9, 0, 20, 2, 290)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (212, N'Pitfall', 29, 13, 0, 20, 2, 290)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (213, N'Pitfall', 18, 16, 0, 20, 2, 290)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (214, N'MouseTrap', 32, 17, 0, 5, 1, 297)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (215, N'MouseTrap', 18, 17, 0, 5, 1, 297)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (216, N'MouseTrap', 9, 8, 0, 5, 1, 297)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (217, N'Pitfall', 24, 20, 0, 20, 2, 297)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (218, N'Pitfall', 4, 9, 0, 20, 2, 297)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (219, N'Pitfall', 34, 3, 0, 20, 2, 297)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (220, N'MouseTrap', 9, 12, 0, 5, 1, 305)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (221, N'MouseTrap', 23, 16, 0, 5, 1, 305)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (222, N'MouseTrap', 9, 14, 0, 5, 1, 305)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (223, N'Pitfall', 34, 19, 0, 20, 2, 305)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (224, N'Pitfall', 35, 17, 0, 20, 2, 305)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (225, N'Pitfall', 27, 17, 0, 20, 2, 305)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (226, N'MouseTrap', 40, 4, 0, 5, 1, 313)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (227, N'MouseTrap', 9, 10, 0, 5, 1, 313)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (228, N'MouseTrap', 20, 11, 0, 5, 1, 313)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (229, N'Pitfall', 24, 1, 0, 20, 2, 313)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (230, N'Pitfall', 6, 13, 0, 20, 2, 313)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (231, N'Pitfall', 38, 8, 0, 20, 2, 313)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (232, N'MouseTrap', 10, 5, 0, 5, 1, 320)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (233, N'MouseTrap', 10, 8, 0, 5, 1, 320)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (234, N'MouseTrap', 17, 3, 0, 5, 1, 320)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (235, N'Pitfall', 28, 7, 0, 20, 2, 320)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (236, N'Pitfall', 2, 5, 0, 20, 2, 320)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (237, N'Pitfall', 32, 18, 0, 20, 2, 320)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (238, N'MouseTrap', 8, 13, 0, 5, 1, 327)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (239, N'MouseTrap', 29, 17, 0, 5, 1, 327)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (240, N'MouseTrap', 22, 2, 0, 5, 1, 327)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (241, N'Pitfall', 16, 6, 0, 20, 2, 327)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (242, N'Pitfall', 31, 18, 0, 20, 2, 327)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (243, N'Pitfall', 30, 15, 0, 20, 2, 327)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (244, N'MouseTrap', 21, 12, 0, 5, 1, 334)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (245, N'MouseTrap', 29, 2, 0, 5, 1, 334)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (246, N'MouseTrap', 13, 7, 0, 5, 1, 334)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (247, N'Pitfall', 27, 2, 0, 20, 2, 334)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (248, N'Pitfall', 30, 9, 0, 20, 2, 334)
GO
INSERT [dbo].[Traps] ([TrapID], [Type], [X], [Y], [Triggered], [AmountOfEffect], [Effect], [MapID]) VALUES (249, N'Pitfall', 30, 19, 0, 20, 2, 334)
GO
SET IDENTITY_INSERT [dbo].[Traps] OFF
GO
ALTER TABLE [dbo].[Benefits]  WITH CHECK ADD  CONSTRAINT [FK_Benefits_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[Benefits] CHECK CONSTRAINT [FK_Benefits_MapM]
GO
ALTER TABLE [dbo].[BestPassage]  WITH CHECK ADD  CONSTRAINT [FK_BestPassage_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[BestPassage] CHECK CONSTRAINT [FK_BestPassage_MapM]
GO
ALTER TABLE [dbo].[GameLevels]  WITH CHECK ADD  CONSTRAINT [FK_GameLevels_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[GameLevels] CHECK CONSTRAINT [FK_GameLevels_MapM]
GO
ALTER TABLE [dbo].[MovableObject]  WITH CHECK ADD  CONSTRAINT [FK_MovableObject_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[MovableObject] CHECK CONSTRAINT [FK_MovableObject_MapM]
GO
ALTER TABLE [dbo].[Obstacles]  WITH CHECK ADD  CONSTRAINT [FK_Obstacles_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[Obstacles] CHECK CONSTRAINT [FK_Obstacles_MapM]
GO
ALTER TABLE [dbo].[PlayerSaves]  WITH CHECK ADD  CONSTRAINT [FK_PlayerSaves_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[PlayerSaves] CHECK CONSTRAINT [FK_PlayerSaves_MapM]
GO
ALTER TABLE [dbo].[Traps]  WITH CHECK ADD  CONSTRAINT [FK_Traps_MapM] FOREIGN KEY([MapID])
REFERENCES [dbo].[MapM] ([MapID])
GO
ALTER TABLE [dbo].[Traps] CHECK CONSTRAINT [FK_Traps_MapM]
GO
USE [master]
GO
ALTER DATABASE [OrlovMyGame] SET  READ_WRITE 
GO
