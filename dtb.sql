create database Podcast 
go
USE [Podcast]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Episodes]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exclusives]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Podcasts]    Script Date: 6/9/2024 9:42:00 PM ******/
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
	[TopicID] [int] NOT NULL,
	[UserID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Podcasts] PRIMARY KEY CLUSTERED 
(
	[PodcastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 6/9/2024 9:42:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240510051220_Initial', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240512043805_UpdateDTB', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240512044117_UpdateUserID', N'8.0.4')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'54df78e8-c9a4-476d-a725-986e8349a5ff', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1bef4de1-f0d8-4a16-9af8-956d59299e06', N'54df78e8-c9a4-476d-a725-986e8349a5ff')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fe922a50-6e01-4e40-8316-88c4eb2ac363', N'54df78e8-c9a4-476d-a725-986e8349a5ff')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1bef4de1-f0d8-4a16-9af8-956d59299e06', N'TMH', CAST(N'2024-05-08 00:00:00.0000000' AS DateTime2), N'1234@gmail.com', N'1234@GMAIL.COM', N'1234@gmail.com', N'1234@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHnXLnG5nYTp6JkPumh7L6U6UKgLJv99VxDHQ160xHae3Umi6Co2UYsvJlfiUZVFqQ==', N'PUZDHTUMMJPBQ5FRAU5QBQOGVZBXXU5Y', N'5e1de7f2-2b42-45d6-9dd5-ce670c79ca7b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7459e4e1-1093-4639-acdc-1a8adfc876d5', N'123', CAST(N'2024-05-01 00:00:00.0000000' AS DateTime2), N'123@gmail.com', N'123@GMAIL.COM', N'123@gmail.com', N'123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECP2VY55ZUO5GR+Phrn0vzIcSON63mS2DdQHkuodu6G8Utp8CWuUB8B33zkBhy/y2w==', N'2RJIRVE47TRHGCRMRCOS32MWY4F5NOBO', N'41dba263-2d7d-423e-9315-630eea1837a7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fe922a50-6e01-4e40-8316-88c4eb2ac363', N'admin', CAST(N'2024-05-01 00:00:00.0000000' AS DateTime2), N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKVj4vgBD1K6XfAHaU+AD5d5RdHkEq9UVoeW8UQ7p4DAjA6po15wBuj947N6vhkFGg==', N'N3UWOQEQXX7JL7VHMUHM7DAHMXLXYXHT', N'af730959-b377-45ac-80e7-2fad12db6fc7', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Episodes] ON 

INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (51, N'Khi Kaity Nguyễn, Hoàng Dũng, Phương Nam đối mặt với vấn nạn body shaming | BAR STORIES TẬP 40', N'Khi nghĩ đến GenZ chúng ta thường nghĩ đến sự bứt phá, vượt qua những giới hạn, liều lĩnh, dám thử thách bản thân để tạo nên sự khác biệt. GenZ cũng là thế hệ được sinh ra và lớn lên cùng sự phát triển của công nghệ và mạng xã hội. Vì vậy team Dustin On The Go quyết tâm “bắt cóc“ bằng được những vị khách mời là đại diện của thế hệ Z đến từ các lĩnh vực giải trí khác nhau: diễn viên điện ảnh Kaity Nguyễn, ca nhạc sĩ Hoàng Dũng, và diễn viên hài độc thoại Phương Nam đến từ nhóm Saigon Tếu.   Hoàng Dũng 27 tuổi – sở hữu 1 album đầu tay mang tên ‘25’, 2 concert cho riêng mình ở Hà Nội và TP. Hồ Chí Minh, đạt giải thưởng Gương mặt mới xuất sắc tại giải thưởng Làn Sóng Xanh.   Kaity Nguyễn 23 tuổi – cô gái bạc tỷ của showbiz Việt, bỏ túi các vai diễn quan trọng trong ba bộ phim đạt doanh thu “khủng” của phòng vé Việt: Em chưa 18 (2017) -  Hồn papa da con gái (2018), Tiệc trăng máu (2020), và mới nhất là Gái già lắm chiêu 5.   Phương Nam là một trong những gương mặt được dân mạng ưu ái nhất, là 1 trong 4 founder của nhóm hài độc thoại Saigon Tếu, ngoài ra Phương Nam là một trong những thành viên sở hữu khá nhiều video viral trên mạng xã hội.   Team Dustin On The Go hy vọng buổi trò chuyện cùng những đại diện của thế hệ GenZ này sẽ mang đến một nguồn năng lượng tích cực cho khán giả để chuẩn bị chào đón một năm mới tràn đầy hứng khởi.', N'BSTORIES_EP1.mp3', CAST(N'2024-06-09 17:11:57.4110089' AS DateTime2), 0, N'BSTORIES_EP1.jpg', 14, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (53, N'Tóc Tiên: Việt Nam đang đón bình minh của việc nghe nhạc bản quyền | BAR STORIES TẬP 39', N'Giáng sinh luôn là một sự kiện đặc biệt mà Bar Stories thường giới thiệu những nhân vật đặc biệt, và những cuộc trò chuyện vui nổ trời trong không khí lễ hội tràn về các quán bar. Năm nay tụi mình rất vui được chào đón ca sĩ Tóc Tiên đến với Bar Stories để kể về quá trình hoạt động nghệ thuật chông gai, những cú rẽ hướng bất ngờ định mệnh, và qua đó thấy được cá tính nghệ sĩ ngày càng rõ nét của Tiên.  Tóc Tiên bước vào quầy bar, bạn đi đến đâu, năng lượng tích cực và sự tươi trẻ toát ra ở đó. Tiếng cười đã tai của Tiên chính là chìa khoá để bất kì ai đối diện cũng cảm thấy được chào đón và yêu đời, yêu Tiên. Vừa cho ra mắt EP với 4 bài hát từ các nhạc sĩ Bùi Công Nam, Kai Đinh, Hứa Kim Tuyền và Trang mang tên Yêu Rồi Yêu Rồi Yêu nhân dịp cuối năm, Tiên đã khẳng định sức thu hút của mình đối với công chúng không chỉ qua những bài hát rất “hợp thời tiết” cuối năm, mà còn qua cách làm mới hình ảnh, cách bạn tự tìm kiếm ý tưởng sản xuất, thu âm tại nhà, cách kể chuyện bằng âm nhạc với những nhân vật quen thuộc với bất kể ai đã và đang yêu: “người mới” và “người cũ”.  Ngoài ra, điểm nổi bật nhất ở Tóc Tiên đó chính là sự chuyên nghiệp, luôn đúng giờ, ghét trễ deadline. Hôm đi quay Tiên còn đến sớm hơn giờ hẹn nửa tiếng khiến ekip ai cũng bất ngờ nể phục. Có lẽ vì vậy mà Tiên dễ dàng kể ra ngay 3 cái tên nghệ sĩ trẻ mà bạn đã làm việc chung và chuyên trễ deadline nhất. Còn rất nhiều điều thú vị bên trong người nghệ sĩ này mà team mình hy vọng mọi người sẽ thưởng thức trong Bar Stories Tập 39 này nhé.', N'BSTORIES_EP2.mp3', CAST(N'2024-06-09 17:13:02.6810484' AS DateTime2), 0, N'BSTORIES_EP2.jpg', 14, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (54, N'Sâu Sắc EP.01: Người trẻ không sợ “cái chết”!', N'Hôm nay chúng ta sẽ bàn luận về vấn đề mà bất cứ ai trong chúng ta cũng một lần nghĩ đến trong đời', N'SC_SS_EP1.mp3', CAST(N'2024-06-09 17:14:31.7251078' AS DateTime2), 0, N'SC_SS_EP1.jpg', 10, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (55, N'Sâu Sắc EP.02: Bố mẹ thành công, người trẻ áp lực hay tận hưởng!', N'Việc chúng ta không ngừng phát triển trong xã hội ngày nay là việc hiển nhiên, và đối với giới trẻ thì việc trở nên giỏi khi sinh ra trong một gia đình khá giả là chủ đề mà hôm nay chúng ta sẽ bàn tới', N'SC_SS_EP2.mp3', CAST(N'2024-06-09 17:16:19.2128854' AS DateTime2), 0, N'SC_SS_EP2.jpg', 10, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (56, N'Podcast Hỏi Xoáy Đáp Sâu (EP. 1): Bạn có thể chấp nhận quá khứ của người yêu??', N'Tình cảm là một trong những chủ đề khá là nổi bật và được các bạn trẻ ngày nay vô cùng quan tâm đi kèm với đó là nhiều khía cạnh trong tình cảm vậy chúng ta hãy cùng nhau bàn luận đến 1 trong những chủ đề đó ngày hôm nay đó là bạn có thể chấp nhận quá khứ của người yêu??', N'SC_HXDS_EP1.mp3', CAST(N'2024-06-09 17:18:45.9755176' AS DateTime2), 0, N'SC_HXDS_EP1.jpg', 11, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (57, N'#Podcast Hỏi Xoáy Đáp Sâu (EP. 2): Có nên share bill khi hẹn hò!?!', N'Tình cảm là một trong những chủ đề khá là nổi bật và được các bạn trẻ ngày nay vô cùng quan tâm đi kèm với đó là nhiều khía cạnh trong tình cảm vậy chúng ta hãy cùng nhau bàn luận đến 1 trong những chủ đề đó ngày hôm nay đó là Có nên share bill khi hẹn hò!?!', N'SC_HXDS_EP2.mp3', CAST(N'2024-06-09 17:19:15.5564051' AS DateTime2), 0, N'SC_HXDS_EP2.jpg', 11, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (58, N'Chữa Có Lành Không: Những tổn thương lần đầu kể! | #Podcast Hỏi Xoáy Đáp Sâu (Ep. 3)', N'Tình cảm là một trong những chủ đề khá là nổi bật và được các bạn trẻ ngày nay vô cùng quan tâm đi kèm với đó là nhiều khía cạnh trong tình cảm vậy chúng ta hãy cùng nhau bàn luận đến 1 trong những chủ đề đó ngày hôm nay đó là những tổn thương lần đầu kể!', N'SC_HXDS_EP3.mp3', CAST(N'2024-06-09 17:20:10.4845940' AS DateTime2), 0, N'SC_HXDS_EP3.jpg', 11, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (59, N'Ricky Star: Âm nhạc thật sự cứu rỗi mình | Your Turn EP1 - a Rap/HipHop podcast', N'Your Turn Podcast là cuộc trò chuyện với 63 người, tất cả đều là rapper. Mọi người có thể donate để ủng hộ tụi mình sản xuất thêm các tập mới thông qua phần Super Thanks trên Youtube nha.  Ricky Star: Âm nhạc thật sự cứu rỗi mình | Your Turn Podcast - Rap/HipHop talks', N'YTURN_EP1.mp3', CAST(N'2024-06-09 17:21:26.6988615' AS DateTime2), 0, N'YTURN_EP1.jpg', 12, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (60, N'Tez: Thành thật với chính bản thân mình nhiều hơn, lí do trở lại Rap Việt mùa 3 | Your Turn EP2', N'Your Turn Podcast là cuộc trò chuyện với 63 người, tất cả đều là rapper.  Tez: Thành thật với chính bản thân mình nhiều hơn, lí do trở lại Rap Việt mùa 3 | Your Turn Podcast - a Rap/HipHop podcast', N'YTURN_EP2.mp3', CAST(N'2024-06-09 17:21:52.1391241' AS DateTime2), 0, N'YTURN_EP2.jpg', 12, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (61, N'Người lớn cô đơn | Giang Ơi Radio', N'Giang Ơi Radio là kênh podcast, nơi mình tản mạn về chuyện làm người lớn. Có thể chỉ là những câu chuyện không đầu không cuối, có thể là một chút suy nghĩ của mình - một người rất bình thường đang sống một cuộc sống rất bình thường trong số rất nhiều người bình thường ngoài kia. Hy vọng nó sẽ đến được với một ai đó, để chúng mình có thể chia sẻ với nhau.', N'GORADIO_EP1.mp3', CAST(N'2024-06-09 17:23:05.9958643' AS DateTime2), 0, N'GORADIO_EP1.jpg', 13, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (62, N'Người lớn ra ở riêng | Giang Ơi Radio', N'Giang Ơi Radio là kênh podcast, nơi mình tản mạn về chuyện làm người lớn. Có thể chỉ là những câu chuyện không đầu không cuối, có thể là một chút suy nghĩ của mình - một người rất bình thường đang sống một cuộc sống rất bình thường trong số rất nhiều người bình thường ngoài kia. Hy vọng nó sẽ đến được với một ai đó, để chúng mình có thể chia sẻ với nhau.', N'GORADIO_EP2.mp3', CAST(N'2024-06-09 17:23:33.1160148' AS DateTime2), 0, N'GORADIO_EP2.jpg', 13, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (63, N'BVersion#25: Không thay đổi những tư duy này, thì nỗ lực đến mấy cũng nghèo | Sách Cha giàu nghèo', N'Tuần này Better Version sẽ mang đến cho các bạn một bài chia sẻ với nội dung "Không thay đổi những tư duy này, thì nỗ lực mấy cũng vẫn nghèo", thông qua cuốn sách nổi tiếng Rich dad Poor dad (Dạy con làm giàu). Từ những câu chuyện kể về cuộc đời của hai người cha, Kiyosaki sẽ cho chúng ta thấy những quy luật bí ẩn đằng sau đồng tiền là gì. Đồng thời, sẽ giúp bạn thấy những nguyên nhân sâu xa của khoảng cách giàu nghèo.', N'BVERSION_EP25.mp3', CAST(N'2024-06-09 21:08:21.5724569' AS DateTime2), 0, N'BVERSION_EP25.jpg', 6, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (64, N'BVersion#45: Tự do là cho mình dấn thân về phía trước', N'Sheryl Sandberg (Giám đốc điều hành Facebook) đã từng nói: "Đừng thu mình lại, hãy dũng cảm tiến về phía trước."  Đây cũng chính là thông điệp mà Better Version muốn nhắn nhủ đến tất cả phụ nữ; và cũng là món quà đặc biệt nhân dịp ngày 8/3 hôm nay. Nội dung chia sẻ cuốn sách hôm nay sẽ giúp bạn chỉ ra: những gồng xích trói buộc cuộc đời, những nội sợ hãi sâu thẳm của người phụ nữ, những tư duy cố hữu đã hẳn sâu khiến xã hội coi đó là lẽ thường tình. Từ đó, giúp bạn nhận ra, dám tiến lên, bứt phá và tạo nên thành công trong cuộc sống lẫn công việc.', N'BVERSION_EP45.mp3', CAST(N'2024-06-09 21:08:58.1384336' AS DateTime2), 0, N'BVERSION_EP45.jpg', 6, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (65, N'BVersion#46: Ba thứ cần phải nhìn thấy trong một đời này', N'"Siddhartha" - một tác phẩm chứa đựng tất cả hoang mang cũng như kiếm tìm giải đáp, tất cả sự "nhìn thấy" cũng như là giác ngộ. Nếu ai hiểu hết được cuốn sách này, thì cũng sẽ tìm ra được câu trả lời cho cuộc đời mình. Rốt cuộc nên phải sống như thế nào? Làm thế nào để có thể sống được viên mãn, trọn vẹn? Làm thế nào để thức tỉnh? Qua cuốn sách này, bạn có thể tìm thấy một lời giải đáp. Mời các bạn cùng lắng nghe một chia sẻ mang tên "Ba thứ cần phải nhìn thấy trong đời này" qua cuốn tiểu thuyết bất hủ "Siddhartha" của văn hào xuất chúng Hermann Hesse.', N'BVERSION_EP46.mp3', CAST(N'2024-06-09 21:09:33.6339228' AS DateTime2), 0, N'BVERSION_EP46.jpg', 6, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (66, N'BVersion#62: Cuốn theo chiều gió rốt cuộc để cuốn về đâu', N'Nhà văn Dương Giáng nói rằng: "Đọc Cuốn theo chiều gió, giống như bước vào một khu rừng nguyên sơ. Càng đi sâu vào, ta càng cảm nhận được vẻ đẹp của nó." Mỗi lần đọc cuốn sách này, chắc hẳn bạn sẽ có những cảm nhận khác nhau. Bởi vì nó sẽ giúp bạn không chỉ học được những nhận thức về tình yêu, mà còn lắng đọng lại những suy nghĩ sâu sắc về bản chất con người và chính cuộc sống này, khiến bạn có thêm nhận thức trưởng thành hơn. Mời các bạn lắng nghe nội dung chia sẻ hôm nay', N'BVERSION_EP62.mp3', CAST(N'2024-06-09 21:12:53.8576495' AS DateTime2), 0, N'BVERSION_EP62.jpg', 6, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (67, N'BVersion#67: Đừng để "cơn nghiện mềm" phá huỷ chính bạn', N'Tuần này mình xin chia sẻ tới các bạn nội dung tóm tắt và diễn giải những gì cốt lõi nhất về cuốn sách The Soft Addiction Solution (Hiện tên đầy đủ: The Soft Addiction Solution: Break Free of the Seemingly Harmless Habits That Keep You from the Life You Want), tạm dịch là “Nghiện mềm” của Tiến sĩ Judith Wright, một chuyên gia, nhà tư vấn phong cách sống và hôn nhân nổi tiếng người Mỹ. Mời các bạn cùng lắng nghe!', N'BVERSION_EP67.mp3', CAST(N'2024-06-09 21:13:35.2608430' AS DateTime2), 0, N'BVERSION_EP67.jpg', 6, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (68, N'Điều Gì Làm Cuộc Sống Giàu...Ý Nghĩa Và Trọn Vẹn Hơn  | KIENPHAM w/ SHINPHAMM | LUNCH BREAK S2 Ep6', N'Hi, trưa nay mọi người ăn gì đấy? Trong giờ nghỉ trưa mọi người thường làm gì? Tại sao không ngồi xuống đây tận hưởng bữa trưa và trò chuyện cùng bọn mình. Mỗi bữa trưa SHINPHAMM & KIENPHAMM ( @SHINPHAMM ) chia sẻ những món ăn mới, những câu chuyện thú vị về mọi chủ đề trong cuộc sống.', N'LBREAK_S2_EP6.mp3', CAST(N'2024-06-09 21:16:35.3731825' AS DateTime2), 0, N'LBREAK_SS1_EP1.jpg', 8, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (69, N'PODCAST “THE BREAKER” | MỘT CHẤM SÀNH ĐIỆU CÙNG CÂU CHUYỆN VỀ BÊN MẮT BỊ HỎNG CỦA ĐẶNG THÀNH KIÊN', N'MỘT CHẤM SÀNH ĐIỆU CÙNG CÂU CHUYỆN VỀ BÊN MẮT BỊ HỎNG CỦA ĐẶNG THÀNH KIÊN, THỂ THAO LÀ NƠI ĐỂ CHỨNG TA VƯỢT LÊN CHÍNH MÌNH', N'TBREAKER_EP3.mp3', CAST(N'2024-06-09 21:17:35.8333206' AS DateTime2), 0, N'TBREAKER_EP3.jpg', 5, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (70, N'Nguyễn Hữu Trí, CEO Học viện kỹ năng AYB: Chúng tôi nói gì khi nói về tiền-S2#10', N'Trong tập The Money Date này, chúng ta sẽ cùng đón chào anh Nguyễn Hữu Trí - CEO của Học viện Kĩ năng AYP (Awake Your Power). Trong suốt nhiều năm qua, anh Trí đã luôn là người truyền động lực thúc đẩy cho nhiều thế hệ trẻ tại Việt Nam. Điều này thể hiện qua việc anh không ngừng phát triển bản thân, theo đuổi đam mê cũng như sẵn sàng chia sẻ kinh nghiệm của mình cho mọi người. Những chủ đề anh hướng tới đa dạng từ Phát triển bản thân, Tình yêu, Tài chính.', N'TMDATE_SS2_EP10.mp3', CAST(N'2024-06-09 21:18:17.0834534' AS DateTime2), 0, N'TMD_SS2_EP10.jpg', 3, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (71, N'BTV Ngọc Trinh: Làm nội dung về tiến có giỏi về tiền?-S2#14', N'Mỗi người sẽ có một định nghĩa khác nhau về tự do tài chính. Với BTV Dương Ngọc Trinh, tự do tài chính là một trạng thái nhất thời, và để đạt được hay duy trì được cần đến một sự kỷ luật mạnh mẽ. Làm thế nào để xây dựng kỷ luật cho bản thân? Liệu tiền có phải mục đích cuối cùng của tự do tài chính hay không? Định nghĩa “tự do” của những người giàu thì có gì khác? Hãy cùng khám phá trong số lần này của The Money Date nhé!', N'TMDATE_SS2_EP14.mp3', CAST(N'2024-06-09 21:18:47.0819677' AS DateTime2), 0, N'TMD_SS2_EP14.jpg', 3, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (72, N'Hảo Trần, CEO Vietcetera: Tự bỏ tiền túi "nuôi" Vietcetera - S2#19', N'Trong tập tuần này của The Money Date, chúng ta sẽ bắt đầu cuộc trò chuyện với Hảo Trần, người không chỉ là sếp, đồng nghiệp mà còn là người bạn thân thiết của host An Trương. Hảo Trần đã trải qua những thử thách lớn khi bị lay-off tại một công ty công nghệ ở Mỹ, và quyết định quay trở về Việt Nam. Từ đó đến nay đã hơn 8 năm, anh hiện không chỉ đảm nhận vai trò CEO của Vietcetera mà còn chủ động kinh doanh ở nhiều lĩnh vực khác. Trong tập này, chúng ta sẽ khám phá câu chuyện tài chính cá nhân của Hảo Trần và cùng tìm hiểu vị trí CEO của Vietcetera đang được trả lương thế nào? Chắc chắn rằng bạn sẽ không muốn bỏ lỡ tập này của The Money Date!', N'TMDATE_SS2_EP19.mp3', CAST(N'2024-06-09 21:19:08.8066429' AS DateTime2), 0, N'TMD_SS2_EP19.jpg', 3, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (73, N'Duy Luân Dễ Thương, Content Creator: Còn công nghệ là còn công việc - S2#21', N'Nguyễn Ngọc Duy Luân, hay còn được biết đến với tên Duy Luân Dễ Thương - một Content Creator nổi tiếng với hơn 900 nghìn followers trên TikTok và 300 nghìn người đăng ký trên kênh Youtube. Những video review công nghệ của anh không chỉ chứa đựng thông tin bổ ích mà còn thể hiện tính cập nhật cao. Duy Luân đã từng khiến khán giả trầm trồ vì những lần bỏ ra số tiền khủng để sở hữu những thiết bị công nghệ hiện đại. Điều đó dẫn đến một câu hỏi: Người giàu mới có thể review công nghệ hay làm review công nghệ rất giàu? Trong tập này, chúng ta sẽ cùng host An Trương khám phá câu chuyện về tiền bạc, đầu tư và nghề nghiệp của Duy Luân. Đừng bỏ lỡ những chia sẻ và kinh nghiệm quý báu mà Duy Luân bật mí trong The Money Date!', N'TMDATE_SS2_EP21.mp3', CAST(N'2024-06-09 21:19:30.3027757' AS DateTime2), 0, N'TMD_SS2_EP21.jpg', 3, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (74, N'Niklas Wagnner, General Manager, New World SaiGon Hotel: Việt Nam là nơi có chi phí sống rẻ nhất? - S2#26', N'Trong tập The Money Date này, chúng ta sẽ có cơ hội khám phá cuộc trò chuyện với Niklas Wagner - General Manager của New World Saigon Hotel. Với hơn 20 năm kinh nghiệm quản lý cấp cao trong ngành khách sạn quốc tế, Niklas Wagner đã mang đến sự đổi mới và tiến bộ cho New World Saigon Hotel, giúp khách sạn từng bước trở thành biểu tượng văn hóa của Sài Gòn. Niklas sẽ chia sẻ những góc nhìn và kinh nghiệm đặc biệt của mình về việc sống và làm việc ở đất nước Việt Nam. Bên cạnh đó, chúng ta cũng sẽ được học hỏi mẹo đặt phòng khách sạn tiết kiệm từ một chuyên gia trong ngành. Đừng bỏ lỡ cơ hội để khám phá những thông tin hữu ích trên The Money Date.', N'TMDATE_SS2_EP26.mp3', CAST(N'2024-06-09 21:19:57.3581075' AS DateTime2), 0, N'TMD_SS2_EP26.jpg', 3, NULL)
INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (75, N'Chữa lành là trở về với chính mình để tìm thuốc', N'Trong tập này, Have A Sip có vinh dự lớn khi được cùng thầy Minh Niệm thưởng thức tách trà và trò chuyện cùng thầy về chủ đề chữa lành những tổn thương tâm lý.', N'HASIP_EP87.mp3', CAST(N'2024-06-09 21:21:45.9423565' AS DateTime2), 0, N'HASIP_EP87.jpg', 4, NULL)
SET IDENTITY_INSERT [dbo].[Episodes] OFF
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([PlaylistID], [PlaylistName], [UserId]) VALUES (1, N'aaaaa', N'1bef4de1-f0d8-4a16-9af8-956d59299e06')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
SET IDENTITY_INSERT [dbo].[Podcasts] ON 

INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (3, N'The Money Date', N'The Money Date là buổi hẹn hò thân mật về một chủ đề vốn dĩ rất khô khan và khó nuốt — tài chính cá nhân.  Thế nhưng, sự căng não trong cuộc trò chuyện này sẽ không đến từ số má, mà đến từ những trò chơi điện tử được host và khách mời chơi trong quá trình họ chia sẻ cách kiếm tiền, tiêu tiền, và làm thế nào để tiền đẻ ra tiền.', N'TMD.jpg', CAST(N'2024-05-14 15:41:31.2112274' AS DateTime2), 0, 5, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (4, N'Have A Sip', N'“Đi cà phê không?”
“Tối nay đi uống nhé?”

Vietcetera tin rằng: gặp nhau và gọi một món đồ uống chính là tạo ra không gian để bạn và người khác kết nối. Món đồ uống khác nhau cũng đại diện cho những tính cách khác nhau.
 
Vì thế, cứ mỗi hai tuần, chúng tôi sẽ mời một vị khách tới studio cùng uống và trò chuyện về cuộc sống, về những gì xảy ra gần đây với họ, như những người bạn cũ. Bạn sẽ gọi món gì?
Spotify: https://bit.ly/Have_A_Sip', N'HASIP.jpg', CAST(N'2020-10-22 16:04:38.9652014' AS DateTime2), 175, 3, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (5, N'The Breaker', N'The Breaker sẽ là nơi chia sẻ những câu chuyện chưa từng được kể, cũng như những trải nghiệm đáng nhớ xuyên suốt sự nghiệp của những con người đã khai phá mở đường cho nền Pool nước nhà. Những câu chuyện rất đời, rất thật sẽ được chính các cơ thủ “nói nhỏ” qua 8 số Podcast của chương trình. Qua chương trình, TD Billiards Club và Vietnam Billiards Promotion cũng như các cơ thủ mong muốn truyền ngọn lửa đam mê từ thế hệ đàn anh cho lớp trẻ, từ đó có thể học hỏi và cảm nhận được tinh thần thể thao và sự kiên trì, nỗ lực của các VĐV Pool Billiards chuyên nghiệp!!!
', N'TBREAKER.jpg', CAST(N'2024-03-01 17:08:38.9544274' AS DateTime2), 8, 6, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (6, N'Better Version', N'Kênh chia sẻ kiến thức, phát triển toàn diện bản thân qua các cuốn sách hay
', N'BVERSION.jpg', CAST(N'2021-08-18 17:08:09.3659461' AS DateTime2), 67, 7, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (8, N'Lunch Break', N'Hi, trưa nay mọi người ăn gì đấy? Trong giờ nghỉ trưa mọi người thường làm gì? Tại sao không ngồi xuống đây tận hưởng bữa trưa và trò chuyện cùng bọn mình. Mỗi bữa trưa SHINPHAMM & KIENPHAMM ( @SHINPHAMM ) chia sẻ những món ăn mới, những câu chuyện thú vị về mọi chủ đề trong cuộc sống.', N'LBREAK.jpg', CAST(N'2023-10-03 20:15:54.6490701' AS DateTime2), 18, 3, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (10, N'Sâu Sắc', N'Nơi mà các bạn trẻ tập cách sống sâu sắc hơn cũng như là bàn luận về các vấn đề trong cuộc sống', N'SC_SS.jpg', CAST(N'2024-06-09 17:01:20.8797021' AS DateTime2), 0, 1, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (11, N'Hỏi Xoáy Đáp Sâu', N'Nơi những thành viên Schannel chia sẻ những vấn đề, góc nhìn của bản thân về cuộc sống xung quanh', N'SC_HXDS.jpg', CAST(N'2024-06-09 17:02:46.8189386' AS DateTime2), 0, 3, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (12, N'Your Turn - a Rap/HipHop podcast', N'Your Turn Podcast là cuộc trò chuyện với 63 người, tất cả đều là rapper.', N'YTURN.jpg', CAST(N'2024-06-09 17:03:31.5548088' AS DateTime2), 0, 9, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (13, N'Giang Ơi Radio', N'Giang Ơi Radio là kênh podcast của mình, nay được góp mặt trên kênh Giang Ơi nhờ tính năng Podcast của YouTube. Bạn có thể vừa nghe vừa nhìn mình tại đây hoặc chọn nghe Giang Ơi Radio trên các nền tảng SoundCloud, Spotify và Apple Podcasts. Mong bạn sẽ thích!', N'GORADIO.jpg', CAST(N'2024-06-09 17:04:24.5213289' AS DateTime2), 0, 1, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (14, N'BAR STORIES 🍹[Full Episodes]', N'Playlist sưu tập các clip full của talk show Bar Stories - dành cho những khán giả trung thành luôn dõi theo từng giây phút của chương trình nhé! Nhớ chia sẻ nếu bạn thấy thích và đừng quên để lại góp ý cho Dustin On The Go trong bình luận nhé!', N'BSTORIES_EP1.jpg', CAST(N'2024-06-09 17:05:27.3591340' AS DateTime2), 0, 9, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
SET IDENTITY_INSERT [dbo].[Podcasts] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingID], [RatingValue], [UserId], [EpisodeID]) VALUES (2, 5, N'fe922a50-6e01-4e40-8316-88c4eb2ac363', 73)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (1, N'Chữa lành
', N'Chữa lành tâm sinh lý là một phần của lĩnh vực chăm sóc sức khỏe tinh thần, tập trung vào việc hỗ trợ và khôi phục cân bằng tinh thần và cảm xúc của cá nhân. Phương pháp này nhấn mạnh vào việc hiểu và giải quyết nguyên nhân gốc rễ của các vấn đề tâm lý, như căng thẳng, lo lắng, trầm cảm, hoặc trauma. Chữa lành tâm sinh lý có thể bao gồm các phương tiện như tâm lý học, tư vấn, terapi từ, kỹ thuật thở, yoga, thiền, và các kỹ thuật thả lỏng để giúp cá nhân phục hồi, phát triển sự cảm thụ và tự nhận thức, và xây dựng khả năng chống chọi với căng thẳng và áp lực trong cuộc sống hàng ngày.
', N'Chua_Lanh.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (3, N'Phát triển bản thân', N'Phát triển bản thân là quá trình tự làm giàu kiến thức, kỹ năng và phẩm chất để tăng cường khả năng hoàn thiện bản thân và đạt được mục tiêu cá nhân. Điều này bao gồm việc thúc đẩy sự tự nhận thức, phát triển kỹ năng giao tiếp, quản lý thời gian hiệu quả, và tạo ra một cuộc sống ý nghĩa và hạnh phúc. Phát triển bản thân là quá trình liên tục và đa chiều, không chỉ là việc học hỏi mà còn là việc áp dụng những hiểu biết đó vào thực tế để thay đổi và tiến bộ.', N'Self_Grown.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (4, N'Tình yêu', N'Tình yêu là trạng thái cảm xúc mạnh mẽ và sâu sắc đối với một người hoặc một vật thể, thường bao gồm sự quan tâm, sự chăm sóc, và sự cam kết. Nó có thể biểu hiện qua nhiều cách khác nhau, bao gồm tình bạn, tình dục, tình cảm gia đình và tình yêu lãng mạn. Tình yêu có thể mang lại hạnh phúc, sự bền vững và cảm giác được chấp nhận và trân trọng.', N'Tinh_Yeu.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (5, N'Tiền tệ', N'Tiền tệ là nguồn cung cấp cho mọi thứ từ việc mua thức ăn hàng ngày đến thanh toán hóa đơn và tiết kiệm cho tương lai. Bạn sử dụng tiền mặt để mua sắm tại cửa hàng, hoặc thẻ tín dụng để thanh toán cho các dịch vụ trực tuyến. Mỗi lần bạn nhận lương, chi tiêu hoặc tiết kiệm, bạn đều đang tương tác với khái niệm về tiền bạc.', N'Tien_Te.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (6, N'Thể thao', N'Thể thao là một lĩnh vực hoạt động và thi đấu mang tính tổ chức, bao gồm các môn vận động và trò chơi thi đấu như bóng đá, bóng rổ, quần vợt, điền kinh, bơi lội, và nhiều môn khác. Thể thao không chỉ là phương tiện giải trí và rèn luyện sức khỏe mà còn là một phần văn hóa quan trọng, gắn kết cộng đồng và thúc đẩy tinh thần đồng đội, cạnh tranh lành mạnh. Nó mang lại niềm vui, cảm xúc mãnh liệt và khơi dậy sự đam mê trong lòng người hâm mộ trên khắp thế giới.





', N'The_Thao.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (7, N'Giáo dục', N'Giáo dục là quá trình truyền đạt và tiếp thu kiến thức, kỹ năng, giá trị và thái độ nhằm phát triển toàn diện con người. Nó diễn ra trong các môi trường chính thức như trường học, đại học và không chính thức như gia đình, cộng đồng. Giáo dục giúp nâng cao hiểu biết, tư duy phản biện, khả năng sáng tạo và chuẩn bị cho cuộc sống và nghề nghiệp. Đây là nền tảng quan trọng để phát triển cá nhân và xã hội, đóng góp vào sự tiến bộ và phát triển bền vững của mỗi quốc gia.', N'Giao_Duc.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (8, N'Phương tiện di chuyển', N'Phương tiện di chuyển là các phương tiện và hệ thống được sử dụng để vận chuyển người và hàng hóa từ nơi này đến nơi khác. Chúng bao gồm nhiều loại khác nhau như xe đạp, xe máy, ô tô, tàu hỏa, máy bay, tàu thủy và các phương tiện giao thông công cộng như xe buýt và tàu điện ngầm. Mỗi loại phương tiện có đặc điểm riêng về tốc độ, khả năng chuyên chở, tiện nghi và ảnh hưởng đến môi trường. Phương tiện di chuyển đóng vai trò quan trọng trong đời sống hàng ngày, góp phần thúc đẩy kinh tế, kết nối các khu vực và nâng cao chất lượng cuộc sống.', N'Phuong_Tien.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (9, N'Công Việc', N'Nơi chia sẻ các vấn đề quay quanh công việc', N'Work.png')
SET IDENTITY_INSERT [dbo].[Topics] OFF
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

/****** Object:  Table [dbo].[PlaylistDetails]    Script Date: 17/06/2024 9:54:21 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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