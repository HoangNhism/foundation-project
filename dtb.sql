USE [master]
GO
/****** Object:  Database [Podcast]    Script Date: 14/05/2024 9:27:27 PM ******/
CREATE DATABASE [Podcast]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Podcast', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Podcast.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Podcast_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Podcast_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Podcast] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Podcast].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Podcast] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Podcast] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Podcast] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Podcast] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Podcast] SET ARITHABORT OFF 
GO
ALTER DATABASE [Podcast] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Podcast] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Podcast] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Podcast] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Podcast] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Podcast] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Podcast] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Podcast] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Podcast] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Podcast] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Podcast] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Podcast] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Podcast] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Podcast] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Podcast] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Podcast] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Podcast] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Podcast] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Podcast] SET  MULTI_USER 
GO
ALTER DATABASE [Podcast] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Podcast] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Podcast] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Podcast] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Podcast] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Podcast] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Podcast] SET QUERY_STORE = OFF
GO
USE [Podcast]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Dob] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[CommentDate] [datetime2](7) NOT NULL,
	[EpisodeID] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episodes]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episodes](
	[EpisodeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AudioUrl] [nvarchar](max) NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Duraion] [int] NOT NULL,
	[EpImage] [nvarchar](max) NOT NULL,
	[PodcastID] [int] NOT NULL,
	[PlaylistID] [int] NULL,
 CONSTRAINT [PK_Episodes] PRIMARY KEY CLUSTERED 
(
	[EpisodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exclusives]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exclusives](
	[ExclusiveID] [int] IDENTITY(1,1) NOT NULL,
	[ExclusiveName] [nvarchar](max) NOT NULL,
	[ExclusiveDescription] [nvarchar](max) NOT NULL,
	[ExclusivePrice] [decimal](18, 2) NOT NULL,
	[ValidityPeriod] [int] NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Exclusives] PRIMARY KEY CLUSTERED 
(
	[ExclusiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistDetails]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistDetails](
	[PlayListDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistID] [int] NOT NULL,
	[EpisodeId] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistDetails] PRIMARY KEY CLUSTERED 
