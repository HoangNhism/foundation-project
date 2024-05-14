create database Podcast
go
USE [Podcast]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Episodes]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Exclusives]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Playlists]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Podcasts]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Ratings]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 5/14/2024 4:11:55 PM ******/
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
/****** Object:  Table [dbo].[Topics]    Script Date: 5/14/2024 4:11:55 PM ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Dob], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fe922a50-6e01-4e40-8316-88c4eb2ac363', N'admin', CAST(N'2024-05-01 00:00:00.0000000' AS DateTime2), N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKVj4vgBD1K6XfAHaU+AD5d5RdHkEq9UVoeW8UQ7p4DAjA6po15wBuj947N6vhkFGg==', N'N3UWOQEQXX7JL7VHMUHM7DAHMXLXYXHT', N'18ce90f0-2811-40d6-97c1-3f8ed4072cba', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Episodes] ON 

INSERT [dbo].[Episodes] ([EpisodeId], [Title], [Description], [AudioUrl], [ReleaseDate], [Duraion], [EpImage], [PodcastID], [PlaylistID]) VALUES (1, N'Chữa lành là trở về với chính mình để tìm thuốc
', N'Trong tập này, Have A Sip có vinh dự lớn khi được cùng thầy Minh Niệm thưởng thức tách trà và trò chuyện cùng thầy về chủ đề chữa lành những tổn thương tâm lý.
', N'Video/EpisodeVid/Vietcetera/HAVE A SIP/HAS EP87.mp3
', CAST(N'2022-07-29 00:00:00.0000000' AS DateTime2), 84, N'images/EpisodeImg/Vietcetera/HAVE_A_SIP/HAS_EP87.jpg', 1, NULL)
SET IDENTITY_INSERT [dbo].[Episodes] OFF
SET IDENTITY_INSERT [dbo].[Podcasts] ON 

INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (1, N'HAVE A SIP


', N'“Đi cà phê không?”
“Tối nay đi uống nhé?”
Vietcetera tin rằng: gặp nhau và gọi một món đồ uống chính là tạo ra không gian để bạn và người khác kết nối. Món đồ uống khác nhau cũng đại diện cho những tính cách khác nhau.
', N'images/PodcastImg/Vietcetera/HAVE_A_SIP/HAVE_A_SIP.jpg', CAST(N'2020-10-22 00:00:00.0000000' AS DateTime2), 172, 1, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
INSERT [dbo].[Podcasts] ([PodcastID], [Title], [Description], [ImageUrl], [ReleaseDate], [EpNum], [TopicID], [UserID]) VALUES (3, N'The Money Date', N'The Money Date là buổi hẹn hò thân mật về một chủ đề vốn dĩ rất khô khan và khó nuốt — tài chính cá nhân.  Thế nhưng, sự căng não trong cuộc trò chuyện này sẽ không đến từ số má, mà đến từ những trò chơi điện tử được host và khách mời chơi trong quá trình họ chia sẻ cách kiếm tiền, tiêu tiền, và làm thế nào để tiền đẻ ra tiền.', N'images/PodcastImg/Vietcetera/THE_MONEY_DATE/TMD.jpg', CAST(N'2024-05-14 15:41:31.2112274' AS DateTime2), 0, 5, N'fe922a50-6e01-4e40-8316-88c4eb2ac363')
SET IDENTITY_INSERT [dbo].[Podcasts] OFF
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (1, N'Chữa lành
', N'Chữa lành tâm sinh lý là một phần của lĩnh vực chăm sóc sức khỏe tinh thần, tập trung vào việc hỗ trợ và khôi phục cân bằng tinh thần và cảm xúc của cá nhân. Phương pháp này nhấn mạnh vào việc hiểu và giải quyết nguyên nhân gốc rễ của các vấn đề tâm lý, như căng thẳng, lo lắng, trầm cảm, hoặc trauma. Chữa lành tâm sinh lý có thể bao gồm các phương tiện như tâm lý học, tư vấn, terapi từ, kỹ thuật thở, yoga, thiền, và các kỹ thuật thả lỏng để giúp cá nhân phục hồi, phát triển sự cảm thụ và tự nhận thức, và xây dựng khả năng chống chọi với căng thẳng và áp lực trong cuộc sống hàng ngày.
', N'Images/TopicImg/Chua_Lanh.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (3, N'Phát triển bản thân', N'Phát triển bản thân là quá trình tự làm giàu kiến thức, kỹ năng và phẩm chất để tăng cường khả năng hoàn thiện bản thân và đạt được mục tiêu cá nhân. Điều này bao gồm việc thúc đẩy sự tự nhận thức, phát triển kỹ năng giao tiếp, quản lý thời gian hiệu quả, và tạo ra một cuộc sống ý nghĩa và hạnh phúc. Phát triển bản thân là quá trình liên tục và đa chiều, không chỉ là việc học hỏi mà còn là việc áp dụng những hiểu biết đó vào thực tế để thay đổi và tiến bộ.', N'Images/TopicImg/Self_Grown.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (4, N'Tình yêu', N'Tình yêu là trạng thái cảm xúc mạnh mẽ và sâu sắc đối với một người hoặc một vật thể, thường bao gồm sự quan tâm, sự chăm sóc, và sự cam kết. Nó có thể biểu hiện qua nhiều cách khác nhau, bao gồm tình bạn, tình dục, tình cảm gia đình và tình yêu lãng mạn. Tình yêu có thể mang lại hạnh phúc, sự bền vững và cảm giác được chấp nhận và trân trọng.', N'images/TopicImg/Tinh_Yeu.jpg')
INSERT [dbo].[Topics] ([TopicID], [TopicName], [Description], [ImageURL]) VALUES (5, N'Tiền tệ', N'Tiền tệ là nguồn cung cấp cho mọi thứ từ việc mua thức ăn hàng ngày đến thanh toán hóa đơn và tiết kiệm cho tương lai. Bạn sử dụng tiền mặt để mua sắm tại cửa hàng, hoặc thẻ tín dụng để thanh toán cho các dịch vụ trực tuyến. Mỗi lần bạn nhận lương, chi tiêu hoặc tiết kiệm, bạn đều đang tương tác với khái niệm về tiền bạc.', N'images/TopicImg/Tien_Te.jpg')
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
