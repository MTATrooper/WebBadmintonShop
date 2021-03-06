USE [master]
GO
/****** Object:  Database [Badminton]    Script Date: 1/3/2019 10:17:55 PM ******/
CREATE DATABASE [Badminton]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Badminton.mdf', FILENAME = N'D:\BadmintonShop\BadmintonShop\App_Data\Badminton.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Badminton_log.ldf', FILENAME = N'D:\BadmintonShop\BadmintonShop\App_Data\Badminton_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Badminton] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Badminton].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Badminton] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Badminton] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Badminton] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Badminton] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Badminton] SET ARITHABORT OFF 
GO
ALTER DATABASE [Badminton] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Badminton] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Badminton] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Badminton] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Badminton] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Badminton] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Badminton] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Badminton] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Badminton] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Badminton] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Badminton] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Badminton] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Badminton] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Badminton] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Badminton] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Badminton] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Badminton] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Badminton] SET RECOVERY FULL 
GO
ALTER DATABASE [Badminton] SET  MULTI_USER 
GO
ALTER DATABASE [Badminton] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Badminton] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Badminton] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Badminton] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Badminton] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Badminton', N'ON'
GO
ALTER DATABASE [Badminton] SET QUERY_STORE = OFF
GO
USE [Badminton]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Badminton]
GO
/****** Object:  User [hiepoccho]    Script Date: 1/3/2019 10:17:55 PM ******/
CREATE USER [hiepoccho] FOR LOGIN [hiepoccho] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hiepoccho]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/3/2019 10:17:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](max) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Sex] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Permission] [nvarchar](max) NULL,
	[Active] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[AccountID] [int] NOT NULL,
	[Fullname] [nvarchar](max) NOT NULL,
	[Phonenumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[TotalPrice] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_Details]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_Details](
	[ProductID] [int] NOT NULL,
	[BillID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Bill_Details] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[IsPublic] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NULL,
	[CreatedDate] [date] NOT NULL,
	[NewsTypeID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.News] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News_Type]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_dbo.News_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Images] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Producer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/3/2019 10:17:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ProducerID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[IMG] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[TopHot] [int] NOT NULL,
	[NewProduct] [int] NOT NULL,
	[Active] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 1/3/2019 10:17:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Discount] [int] NULL,
	[Begin] [date] NOT NULL,
	[End] [date] NOT NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_dbo.Sale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201901031401348_InitialCreate', N'BadmintonShop.Models.DAL.DataConnect', 0x1F8B0800000000000400ED5DDB6EE4B8117D0F907F10F49404B3DDF62C022446F72E3CF67863647CC9B46791378396E8B6105D3AA2346B23C897E5219F945F08A90BC5AB444A6AA9C76BCC4B9B148B45B2AA58AC22CFFCEF3FFF5DFDF81C85CE5798A22089D7EEF1E2C87560EC257E106FD76E9E3D7EF727F7C71F7EFB9BD5473F7A767EAEBFFB9E7C875BC668ED3E65D9EE64B944DE138C005A448197262879CC165E122D819F2CDF1F1DFD79797CBC8498848B6939CEEA731E6741048B3FF09F6749ECC15D9683F02AF16188AA725CB329A83AD7208268073CB8763F003F0AE22C89374FC96E517EBF383FFDE43AA76100303F1B183EBA0E88E3240319E6F6E40B829B2C4DE2ED66870B4078F7B283F8BB471022588DE2A4F9DC744047EFC980964DC39A9497A32C892C091E7F5FCDD0526CDE6B9E5D3A83780E3FE2B9CE5EC8A88B795CBBA79E97E005701DB1AF93B33025DFE9677951B57DE7705FBCA3A2812588FC7BE79CE56196A7701DC33C4B41F8CEB9CD1FC2C0FB2B7CB94BFE01E3759C8721CB266614D77105B8E8364D7630CD5E3EC3C78AF9CB73D759F2ED966243DA8C69538EEB32CEBE7FEF3AD7B873F010422A05CC1C6CB224853FC118A62083FE2DC83298E245BCF461318F52EF425F58DAD218FFAA7BC4A28775C975AEC0F327186FB3A7B5FB47AC3C17C133F4EB828A892F7180350FB7C9D21C2A986CEFF81620F44B92FA93777C813FEF1831FEB98F9E3F0469F6E48397BAE773BC627741644F68039F47E0BE637D9E92185EE7D1034CF7DED7C70804E1DE7B39F5FD1422B4FF99836914205418C37D0FC9CB82AF6348B2D0CD35F81A6C0BFB22897018E219FC0CC3A2163D05BB720B5B909A7B6AAA2FD224FA9C84558BBAFCFE0EA45B88ABEF1245E526C9534FE065B56CB683D64D8250EAB54390866FDB83AE2F62A2069BAB6A81BBF93E54C35DD8C2782C5B683B7BA3992DCB8EA7B1CA775852C3DB34F06658D70D56927C8A99D5DA536A30FB5AD4DA682A2D6A6D6EC7B1EEE730C30281EE4B53CBF3C3D629AD3CF7C1604B5F51EB6DF0ABF6F3D97D5CE2E75E269B7FE5D784E53E3B05D3CB10C35B773F84C669548AF1101A9C953024D12AEBC3455DA57E4A5D3065AB5A32256755DD7DA5A60D5B5C85A47E7CED20DDA3DCF5D0BBAAED9BAFA5EBEB7A1EDFA65816980E55F0333CE66D92BE0CA5D347C9C545BBFA69FA79FC5B0EAA551EC2FA39445E1AECB2710E8F969DDF25BBBF24036DF435FC851A8941FBC5E19C6C0DCDAEB815A88DB2293BB53A2939AA2BEFAB3E38AEA44A694390BF506D0ADDBB14390D69E70BA64AEEA44ACD76C57E61CB1D0221542FE506D7DC53F96CB862CB2586B8CA41DB67B3A83DF6CFBAF1DB06AAB53DD36CA05DBE9B5AF42C7556B4267AAD1EE0C81105EEEDC9C1F44D12679644718411D8C259C319AD1A60B92FA8F753D5CED14B038855EF25FDA4E19BE4EBFA3A0F90A738E9770418E036A0FE6EEF30F3C7D81F4C43173119E3F86EE47C8852AFF44C7A093CF6CC7BC93B6EF726EEBABEEE822C9CC3D2A3727E071ED99338838DAA4E98D2C8B3A764FF69E5B31492451D258785B5001112D6E10DADA9A8292A6D455D794F7EB0C682AB908E2A7CEDA0B34AC35E3F9B51347E331C5A799AC543E4A32A6348F010E915F73AB56C9B48EF29428917146C30E11C9A3CE3C783FD04A72D9356AE499D0AC0CB824534D861A1C41DAFDD3F48F3A3A14775B3A14793793CC9635794E79BF81C8630830E59307227EF0C200FF8F2DAE0F9F0F912AC0230253208426CDF11562AAC7EB2BE04B117EC40D8C2B8D0C650CB084F94BA58730E7730260AD232FF26DD32170AE4DE6927C24C754DCC6AC94851B7707129A2368150E78B7821A3F94C3B5953675DDBE5F730844DC5F94402A75A0F93AED549D889248E8F41EB644213906E04829E3EF628133A7634F2692CFABD644D392313089A72E826FDB65D0C9842D0E430A56E755B6296CD0A3711EF4924AE25F7D1A90423499C765A26903AEDF04DFA6613B833DA38363ED86E5894C142719949887B4263A74C6C4D257ADA6999CCE029866F6EF4CA3B08B3881E179AD3ADB03A4ED72C6E195136F7E0D449C74E61395A2C8EC79117150313888A6A1EBF85AD913FD5EA565573C46D96B509AC4C62973401238E9F3DD923E5544C2060CA219BF4CB06F92610B1329641A2B0B8054C9B2BF70097C55079CFEE0B8255F80D55312071E109CD0DCCC40BC64DE0440C4648068AA7501E22A5E665B141DBD2C1D750A0DE7F07216A0B252AB4A68342E3894A249A2A232E884BA161835475D0287709A97D59DCD1B65055A96951DADDB2B439AAD6953912483042CB2F6873279DF94475675DD4A08EC01BE5B9963949053B226D0C019D702FF951198E98BF0EAC1EB53E1E64161112465F6B4DC71C2823401D13D96312842B70F20CB4C4270C22140CC31A7536882B184D608FB12B2EEEC8E3EF38361B1E9C9921E86C92E171B77B467B4B017781432709DA539CE1394EE25FB6AC86A7AFBDCC049FCA9727417F9EE83E51300CAB3685EE23C45E462CA474E421B778C706FE31C333DDAA5AC6AD766A79221683AED34AD415A375AB6509E95015AC961AEC87D515D8ED8278CB60415425CEA6048238FB6E638F8D109534961E37A3A2E3487BCA92146CA1504BF2FC3EBC08529411D7F2019014DF991F499FB18EA7C69BA87BE27D4B799D6A1FA3FE9EFCAEB6D30EA406859F5E11B9C0638B88935F645E157BBDD4D221801C2004A922CF7B96847914EB8F1BFAD60D62024BA32935A7D44020B0949A52734ACDD3589652536A4EA9C128602935A5E6940A900296485160313B2C000137416C8539BDEA392B4BA92A32A741DFE2B25468A1C5D81888006E684CB9055755569F63AA2A93A9AC96824249075D497FA568036F0E8C8C85C62FEE612954940CCC84BAD97E6C4479E5886D5F96D8AC294D71F3CBAACD7CEB698D671DB887F0924EC6D63A39963E8DA1DBEC437496105B6E61FDAAA7E59C01ACCA0E4A27AB73D2689A594774FA29A8B6B556229BA030278FFA58B19E569DE1E7773E75D65F4FA57EE9CC8974A48A46B48F4B1244AD0CCE243DFAF34D0FD1D11033101B6DCBFD98F66BC9905EDB1A5126DB25CBAC3A0BA6A7C6A66D596A6DE9DC36DECCC54E3BBFE4F92D37C1A4C0BC7DF3929625D2945A6CC3EC6B5A6E37662B6CB688F2812CBF3D94651612C43C91E5E488297F65CE1F8D668D622B74D40C8C85BEE9DCD66256238EBDB611ADB84CCDD88CAB9ACEBD32DAFEABE7761C0F55D9C1AC6F11421C656D55940CD655DD6C4FC72EFAF88C33F6B4D4C2152C5FA4719E60596471288985C84E5160EB27D8B9B633491909B78E22640A420632A66CB51F11AB1E7C711E4059646138E8EB2D8E0F5A6AE1FCD52FB838CFAF2EB47022AA07599C1351955970C3BEB7E238622BAC1C257A1D437094B4D734E65481226D31961A201535335DD0343DD47DF4803C582911247E427BA7092121F1B3AA9230DDC8E05256A6FCC475F0F47C0D7C9291D9BCA00C460BF2C162F3CFF02C0C0ABDAE3FB80271F0085156BE9473DF1F1DBF1760C50F07E27B89901F2A9258CC8B43F56BAD095EFB0564523BDFF3593EB51381B5E3AF20F59E402A215C0FC4CD1E8BAE88AE5AD3FD5D049E7F3F18EADA2F4C7F7F986B2D373DA1AC07D1E38051075112B05D878D52829D1EC61AF754D482941D64F3EB5076F689792F5197209203E57F787019FBF079EDFEAB6875E25CFEFD9E367CE7DCA4784F38718E9C7FCFACFC0AB8E461044DD5C41ED678908AC8D0C5C338E3E1886D68F502CFEDA17A6D57F0E5AF4783AD355506DA709032F070B7A67D97AD0675CC63E4161D0F01CFEC26608DFBFA3AACF5F578964E024FB51355D27290C8C8A8ABA60C342D07316029718AB56EC05A87AD8508C0DA871905FC6A9CC1677B423C946A1F566420D53E54F6EFC5A9332ABF3ADB608FBCF8EB9E2F05A31C7AE15EE65ECE457CB3F32EE2EC09C6C1C47DE550F77A9D5A18C4BD5EEDF7E7E80D30685232E19B95110E9C6EA0720A80737DF622016E6EE0919083901B748C53C0C4F592661922CE549C9B9616BE983D92DBEB90EAF1761CDE39EA7F5CEA893E46DF28AA1EE54EF236BC7C1D283DEADDCB6370FDFB0E13A9736C519E5E1F8ED8B4C85ECA67A613833719AFE378A860AF0C096C46F0AFF9C4467F957876C9698B9F1E26BAD79C685E16423C3278D7841071AF159B6B7E2CAE39A0B70E4D70D800F52C826384AC65B15E4AF42BFE417C0F50AE43DF6734776F0F6F83B1C3C89A19176B6218AC89A0AFBE1DA42B1997405C2C6B2CABF20EDDDAF51F12BCBAE5497E14A02B15614B082CD48581A5EBE37E44942C551FB4B283BC118496AA837101B6F443180ABFA5A23C14984B45B3C450E9A659D94315E1AA4A47FDBEAC16BAD827A497A09C6D285C8AD086F00C58B6E48780DB650F512628BEF4CC79F830F970C070642E6B30AE6986B937102E7BD02D8B893A248CADBE985A070EA1D5576CD97D408BB57508385922AC15525976D9B3155E47990FCC020B4B7EEA805D446CEF83A84C8F60EF1405DB86C4AA4297629D43FACD65FC98D47EAAC051FD8990BEB9C2D6C5C79EE3699A058FC0CB70B507112AFE2B9D9F41984372D7F301FA97F14D9EEDF20C0F19460F21A7DDC4D76DEBBF00FCE2795EDD14F783D01843C06C0624D778137FC883D0A77C5F28924F1A12C489AEB26B642D339265DBBE504AD7496C48A89A3EEAFBDFC168176262E826DE009226B3E7ED0B829FE016782FB7D58B153D91EE85E0A77D751E806D0A2254D168DAE33FB10CFBD1F30FFF07892F356F31900000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Username], [Password], [Fullname], [Birthday], [Sex], [PhoneNumber], [Email], [Address], [Permission], [Active]) VALUES (1, N'longpham', N'12345', N'Phạm Đức Long', CAST(N'1996-11-10' AS Date), N'Male', N'0983481417', N'long96nb@gmail.com', N'Học viện KTQS', N'Quản trị', N'Kích hoạt')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Fullname], [Birthday], [Sex], [PhoneNumber], [Email], [Address], [Permission], [Active]) VALUES (2, N'user', N'1', N'Người đặt hàng', CAST(N'2018-01-01' AS Date), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([ID], [Username], [Password], [Fullname], [Birthday], [Sex], [PhoneNumber], [Email], [Address], [Permission], [Active]) VALUES (3, N'user1', N'a324342432', N'a', CAST(N'2018-06-01' AS Date), N'a', N'a', N'a@1', N'a', N'User', N'1')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([ID], [Date], [AccountID], [Fullname], [Phonenumber], [Address], [Email], [TotalPrice], [Status]) VALUES (1, CAST(N'2019-01-03' AS Date), 2, N'Phạm Đức Long', N'54364564', N'Hà Nội', N'a@gmail', N'450000', N'Chờ xử lý')