(
	[PlayListDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[PlaylistID] [int] IDENTITY(1,1) NOT NULL,
	[PlaylistName] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Podcasts]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Podcasts](
	[PodcastID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[EpNum] [int] NOT NULL,
	[UserID] [nvarchar](max) NULL,
	[TopicID] [int] NOT NULL,
 CONSTRAINT [PK_Podcasts] PRIMARY KEY CLUSTERED 
(
	[PodcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[RatingValue] [real] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[EpisodeID] [int] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[SubscriptionID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionDate] [datetime2](7) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[PodcastID] [int] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 14/05/2024 9:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240514114640_initial', N'8.0.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'54df78e8-c9a4-476d-a725-986e8349a5ff', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Facebook', N'3258736644420180', N'Facebook', N'be80c718-4685-415b-a3bf-039c85f6eb7c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'be80c718-4685-415b-a3bf-039c85f6eb7c', N'Le Duy', CAST(N'2003-01-20T00:00:00.0000000' AS DateTime2), N'duyle8103tv@gmail.com', N'DUYLE8103TV@GMAIL.COM', N'duyle8103tv@gmail.com', N'DUYLE8103TV@GMAIL.COM', 0, NULL, N'4WADLUWKLCLWST43HBU3BRAMTZMSS2F2', N'9c38a23f-d83a-4461-889d-174b38e5077f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fe922a50-6e01-4e40-8316-88c4eb2ac363', N'admin', CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKVj4vgBD1K6XfAHaU+AD5d5RdHkEq9UVoeW8UQ7p4DAjA6po15wBuj947N6vhkFGg==', N'N3UWOQEQXX7JL7VHMUHM7DAHMXLXYXHT'', N''18ce90f0-2811-40d6-97c1-3f8ed4072cba', NULL, N'0', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Episodes] ON 

INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (1, N'Chữa lành là trở về với chính mình để tìm thuốc', N'Trong tập này, Have A Sip có vinh dự lớn khi được cùng thầy Minh Niệm thưởng thức tách trà và trò chuyện cùng thầy về chủ đề chữa lành những tổn thương tâm lý.', N'Video/EpisodeVid/Vietcetera/HAVE A SIP/HAS EP87.mp3', CAST(N'2022-07-29T00:00:00.0000000' AS DateTime2), 84, N'images/EpisodeImg/Vietcetera/HAVE_A_SIP/HAS_EP87.jpg', 1, NULL)
SET IDENTITY_INSERT [dbo].[Episodes] OFF
GO
SET IDENTITY_INSERT [dbo].[PlaylistDetails] ON 

INSERT [dbo].[PlaylistDetails] ([PlayListDetailID], [PlaylistID], [EpisodeId]) VALUES (1, 34, 1)
SET IDENTITY_INSERT [dbo].[PlaylistDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([PlaylistID], [PlaylistName], [UserId]) VALUES (28, N'haha', N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Playlists] ([PlaylistID], [PlaylistName], [UserId]) VALUES (34, N'chill', N'be80c718-4685-415b-a3bf-039c85f6eb7c')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
GO
SET IDENTITY_INSERT [dbo].[Podcasts] ON 

INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [UserID], [TopicID]) VALUES (1, N'HAVE A SIP
', N'“Đi cà phê không?”
“Tối nay đi uống nhé?”
Vietcetera tin rằng: gặp nhau và gọi một món đồ uống chính là tạo ra không gian để bạn và người khác kết nối. Món đồ uống khác nhau cũng đại diện cho những tính cách khác nhau.', N'images/PodcastImg/Vietcetera/HAVE_A_SIP/HAVE_A_SIP.jpg', CAST(N'2020-10-22T00:00:00.0000000' AS DateTime2), 172, N'fe922a50-6e01-4e40-8316-88c4eb2ac363', 1)
SET IDENTITY_INSERT [dbo].[Podcasts] OFF
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (1, N'Chữa lành', N'Chữa lành tâm sinh lý là một phần của lĩnh vực chăm sóc sức khỏe tinh thần, tập trung vào việc hỗ trợ và khôi phục cân bằng tinh thần và cảm xúc của cá nhân. Phương pháp này nhấn mạnh vào việc hiểu và giải quyết nguyên nhân gốc rễ của các vấn đề tâm lý, như căng thẳng, lo lắng, trầm cảm, hoặc trauma. Chữa lành tâm sinh lý có thể bao gồm các phương tiện như tâm lý học, tư vấn, terapi từ, kỹ thuật thở, yoga, thiền, và các kỹ thuật thả lỏng để giúp cá nhân phục hồi, phát triển sự cảm thụ và tự nhận thức, và xây dựng khả năng chống chọi với căng thẳng và áp lực trong cuộc sống hàng ngày.', N'Images/TopicImg/Chua_Lanh.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (2, N'Phát triển bản thân', N'Phát triển bản thân là quá trình tự làm giàu kiến thức, kỹ năng và phẩm chất để tăng cường khả năng hoàn thiện bản thân và đạt được mục tiêu cá nhân. Điều này bao gồm việc thúc đẩy sự tự nhận thức, phát triển kỹ năng giao tiếp, quản lý thời gian hiệu quả, và tạo ra một cuộc sống ý nghĩa và hạnh phúc. Phát triển bản thân là quá trình liên tục và đa chiều, không chỉ là việc học hỏi mà còn là việc áp dụng những hiểu biết đó vào thực tế để thay đổi và tiến bộ.', N'Images/TopicImg/Self_Grown.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (3, N'Tình yêu', N'Tình yêu là trạng thái cảm xúc mạnh mẽ và sâu sắc đối với một người hoặc một vật thể, thường bao gồm sự quan tâm, sự chăm sóc, và sự cam kết. Nó có thể biểu hiện qua nhiều cách khác nhau, bao gồm tình bạn, tình dục, tình cảm gia đình và tình yêu lãng mạn. Tình yêu có thể mang lại hạnh phúc, sự bền vững và cảm giác được chấp nhận và trân trọng.', N'images/TopicImg/Tinh_Yeu.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (4, N'Tiền tệ', N'Tiền tệ là nguồn cung cấp cho mọi thứ từ việc mua thức ăn hàng ngày đến thanh toán hóa đơn và tiết kiệm cho tương lai. Bạn sử dụng tiền mặt để mua sắm tại cửa hàng, hoặc thẻ tín dụng để thanh toán cho các dịch vụ trực tuyến. Mỗi lần bạn nhận lương, chi tiêu hoặc tiết kiệm, bạn đều đang tương tác với khái niệm về tiền bạc.', N'images/TopicImg/Tien_Te.jpg')
SET IDENTITY_INSERT [dbo].[Topics] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_EpisodeID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_EpisodeID] ON [dbo].[Comments]
(
	[EpisodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Episodes_PlaylistID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Episodes_PlaylistID] ON [dbo].[Episodes]
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Episodes_PodcastID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Episodes_PodcastID] ON [dbo].[Episodes]
(
	[PodcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Exclusives_UserID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Exclusives_UserID] ON [dbo].[Exclusives]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlaylistDetails_EpisodeId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_PlaylistDetails_EpisodeId] ON [dbo].[PlaylistDetails]
(
	[EpisodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PlaylistDetails_PlaylistID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_PlaylistDetails_PlaylistID] ON [dbo].[PlaylistDetails]
(
	[PlaylistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Playlists_UserId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Playlists_UserId] ON [dbo].[Playlists]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Podcasts_TopicID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Podcasts_TopicID] ON [dbo].[Podcasts]
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ratings_EpisodeID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_EpisodeID] ON [dbo].[Ratings]
(
	[EpisodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ratings_UserId]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_UserId] ON [dbo].[Ratings]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_PodcastID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_PodcastID] ON [dbo].[Subscriptions]
(
	[PodcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Subscriptions_UserID]    Script Date: 14/05/2024 9:27:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_UserID] ON [dbo].[Subscriptions]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Episodes_EpisodeID] FOREIGN KEY([EpisodeID])
REFERENCES [dbo].[Episodes] ([EpisodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Episodes_EpisodeID]
GO
ALTER TABLE [dbo].[Episodes]  WITH CHECK ADD  CONSTRAINT [FK_Episodes_Playlists_PlaylistID] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlists] ([PlaylistID])
GO
ALTER TABLE [dbo].[Episodes] CHECK CONSTRAINT [FK_Episodes_Playlists_PlaylistID]
GO
ALTER TABLE [dbo].[Episodes]  WITH CHECK ADD  CONSTRAINT [FK_Episodes_Podcasts_PodcastID] FOREIGN KEY([PodcastID])
REFERENCES [dbo].[Podcasts] ([PodcastID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Episodes] CHECK CONSTRAINT [FK_Episodes_Podcasts_PodcastID]
GO
ALTER TABLE [dbo].[Exclusives]  WITH CHECK ADD  CONSTRAINT [FK_Exclusives_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exclusives] CHECK CONSTRAINT [FK_Exclusives_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[PlaylistDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistDetails_Episodes_EpisodeId] FOREIGN KEY([EpisodeId])
REFERENCES [dbo].[Episodes] ([EpisodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistDetails] CHECK CONSTRAINT [FK_PlaylistDetails_Episodes_EpisodeId]
GO
ALTER TABLE [dbo].[PlaylistDetails]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistDetails_Playlists_PlaylistID] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlists] ([PlaylistID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistDetails] CHECK CONSTRAINT [FK_PlaylistDetails_Playlists_PlaylistID]
GO
ALTER TABLE [dbo].[Playlists]  WITH CHECK ADD  CONSTRAINT [FK_Playlists_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Playlists] CHECK CONSTRAINT [FK_Playlists_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Podcasts]  WITH CHECK ADD  CONSTRAINT [FK_Podcasts_Topics_TopicID] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Podcasts] CHECK CONSTRAINT [FK_Podcasts_Topics_TopicID]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Episodes_EpisodeID] FOREIGN KEY([EpisodeID])
REFERENCES [dbo].[Episodes] ([EpisodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Episodes_EpisodeID]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Subscriptions_Podcasts_PodcastID] FOREIGN KEY([PodcastID])
REFERENCES [dbo].[Podcasts] ([PodcastID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Podcasts_PodcastID]
GO
USE [master]
GO
ALTER DATABASE [Podcast] SET  READ_WRITE 
GO