INSERT [dbo].[Bill] ([ID], [Date], [AccountID], [Fullname], [Phonenumber], [Address], [Email], [TotalPrice], [Status]) VALUES (2, CAST(N'2019-01-03' AS Date), 3, N'a', N'a', N'a', N'a@1', N'150000', N'Da xac nhan')
SET IDENTITY_INSERT [dbo].[Bill] OFF
INSERT [dbo].[Bill_Details] ([ProductID], [BillID], [Amount], [Price]) VALUES (30, 1, 3, 150000)
INSERT [dbo].[Bill_Details] ([ProductID], [BillID], [Amount], [Price]) VALUES (30, 2, 1, 150000)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Vợt')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'Giầy')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'Quần áo')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (4, N'Phụ Kiện')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([ID], [Title], [IsPublic], [Content], [Author], [CreatedDate], [NewsTypeID]) VALUES (1, N'Lee Chong Wei – sau hai tháng điều trị căn bệnh ung thư mũi tại Đài Loan có tiến triển tốt, anh sẽ sớm quay lại sân đấu.', 1, N'<div class="entry-content single-page"><h2><em><strong>Lee Chong Wei</strong></em> – sau hai tháng điều trị căn bệnh ung thư mũi tại Đài Loan có tiến triển tốt, anh sẽ sớm quay lại sân đấu.</h2><p><strong><em>Lee Chong Wei –</em> </strong>được các bác sĩ chuẩn đoán là ung thư mũi giai đoạn đầu và anh được đưa đi điều trị tại Đài loan.&nbsp;&nbsp;Mới đây, các bác sĩ cho biết anh&nbsp;đã kết thúc điều trị và kết quả khả quan. Tất cả tế bào ung thư đều biến mất, và anh ấy có thể hồi phục hoàn toàn.</p> <figure id="attachment_11223" style="width: 650px" class="wp-caption aligncenter"><img class="wp-image-11223 size-medium" title="Lee Chong Wei" src="https://fbshop.vn/wp-content/uploads/2018/10/20170526_1432_SudirmanCup2017_BPYN3440-650x400.jpg" alt="Lee Chong Wei" width="650" height="400" srcset="https://fbshop.vn/wp-content/uploads/2018/10/20170526_1432_SudirmanCup2017_BPYN3440-650x400.jpg 650w, https://fbshop.vn/wp-content/uploads/2018/10/20170526_1432_SudirmanCup2017_BPYN3440-510x314.jpg 510w, https://fbshop.vn/wp-content/uploads/2018/10/20170526_1432_SudirmanCup2017_BPYN3440.jpg 660w" sizes="(max-width: 650px) 100vw, 650px"><figcaption class="wp-caption-text">Lee Chong Wei</figcaption></figure><p>Chủ tịch Hội đồng <a href="https://www.facebook.com/caulong.pro/">Olympic Malaysia,</a> Datuk Seri Mohamad Norza Zakaria đã tới thăm tay vợt<em><strong> Lee Chong Wei</strong></em> sau khi tay vợt này trở về từ Đài Loan, nơi anh đã trải qua&nbsp;<span class="text_exposed_show">2 tháng để điều trị ung thư mũi, mặc dù anh đã giảm 5kg nhưng anh vẫn luôn nở nụ cười hạnh phúc và vui vẻ, anh là một chiến binh kiên cường, sau khi nghỉ ngơi đầy đủ anh sẽ trở về Kuala Lumpur cùng gia đình trong chuyên cơ riêng.</span></p> <figure id="attachment_11224" style="width: 320px" class="wp-caption aligncenter"><img class="wp-image-11224 size-medium" title="Lee Chong Wei " src="https://fbshop.vn/wp-content/uploads/2018/10/lee-chong-wei-tro-lai-sau-ung-thu_grande-1-320x400.jpg" alt="Chủ tịch Hội đồng Olympic Malaysia, Datuk Seri Mohamad Norza Zakaria đã tới thăm Lee Chong Wei " width="320" height="400" srcset="https://fbshop.vn/wp-content/uploads/2018/10/lee-chong-wei-tro-lai-sau-ung-thu_grande-1-320x400.jpg 320w, https://fbshop.vn/wp-content/uploads/2018/10/lee-chong-wei-tro-lai-sau-ung-thu_grande-1.jpg 480w" sizes="(max-width: 320px) 100vw, 320px"><figcaption class="wp-caption-text">Chủ tịch Hội đồng Olympic Malaysia, Datuk Seri Mohamad Norza Zakaria đã tới thăm Lee Chong Wei</figcaption></figure><p>Đây là một tin vui cho làng cầu Malaysia và thế giới các fan của anh đang rất vui mừng và hào hứng khi chào đón anh trở về. Anh&nbsp;có thể dự sinh nhật của mình ở tuổi 36 cùng gia đình</p><p>Được sự quan tâm của cộng đồng, bạn bè và gia đình sức khỏe của anh hiện tại đã tốt lên rất nhiều, mặc dù sức khỏe của anh đã khá lên nhưng hiện tại anh vẫn chưa thể quay trở lại sân đấu luôn được,<em>&nbsp;</em>anh cần nghỉ ngơi 2 đến 3 tuần để sức khỏe bình phục và ổn định.</p> <figure id="attachment_11225" style="width: 600px" class="wp-caption aligncenter"><img class="wp-image-11225 size-medium" title="Lee Chong Wei" src="https://fbshop.vn/wp-content/uploads/2018/10/5b580d72a31031a3f2b511f5-600x400.jpeg" alt="Lee Chong Wei" width="600" height="400" srcset="https://fbshop.vn/wp-content/uploads/2018/10/5b580d72a31031a3f2b511f5-600x400.jpeg 600w, https://fbshop.vn/wp-content/uploads/2018/10/5b580d72a31031a3f2b511f5-768x512.jpeg 768w, https://fbshop.vn/wp-content/uploads/2018/10/5b580d72a31031a3f2b511f5-510x340.jpeg 510w, https://fbshop.vn/wp-content/uploads/2018/10/5b580d72a31031a3f2b511f5.jpeg 900w" sizes="(max-width: 600px) 100vw, 600px"><figcaption class="wp-caption-text">Lee Chong Wei</figcaption></figure><p>Chủ tịch ủy ban huấn luyện và đào tạo cầu lông Malaysia (BAM) Datuk NgChin Chai cho biết khả năng anh<em>&nbsp;</em>sẽ quay trở lại sân vào đầu năm 2019, nếu tiến triển tốt thì cuối năm 2018 Lee Chong Wei có thể tham dự các giải cầu lông các CLB Malaysia Purple League 2018.</p><p>Mọi người đang rất mong đợi về sự xuất hiện của anh trên sân cầu, mong rằng thời gian sắp tới chúng ta có thể được ngắm nhìn lại những đường cầu đã từng làm nên tay vợt huyền thoại <em><strong>Lee Chong Wei </strong></em>và chắc chắn sẽ có người bạn đồng hành cùng là<a href="https://fbshop.vn/lin-dan-ngoai-tinh"> Lin Dan</a></p><p>&nbsp;</p><h2></h2><div class="blog-share text-center"><div class="is-divider medium"></div><div class="social-icons share-icons share-row relative icon-style-outline ">', NULL, CAST(N'2019-01-03' AS Date), 1)
INSERT [dbo].[News] ([ID], [Title], [IsPublic], [Content], [Author], [CreatedDate], [NewsTypeID]) VALUES (2, N'Top 6 kỹ thuật chơi cầu lông cần thành thục ngay để cải thiện trình độ', 1, N'<div class="center_column col-xs-12 col-sm-9" id="center_column">
	<div class="page news-item-page">
		<div class="page-title">
			<h1>
				Top 6 kỹ thuật chơi cầu l&ocirc;ng cần th&agrave;nh thục ngay để cải thiện tr&igrave;nh độ</h1>
		</div>
		<div class="page-body">
			<div class="news-date">
				Tuesday, October 16, 2018</div>
			<div class="news-body">
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">Cầu l&ocirc;ng l&agrave; m&ocirc;n thể thao dễ chơi, dễ đ&aacute;nh v&agrave; rất vui để luyện tập. Để đ&aacute;nh bại đối thủ, bạn cần c&oacute; những pha cầu sắc n&eacute;t, tinh tế trong xử l&yacute; v&agrave; mạnh mẽ trong những c&uacute; dứt điểm. Nếu bạn đ&atilde; biết&nbsp;kỹ thuật chơi cầu l&ocirc;ng tốt nhưng muốn tăng cường khả năng bản th&acirc;n hơn nữa, cần phải t&igrave;m c&aacute;ch nhằm tăng cường hết tất cả điểm mạnh v&agrave; khắc phục điểm yếu của m&igrave;nh.</span></p>
				<p style="text-align: justify;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">1. Thuần thục&nbsp;kỹ thuật chơi cầu l&ocirc;ng cơ bản</span></strong></p>
				<p style="text-align: center;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><img alt="" src="/Data/images/ky-thuat-cau-long.jpg" style="width: 900px; height: 675px;" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/ky-thuat-cau-long.jpg" style="undefined" /></span></strong></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">Lu&ocirc;n lu&ocirc;n đ&aacute;nh cầu v&agrave;o trung t&acirc;m mặt vợt. Bạn n&ecirc;n đ&aacute;nh cầu v&agrave;o giữa mặt vợt trong mọi trường hợp chạm cầu. Bạn c&oacute; thể thực hiện kỹ thuật n&agrave;y bằng c&aacute;ch nh&igrave;n v&agrave;o trung t&acirc;m của quả cầu khi thực hiện c&uacute; đ&aacute;nh. Bạn n&ecirc;n thực hiện luyện tập&nbsp;kỹ thuật chơi cầu l&ocirc;ng n&agrave;y thường xuy&ecirc;n để c&oacute; được cảm gi&aacute;c cầu tốt nhất.</span></p>
				<p style="text-align: justify;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">2. Chạm cầu ở v&ugrave;ng tr&ecirc;n c&ugrave;ng của vợt</span></strong></p>
				<p style="text-align: center;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><img alt="" src="/Data/images/ky-thuat-cau-long-2.jpg" style="width: 900px; height: 675px;" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/ky-thuat-cau-long-2.jpg" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/hoc-danh-cau-long-2.jpg" /></span></strong></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">Nhằm tận dụng từ tốc độ v&agrave; chiều cao do quả cầu tạo ra, h&atilde;y cố gắng chạm cầu ở vị tr&iacute; cao nhất c&oacute; thể. Đừng để cầu rơi xuống qu&aacute; s&acirc;u, khi đ&oacute; lực chạm cầu của bạn sẽ bị giảm đi rất nhiều.</span></p>
				<p style="text-align: justify;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">3. kỹ thuật chơi cầu l&ocirc;ng: Lu&ocirc;n lu&ocirc;n trở lại trung t&acirc;m s&acirc;n cầu</span></strong></p>
				<p style="text-align: center;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><img alt="" src="/Data/images/ky-thuat-cau-long-3.jpg" style="width: 900px; height: 675px;" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/ky-thuat-cau-long-3.jpg" /></span></strong></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">Đừng qu&ecirc;n vị tr&iacute; của m&igrave;nh sau khi chạm cầu. Trở lại ngay trung t&acirc;m s&acirc;n mỗi khi thực hiện một c&uacute; đ&aacute;nh sẽ gi&uacute;p bạn chủ động để thực hiện những động t&aacute;c kế tiếp. Điều n&agrave;y sẽ khiến đối thủ của bạn gặp kh&oacute; khăn trong việc điều cầu v&agrave;o vị tr&iacute; m&agrave; bạn kh&ocirc;ng thể với tới.</span></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><strong>Xem th&ecirc;m:</strong>&nbsp;<a href="https://badmintonw.com/vot-cau-long-yonex-arcsaber-11/" target="_blank">VỢT CẦU L&Ocirc;NG YONEX ARCSABER 11 | C&Acirc;Y VỢT CẦU L&Ocirc;NG HO&Agrave;N HẢO&nbsp;</a></span></p>
				<p style="text-align: justify;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">4. kỹ thuật chơi cầu l&ocirc;ng: Đ&aacute;nh cầu về ph&iacute;a sau vạch cuối s&acirc;n</span></strong></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">&Aacute;p dụng triệt để kỹ thuật chơi cầu l&ocirc;ng tốt, bạn n&ecirc;n đ&aacute;nh cầu về ph&iacute; cuối s&acirc;n đối phương. Khi cầu&nbsp;bay gần&nbsp;vạch cuối s&acirc;n sẽ khiến đối phương d&ugrave;ng sức v&agrave; lực nhiều hơn để trả cầu. Đồng thời những thế cầu n&agrave;y sẽ kh&aacute; kh&oacute; để b&ecirc;n kia chuyến tuyến tung ra những pha cầu g&acirc;y kh&oacute; dễ cho bạn.</span></p>
				<p style="text-align: center;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><img alt="" src="/Data/images/ky-thuat-cau-long-4.jpg" style="width: 900px; height: 675px;" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/ky-thuat-cau-long-4.jpg" /></span></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">Tuy nhi&ecirc;n, khi thực hiện động t&aacute;c n&agrave;y, bạn n&ecirc;n nhắm khoảng c&ograve;n 0,5m về ph&iacute;a vạch cuối s&acirc;n đối phương l&agrave; tốt nhất, tr&aacute;nh việc nhỡ mạnh tay cầu bay ngo&agrave;i vạch một c&aacute;ch đ&aacute;ng tiếc. Trong mỗi d&ograve;ng&nbsp;<a href="https://shopvnb.com/vot-cau-long.html" target="_blank">vợt cầu l&ocirc;ng</a> sẽ c&oacute; những khả năng v&agrave; lối đ&aacute;nh kh&aacute;c nhau, bạn n&ecirc;n thuần thục được vợt của m&igrave;nh để tung sức ph&ugrave; hợp.</span></p>
				<p style="text-align: justify;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">5. Kỹ thuật chơi cầu l&ocirc;ng: Luyện tập di chuy&ecirc;n bước ch&acirc;n</span></strong></p>
				<p style="text-align: center;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><img alt="" src="/Data/images/ky-thuat-cau-long-5.jpg" style="width: 900px; height: 675px;" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/ky-thuat-cau-long-5.jpg" /></span></strong></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">Cầu l&ocirc;ng cũng như quần vợt, th&agrave;nh c&ocirc;ng hay thất bại nằm ho&agrave;n to&agrave;n trong bước ch&acirc;n của bạn. Trong kỹ thuật cầu l&ocirc;ng cơ bản, h&atilde;y tập di chuyển ch&acirc;n h&agrave;i h&ograve;a v&agrave; nhịp nh&agrave;ng bằng c&aacute;ch phối hợp giữa hai ch&acirc;n. Tuyệt đối kh&ocirc;ng di chuyển theo kiểu cắt ch&eacute;o ch&acirc;n với nhau.</span></p>
				<p style="text-align: justify;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">6. Kỹ thuật&nbsp;chơi cầu l&ocirc;ng: Thực hiện những pha cầu ngắn</span></strong></p>
				<p style="text-align: center;">
					<strong><span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><img alt="" src="/Data/images/ky-thuat-cau-long-6.jpg" style="width: 900px; height: 675px;" /><img alt="" src="/Content/Images/uploaded/vot-cau-long/ky-thuat-cau-long-6.jpg" /></span></strong></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;">D&ugrave; bạn đ&aacute;nh đơn hay đ&aacute;nh đ&ocirc;i, những pha cầu ngắn, bỏ nhỏ sẽ khiến đối phương mất cảnh gi&aacute;c. Đối thủ đ&ocirc;i khi kh&ocirc;ng biết rằng bạn sẽ tung ra c&uacute; đ&aacute;nh ngắn v&agrave; kh&ocirc;ng thể chạy l&ecirc;n kịp để trả cầu kịp thời. Để thực hiện được động t&aacute;c n&agrave;y, bạn kh&ocirc;ng n&ecirc;n chỉ chạm cầu nhẹ đ&ocirc;i khi sẽ khiến cầu bay kh&ocirc;ng qua lưới. Thay v&agrave;o đ&oacute;, chạm cầu ở ph&iacute;a cao hơn của mặt vợt.</span></p>
				<p style="text-align: justify;">
					<span style="font-family: arial, helvetica, sans-serif; font-size: 12pt;"><strong>B&agrave;i viết li&ecirc;n quan:&nbsp;</strong><a href="https://badmintonw.com/nen-dung-vot-cau-long-loai-nao/" target="_blank">N&Ecirc;N D&Ugrave;NG VỢT CẦU L&Ocirc;NG LOẠI N&Agrave;O TỐT NHẤT? TOP 3 VỢT N&Ecirc;N D&Ugrave;NG NHẤT NĂM 2018&nbsp;</a></span></p>
			</div>
		</div>
	</div>
</div>
<p>
	&nbsp;</p>
', NULL, CAST(N'2019-01-03' AS Date), 2)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[News_Type] ON 

INSERT [dbo].[News_Type] ([ID], [Name], [Active]) VALUES (1, N'Giải trí', 1)
INSERT [dbo].[News_Type] ([ID], [Name], [Active]) VALUES (2, N'Thể thao', 1)
INSERT [dbo].[News_Type] ([ID], [Name], [Active]) VALUES (3, N'Trong nước', 1)
INSERT [dbo].[News_Type] ([ID], [Name], [Active]) VALUES (4, N'Thế giới', 1)
INSERT [dbo].[News_Type] ([ID], [Name], [Active]) VALUES (5, N'Tin nổi bật', 1)
SET IDENTITY_INSERT [dbo].[News_Type] OFF
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ID], [Name], [Images]) VALUES (1, N'Yonex', N'/Data/images/logo-Yonex.png')
INSERT [dbo].[Producer] ([ID], [Name], [Images]) VALUES (2, N'Lining', N'/Data/images/logo-Lining.jpg')
INSERT [dbo].[Producer] ([ID], [Name], [Images]) VALUES (3, N'Victor', N'/Data/images/logo-Victor.gif')
INSERT [dbo].[Producer] ([ID], [Name], [Images]) VALUES (4, N'Kumpoo', N'/Data/images/logo-Kumpoo.jpg')
INSERT [dbo].[Producer] ([ID], [Name], [Images]) VALUES (5, N'Forza', N'/Data/images/logo-FORZA.jpg')
SET IDENTITY_INSERT [dbo].[Producer] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (1, N'Vợt cầu lông Yonex Duora 10', 1, 1, 3200000, N'/Data/images/Yonex-duora10.jpg', 10, N'<ul><li>Cấu tạo khung đầu vợt: H.M Graphite, Nanometric DR,  Ni-ti Fiber</li>
<li>Cấu tạo thân vợt: H.M Graphite, Nanometric</li>
<li>Trọng lượng, chu vi cán vợt: 3U (Ave.88g) G4,5/2U (Ave.93g) G4,5</li>
<li>Độ căng lưới: 3U 19-26 lbs, 2U 20-27 lbs</li>
<li>Độ cứng thân vợt: Stiff (cứng)</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (2, N'Vợt cầu lông Yonex ASTROX 99', 1, 1, 2500000, N'/Data/images/Yonex-Astrox99.jpg', 10, N'<ul><li>Cứng : Trung Bình</li>
<li>Khung: H.M. GRAPHITE + NANOMETRIC + Tungsten</li>
<li>Thân vợt : H.M. GRAPHITE + NamdWeight / Grip</li>
<li>kích thước/ trọng lượng: 4U (Ave.83g) G4,5</li>
<li>3U (Ave.88g) G4,5</li>
<li>Sức Căng : 4U 20-28 lbs, 3U 21-29 lbs</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (3, N'Vợt yonex voltric 7dg DG', 1, 1, 1550000, N'/Data/images/Yonex-Voltric7.jpg', 10, N'<ul><li>Sức căng: thông số căng max lên tới 15.5kg: 11kg~15.5 kg</li>
<li>Chất liệu: H.M. Graphite, Tungsten</li>
<li>Vợt nặng: 3u ( khoảng 86g- 88g)</li>
<li>Tay cầm : G5 thông số chuẩn đối với bàn tay châu Á</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (4, N'Vợt cầu lông victor BS 12', 3, 1, 2750000, N'/Data/images/Victor-BS12.jpg', 5, N'<ul><li>Độ cứng: độ cứng trung bình</li>
<li>Chiều dài: 675 mm</li>
<li>Trọng lượng : 4u-g5 và 4u-g5</li>
<li>Mức căng tối ưu: mức căng đẹp 11kg. tối ưu &lt; 11,5</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (5, N'Vợt cầu lông victor Arrow 18', 3, 1, 1800000, N'/Data/images/Victor-Arrowspeed18.jpg', 4, N'<ul><li>Độ cân bằng : nặng đầu</li>
<li>Chiều dài : 675mm</li>
<li>Trọng lượng/Kích thước : 3U/G4G5, 4U/G5</li>
<li>Mức căng khuyên dùng : 24-32lbs</li>
<li>Công nghệ thân : All cacbon graphite + nano tech + 7.0 shaft</li>
<li>Công nghệ khung : All cacbon graphite</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (6, N'Vợt cầu lông victor BS DF90D', 3, 1, 1050000, N'/Data/images/victor-bs-df-90d.jpg', 3, N'<ul><li>Màu sắc : đỏ trắng cam</li>
<li>Chiều dài : 675 mm</li>
<li>Tr/lượng,K/thước :3U/G5 , 4U/G5</li>
<li>Mức căng an toàn : 11kg</li>
<li>Công nghệ thân: graphite + resin</li>
<li>Công nghệ khung: graphite + resin + 7.0 shaft</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (7, N'Vợt cầu lông lining HC1100', 2, 1, 1250000, N'/Data/images/lining-hc1100-black.jpg', 7, N'<ul><li>Chất liệu : carbon fibre</li>
<li>Trọng lượng : w84 +- 4g</li>
<li>Mức căng dây khuyên dùng : 9-11kg</li>
<li>Điểm cân bằng : 290 +- 5mm</li>
<li>Chiều dài toàn bộ : 675mm</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (8, N'Vợt cầu lông Lining 90TD', 2, 1, 1300000, N'/Data/images/Lining-90TD.jpg', 6, N'<ul><li>Chất liệu: sợi carbon tổng hợp</li>
<li>Trọng lượng: 3U</li>
<li>Kích thước cán: G2</li>
<li>Dòng vợt: Cân bằng</li>
<li>Độ cứng: Trung bình</li>
<li>Lực căng tối đa: 12kg</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (9, N'Vợt cầu lông kumpoo smart i7', 4, 1, 3900000, N'/Data/images/kumpoo-smart-i7.jpg', 5, N'<ul><li>Cân nặng : 84+-1 (g) 3U</li>
<li>Cân bằng : 290+-3 (mm)</li>
<li>Chiều dài : 675 (mm)</li>
<li>mức căng : 13</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (10, N'Vợt cầu lông Forza mega speed 99', 5, 1, 870000, N'/Data/images/forza-mega-speed-99-nano.jpg', 8, N'<ul><li>4U – G2</li>
<li>Chất liệu: 40T CNT U-HM Graphite.</li>
<li>Khung vợt: 88 Lỗ, lỗ khung vát xé gió, 40T CNT U-HM</li>
<li>Trọng lượng/ Cỡ cán/  : 3U (88g ± 2g)/ G3.</li>
<li>Điểm cân bằng: 290mm ± 2m..</li>
<li>Sức căng: 13 Kg.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (11, N'Vợt cầu lông Forza light 9.9', 5, 1, 1270000, N'vforza-light 9.9.jpg', 10, N'<ul><li>4U – G2</li>
<li>Chất liệu : 40T CNT U-HM phủ 2 mảnh Titan da rắn. Air Flow Frame xé</li>
<li>gió, chống xoắn.</li>
<li>Khung vợt : 88 Lỗ, khung vát xe gió, 40T CNT U-HM.</li>
<li>Thân vợt : 40T CNT U-HM.</li>
<li>Độ cứng : 3/5.</li>
<li>Sức căng : 12.5 Kg.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (12, N'Giày cầu lông Yonex Aerus 3', 1, 2, 1950000, N'/Data/images/yonex-aerus3.jpg', 15, N'<ul><li>Size : 39/40.5/41/42</li>
<li>Color: Đen/ Xanh da trời</li>
<li>Chất liệu: Da P.U , Lưới Polyester , Da bền</li>
<li>Công nghệ : Power Cushion</li>
<li>Đế giày: Cao su thiết kế mặt lưới tổ ong</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (13, N'Giày cầu lông Yonex PC 65X Men', 1, 2, 2500000, N'/Data/images/yonex-PC 65X.jpg', 20, N'<ul><li>Size : 37/40/41.5/43</li>
<li>Color: Đen trắng</li>
<li>Chất liệu: P.U. Leather, Polyester Mes,,E.V.A.,Solid E.V.A.</li>
<li>Công nghệ : Power Cushion, Lưới ,….</li>
<li>Đế giày: Cao Su, Dán keo</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (14, N'Giày cầu lông Yonex COMFORT ', 1, 2, 1800000, N'/Data/images/yonex-comfort.jpg', 10, N'<ul><li>Size : 38/40/41.5/42/43</li>
<li>Color: Đỏ trắng</li>
<li>Chất liệu: Da P.U , Lưới Polyester , Da bền</li>
<li>Công nghệ : ToughBrid Light , Power Cushion , T.P.U. </li>
<li>Đế giày: Cao Su</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (15, N'Giày cầu lông lining AYTL039', 2, 2, 1450000, N'/Data/images/lining-aytl039.jpg', 20, N'<ul><li>Size : 37/39/40/41/42/43/44</li>
<li>Color: Đen/ Xanh lá cây/ Vàng</li>
<li>Chất liệu: Da tổng hợp</li>
<li>Công nghệ : Radiation</li>
<li>Đế giày: Cao Su</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (16, N'Giày cầu lông lining AYTM033', 2, 2, 950000, N'/Data/images/lining-AYTM033.jpg', 10, N'<ul><li>Size : 37/39/40.5/41/42/43</li>
<li>Color: Đen/ Xanh da trời/ Trắng</li>
<li>Chất liệu: Da tổng hợp</li>
<li>Công nghệ : Radiation</li>
<li>Đế giày: Cao Su</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (17, N'Giày cầu lông victor A390 FB', 3, 2, 1080000, N'/Data/images/victor-A390 FB.jpg', 8, N'<ul><li>Size : 38/40/41/42/43/44</li>
<li>Color: Xanh</li>
<li>Chất liệu: EVA  + tấm LYNON + Solid EVA</li>
<li>Công nghệ : Radiation, Energymax</li>
<li>Đế giày: Cao Su</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (18, N'Giày cầu lông victor as33 ', 3, 2, 850000, N'/Data/images/victor-as33.jpeg', 5, N'<ul><li>Size : 37/40.5/41/43/44</li>
<li>Color: Cam đen</li>
<li>Chất liệu: Pu leather + mesh + nylon sheet</li>
<li>Công nghệ : Radiation, Energymax</li>
<li>Đế giày: Cao Su chống trượt cao cấp</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (19, N'Giày cầu lông kumpoo kh-088', 4, 2, 650000, N'/Data/images/kumpoo-kh088.jpg', 9, N'<ul><li>Size : 39/40.5/41/42/43/44</li>
<li>Color: Cam/ Đen/ Xanh chuối</li>
<li>Chất liệu: Da tổng hợp cực bền và chắc chắn</li>
<li>Công nghệ : Công nghệ hỗ trợ giảm chấn SAS</li>
<li>Đế giày: Cao Su chống mài mòn</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (20, N'Giày cầu lông kumpoo kh20', 4, 2, 500000, N'/Data/images/Kumpoo-kh20.jpeg', 15, N'<ul><li>Size : 38/40/41/42/43/44</li>
<li>Color: Trắng/ Vàng</li>
<li>Chất liệu: Da thật phủ bóng</li>
<li>Công nghệ : Công nghệ hỗ trợ giảm chấn SAS</li>
<li>Đế giày: Cao Su chống mài mòn</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (21, N'Giày cầu lông FZ Forza', 5, 2, 1500000, N'/Data/images/forza.jpg', 6, N'<ul><li>Size : 38/40/41/42
<li>Color: Đen vàng
<li>Chất liệu: Da tống hợp polyme
<li>Công nghệ : Energymax
<li>Đế giày: Cao Su</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (22, N'Áo cầu lông Yonex 3019 Lindan', 1, 3, 150000, N'/Data/images/Yonex-3019-Lindan.jpg', 10, N'<ul><li>Size : S/M/L/XL</li>
<li>Color: Đỏ/ Trắng</li>
<li>Chất liệu: 90%  Polyester, 10% Cotton</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (23, N'Áo cầu lông Yonex 2086', 1, 3, 180000, N'/Data/images/Yonex-2086.jpg', 15, N'<ul><li>Size : M/L/XL</li>
<li>Color: Vàng/ Đen</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (24, N'Áo cầu lông lining AAYM077-1', 2, 3, 480000, N'/Data/images/lining-AAYM077-1.jpg', 12, N'<ul><li>Size : M/L/XL/XXL</li>
<li>Color: Trắng xanh</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (25, N'Áo cầu lông lining aatn013-2', 2, 3, 730000, N'/Data/images/lining-aatn013-2.jpg', 20, N'<ul><li>Size : M/L/XL/XXL</li>
<li>Color: Đen vàng</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (26, N'Áo khoác cầu lông victor j75600 ', 3, 3, 850000, N'/Data/images/victor-j75600.jpg', 8, N'<ul><li>Size : M/L/XL/XXL</li>
<li>Color: Đen/ Xanh dương</li>
<li>Chất liệu: 88% Polyster, 12% spandex</li></ul>', 1, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (27, N'Áo cầu lông victor t80028', 3, 3, 450000, N'/Data/images/victor-t80028.jpg', 15, N'<ul><li>Size : M/L/XL/XXL</li>
<li>Color: Đen/ Trắng</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (28, N'Áo cầu lông kumpoo kw-8110', 4, 3, 550000, N'/Data/images/kumpoo-nam-kw-8110.jpg', 10, N'<ul><li>Size : M/L/XL/XXL</li>
<li>Color: Đen/ Vàng</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (29, N'Quần cầu lông kumpoo kp-1129', 4, 3, 250000, N'/Data/images/kumpoo-kp1129-1.jpg', 10, N'<ul><li>Size : M/L/XL/XXL</li>
<li>Color: Đen</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (30, N'Quần cầu lông victor r75200 ', 3, 3, 150000, N'/Data/images/victor-r75200.jpg', 6, N'<ul><li>Size : M/L/XL</li>
<li>Color: Xanh</li>
<li>Chất liệu: 100%  Polyester</li></ul>', 0, 1, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (31, N'Cước cầu lông Yonex BG99 ', 1, 4, 100000, N'/Data/images/Yonex-BG99.jpg', 50, N'<ul><li>Chiều dài: 10m ( 33ft ), đường kính sợi 0.69mm</li>
<li>Lõi: Lõi đa sợi tơ Polymer Nylon độ bền cao</li>
<li>Vỏ: Sợi bện đặc biệt Polymer Nylon thô độ bền cao</li>
<li>Lớp phủ: Lớp phủ Nylon đặc biệt.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (32, N'Túi đựng giày Yonex ', 1, 4, 150000, N'/Data/images/Yonex-tuigiay.jpg', 30, N'<ul><li>Chất liệu: Nilon</li>
<li>Kích thước: 33x23x14 cm</li>
<li>Chất liệu chống nước, đầu túi có dây rút chắc chắn.</li>
<li>Không gian túi đủ rộng để vừa giày và 2 áo.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (33, N'Cuốn cán Yonex ', 1, 4, 15000, N'/Data/images/Yonex-cuoncan.jpg', 100, N'<ul><li>Chất liệu: Nilon mềm</li>
<li>Chiều dài: 80 cm</li>
<li>Chất liệu chống nước, thấm mồ hôi tốt.</li>
<li>Tạo sự êm ái và cảm giác thoải mái hơn khi cầm vợt.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (34, N'Băng bó cơ thể thao Lining ', 2, 4, 75000, N'/Data/images/Lining-Boco.jpg', 40, N'<ul><li>Chất liệu: Miếng bọt biển + Vải đàn hồi Spandex siêu mịn, mát,</li>
<li>không bí đẫm mồ hôi</li>
<li>Thiết kế dạng ống ôm chân, kích thước vừa vặn bảo vệ phần gối</li>
<li>Kích thước sản phẩm: bó gối 30x16cm; miếng bảo vệ 17x15cm</li>
<li>Bảo vệ toàn bộ phần đầu gối: Xương, sụn, hoạt dịch; Giảm lực tác động</li>
<li>gây chấn thương.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (35, N'Ba lô cầu lông Lining ', 2, 4, 350000, N'/Data/images/Lining-Balo.jpg', 20, N'<ul><li>Chất liệu vải có khả năng chống thấm hút tốt giúp bạn an tâm</li>
<li>nếu đi chơi gặp thời tiết xấu.</li>
<li>Không gian lưu trữ được thiết kế rất hiện đại giúp người sử dụng lưu</li>
<li>trữ ngăn nắp và tiện ích.</li>
<li>Quai đeo trợ lực được thiết kế rất thông minh vừa thoáng mát.</li>
<li>Kích thước sản phẩm: 35 x 32 x 75.5cm.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (36, N'Quả cầu lông Victor ', 3, 4, 160000, N'/Data/images/Victor-cau.jpg', 45, N'<ul><li>Cầu Victor Lark 5 có độ chuẩn và độ bền cao</li>
<li>Ống cầu tương đối đều, ít có quả bị lỗi kỹ thuật.</li>
<li>Phù hợp cho đánh đôi và đơn.</li>
<li>Lông cầu tương đối dai nên tốc độ bay chậm.</li>
<li>1 ống cầu gồm 12 quả.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (37, N'Tất cầu lông Victor ', 3, 4, 60000, N'/Data/images/Victor-tat.jpg', 50, N'<ul><li>Chất liệu : 81,4% combed cotton +16,8 polyester + 1,8% spandex</li>
<li>Được làm từ chất liệu vải mềm mại, co giãn, đàn hồi tốt, êm ái.</li>
<li>Sản phẩm còn có khả năng chống bám bẩn và đặc biệt là chống tĩnh điện.</li>
<li> Spandex (hay còn là Elastane) để tăng độ bền, độ đàn hồi.</li>
<li>Size : 22-25 cm</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (38, N'Bao vợt cầu lông Kumpoo', 4, 4, 600000, N'/Data/images/Kumpoo-baovot.jpg', 20, N'<ul><li>Chất liệu : Da bóng , vải khử mùi,  chống ướt, dễ lau chùi.</li>
<li>Kiểu dáng : hộp dài</li>
<li>kích thước: 23*32*74 cm.</li>
<li>Màu sắc: xanh da trời, vàng.</li>
<li>Không gian lưu trữ được thiết kế rất hiện đại giúp người sử dụng lưu</li>
<li>trữ ngăn nắp và tiện ích.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (39, N'Lót giày thể thao Kumpoo', 4, 4, 80000, N'/Data/images/Kumpoo-lotgiay.jpg', 50, N'<ul><li>Miếng lót giày silicon mang đến cảm giác thoải mái nhất trên</li>
<li>mỗi bước đi trong suốt ngày dài năng động.</li>
<li>Hấp thụ lực tác động nhất là phần gót và bàn chân</li>
<li>Có khả năng kháng khuẩn, giảm mùi hôi chân, và chống phồng rộp chân.</li>
<li>Tăng Sức Bền, tăng Sức mạnh đôi chân.</li>
<li>Có thể tùy chỉnh kích thước bằng cách cắt bớt phần mũ để vừa vặn hơn.</li></ul>', 0, 0, N'Đang bán')
INSERT [dbo].[Product] ([ID], [Name], [ProducerID], [CategoryID], [Price], [IMG], [Quantity], [Description], [TopHot], [NewProduct], [Active]) VALUES (40, N'Ba lo cầu lông Forza', 5, 4, 480000, N'/Data/images/Forza-Balo.jpg', 30, N'<ul><li>Chất liệu : polyester mềm mại rất dễ sử dụng, bề ngoài được</li>
<li>thiết kế cứng giữ dáng sản phẩm.</li>
<li>Bên trong được thiết kế lớp vải bọc chống ướt, phủ bạc cực chắc chắn</li>
<li>và sạch sẽ, khử mùi.</li>
<li>Balo có 3 ngăn và có ngăn để giày giêng biệt rất thuận tiện cho những</li>
<li>ai chơi cầu lông.</li>
<li>Quai có lớp đệm vai êm ái, điều chỉnh ngắn dài</li>
<li>Kích thước : 30x15x48cm.</li></ul>', 0, 0, N'Đang bán')
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Index [IX_AccountID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountID] ON [dbo].[Bill]
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillID] ON [dbo].[Bill_Details]
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[Bill_Details]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NewsTypeID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_NewsTypeID] ON [dbo].[News]
(
	[NewsTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryID] ON [dbo].[Product]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProducerID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProducerID] ON [dbo].[Product]
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 1/3/2019 10:17:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[Sale]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bill_dbo.Account_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_dbo.Bill_dbo.Account_AccountID]
GO
ALTER TABLE [dbo].[Bill_Details]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bill_Details_dbo.Bill_BillID] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill_Details] CHECK CONSTRAINT [FK_dbo.Bill_Details_dbo.Bill_BillID]
GO
ALTER TABLE [dbo].[Bill_Details]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bill_Details_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill_Details] CHECK CONSTRAINT [FK_dbo.Bill_Details_dbo.Product_ProductID]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_dbo.News_dbo.News_Type_NewsTypeID] FOREIGN KEY([NewsTypeID])
REFERENCES [dbo].[News_Type] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_dbo.News_dbo.News_Type_NewsTypeID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Category_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Category_CategoryID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Producer_ProducerID] FOREIGN KEY([ProducerID])
REFERENCES [dbo].[Producer] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Producer_ProducerID]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sale_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_dbo.Sale_dbo.Product_ProductID]
GO
USE [master]
GO
ALTER DATABASE [Badminton] SET  READ_WRITE 
GO
