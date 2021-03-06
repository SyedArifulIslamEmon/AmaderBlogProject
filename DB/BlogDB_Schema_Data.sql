USE [master]
GO
/****** Object:  Database [BlogDB]    Script Date: 20/02/2015 09:41:44 ******/
CREATE DATABASE [BlogDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogDB', FILENAME = N'D:\FTFL Projects\Project # 2\ProjectBlog\DB\BlogDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogDB_log', FILENAME = N'D:\FTFL Projects\Project # 2\ProjectBlog\DB\BlogDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BlogDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BlogDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BlogDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BlogDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogDB] SET  MULTI_USER 
GO
ALTER DATABASE [BlogDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BlogDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 20/02/2015 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 20/02/2015 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](1000) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 20/02/2015 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[NoOfView] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/02/2015 09:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201502190934435_version01', N'ProjectBlog.Migrations.Configuration', 0x1F8B0800000000000400D55BDB6EE336107D2FD07F10F4D41659CBC9628136B07791384961ECE68238BBE8DB829168872D45B922954D50F4CBFAD04FEA2F74A8BB48EAE66B82BC28246738371E0E39F47FFFFC3BFAF0E453EB11879C046C6C1F0E86B685991B78842DC67624E66F7EB63FBCFFFEBBD1B9E73F595FB2716FE538A0647C6C3F08B13C761CEE3E601FF1814FDC30E0C15C0CDCC07790173847C3E12FCEE1A18381850DBC2C6B741B31417C1CFF03FF4E02E6E2A58810BD0C3C4C79DA0E3DB398AB75857CCC97C8C563FB260C7EC7AE38A5C162908CB6AD134A104832C3746E5B88B1402001721E7FE67826C2802D664B6840F4EE798961DC1C518E53F98F8BE15D55191E49559C823063E5465C047E4F86876F53DB382AF94A16B673DB81F5CEC1CAE2596A1D5B706C4F02DFC74CD8963AD7F18486729CC9BE8394EAC02AF51DE4C1003123FF0EAC49444514E231C391081185E1D13D25EE47FC7C17FC81D998459496C50301A1AFD2004D30C71287E2F916CFAB424FCF6CCBA9923B2A7D4EAD9326DA4D99787B645B57200ABAA7388F859225662208F1AF98E11009ECDD20217008AE9C7A38B6A62684362513B189930921FE6029D9D6257AFA84D9423CC0221B0E61F55C9027EC654DA9149F1981A50754228CB041CAB6996365CF40EC6C76F97D070BAD372F583961BBD59A79DC04BC83E59B794CF919A618FC90B1390D028A116B6774851EC922F6A8412CDBBAC534EEE40F649920C740767C4D8D08A0721106FE6D40538ABCE3EB1D0A1758FA3730F5CE8228747B48230D6D94467618A5A97468D2547B4DD28C9C02161AC12231542FA49024FB82892CDCFA6244B730DD1C40DC114171033CBCDB163AB4E1127C6E6362695FECBD18549AF238DEF8C30A98A2B0BA0AAEE75F08FED653A05A2C2856FBEAE894AD78333A6568B1197492BC75688A5BCDB89474AD054A8944BD404992EC0B94B288ED0B4ADD227D73A024E7935F8DB8B40D7438F711A1CDC9D256D030C46853A8748338FF1684DEF66DB71A7274CC2454E430E7197DB2AC06719AA0C328481555BA40C709E7814BE2D94B321586A82A72CE3CAB114F13D766480CDE05C4204BC008981AC2D456B1E09A2599AB75E22667C109E22EF274A782F85E3759724C2D64C90F7455717ED2660148C2A1C402442113E0007284091DBF0873C912D1265328443D7231A96C3E85DA7386979849B46A527DBDB9F3291407B4D966E49462A939C4AA6BADCEAD350BAF706BB2CBED24C46A8E13BB0A31A329BAB8D9BCB3F60A31A3EAEBCDBDAB104BF0B3D1A70A98EE2FB89484B01948371956150BEC32A62A1ABFB0804A364B791A040A1C66A05964C767A786FC1A044C536C9E262BAACB25D719165A42526CCE2A9E38CD2CD21441A34FA2A685581AD4449CC4BE425CB25475FA52D6541A633C90A98E6BCB277281734535DFB7A5012516859CEAE2ACEAD6416F255BD4F56ED8E23A6C7225A1531F35E86DDE9BB6A877EA8A1AA50DA0DB06BBFDD5ADA2655B9834289AE5C5F9522FAA2A4E5256C9CA2F4E4DFD657489964B38CA94EA31698B354B8A319337B3FE550A3FE1E1B8DC50ACC8A5CD6782832D5A60A557BADEC31724E4F2BE1BDD23795A9A78BE36AC0A6C35A091CDA56097EEA90C4D3202F9AD01A85236316C0029F905282647C43A623DAC75CAB82286280AEBEB1C9380463E6BA99C34F34A2F0AAB9CD2C63E7C4AE50883544947777ED91E596655B76FD673C94E07652E7527867A2EA5B2449951A959E7357214B76B7BBD165F5AA2558DD74ED15C075ABD4239DE73FBC7B1996CBBAE49AFD7CB4CD2A6DD2F81F2D5B7AA55D6BEEB0550B9FFAE066FA9A33BBFE212BCCCAC687D310B21D97FD75C0871FED87F2198C9B6EBE8E24A57E593B476E794DED196D9A44D3D9654F9C2B5B2ACCA1D3D96567EE95A595879EB8EC34E4BB6D421F9EC79D2A52457A334D1697F01A3653EC9105B96381E8927B39ED933008C3F900306B33FE9849218B9B20197889139E622A96DD847C3C323E511CDCB79D0E270EED16EAF5A56A8CF6CF26D0991266EADC3AC57B6658F28741F50687850B2FE6B110FBEC5FA7559627C6034651E7E1ADB7FC524C7D6F4B7AF09D581751D42481E5B43EBEF359F98749D38A15A6B62ED5DCA3D112D4CFABDBB58219637F300622B515C79F3608CE1772B85B0716DFCE0A3A71F37F04CE1F52D07C3DB86F6B8D4D9A8EF1A620D3613DB7A22B4CB3AFA56625B2D9DD784F77A95F13ADCDF44E17BE538570BDFAB69BE8DFAEDBEEAB5F9DDF64E4BB4BB2AC9D65F68BDDA2AECBE0A63BB0F949A93EB568A607D02E535D452F715259DA0EC15C64767D0DA7B5D54AF32D4DC35A93FB0A82F7B26A775D876EF03F06DB22DD6D6B14C45D1DA9AA889B3B96A642A97D6564B4D6C8DC5AC1D1452B58A5863414DF146A5B6F2C22AA55AA970DF8AAD5F0AEDA75227EF6EA6DCA9DFB4016E947E910678C5C9A260217F9FC6B05B418C7CCC94CD830CB81489B2214ADA7C8905829C1B9D8482CC912BA0DBC59CC76F46BF201AC5B9FF3DF6A6EC3A12CB4880CAD8BFA79537BC12009BE68F6BBA559947D7CBF825E626540031893C365CB3D388502F97FBC290DED7B090C89A9EC2A42F853C8D2D9E734E5701EBC828355FBE21DC617F498119BF6633F48857910D82F5135E20F739BB30AD67D2EE88AAD94767042D42E4F39447410FFF420C7BFED3FBFF0155AFE9BF98390000, N'6.1.2-31219')
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (1, N'Well written :)', CAST(0x0000A444016C0C5E AS DateTime), 1, 9, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (2, N'Essential article', CAST(0x0000A444016C9154 AS DateTime), 1, 7, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (3, N'Good initiative by government.', CAST(0x0000A4440172F25C AS DateTime), 3, 13, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (4, N'Great', CAST(0x0000A44401735DED AS DateTime), 4, 13, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (5, N'This framework is very useful', CAST(0x0000A44401739D80 AS DateTime), 4, 6, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (6, N'Front-end development is impossible without JavaScript', CAST(0x0000A4440173F506 AS DateTime), 4, 2, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (7, N'#ILoveCSharp #ILoveWindows', CAST(0x0000A44401746D67 AS DateTime), 2, 1, 0)
INSERT [dbo].[Comments] ([CommentID], [Content], [CommentDate], [UserID], [PostID], [IsDeleted]) VALUES (8, N'Heard about this program. Need to know Details. Where should I contact?', CAST(0x0000A4440174B583 AS DateTime), 1, 13, 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (1, N'C Sharp (programming language)', N'<p>
	This article is about a programming language. For other uses, see C-sharp (disambiguation).The correct title of this article is <strong>C# (programming language)</strong>. The substitution or omission of the # is because of technical restrictions.</p>
<p>
	<strong>C#</strong>(pronounced as <em>see sharp</em>) is a multi-paradigm programming language encompassing strong typing, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines. It was developed by Microsoft within its .NET initiative and later approved as a standard by Ecma (ECMA-334) and ISO (ISO/IEC 23270:2006). C# is one of the programming languages designed for the Common Language Infrastructure.</p>
<p>
	C# is intended to be a simple, modern, general-purpose, object-oriented programming language. Its development team is led by Anders Hejlsberg. The most recent version is C# 5.0, which was released on August 15, 2012.</p>
', CAST(0x0000A4440103376E AS DateTime), 1, 1, 2)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (2, N'JavaScript', N'<p>
	<strong>JavaScript</strong> is a dynamic computer programming language. It is most commonly used as part of web browsers, whose implementations allow client-side scripts to interact with the user, control the browser, communicate asynchronously, and alter the document content that is displayed.</p>
<p>
	It is also used in server-side network programming with runtime environments such as Node.js, game development and the creation of desktop and mobile applications. With the rise of the single-page web app and JavaScript-heavy sites, it is increasingly being used as a compile target for source-to-source compilers from both dynamic languages and static languages.</p>
<p>
	In particular, Emscripten and highly optimized JIT compilers, in tandem with asm.js which is friendly to AOT compilers like Odin Monkey, have enabled C and C++ programs to be compiled into JavaScript and execute at near-native speeds, making JavaScript be considered the "assembly language of the web", according to its creator and others.</p>
', CAST(0x0000A44401086767 AS DateTime), 1, 1, 3)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (3, N'HTML5', N'<p>
	<strong>HTML5</strong> is a core technology markup language of the Internet used for structuring and presenting content for the World Wide Web. As of October 2014 this is the final and complete fifth revision of the HTML standard of the World Wide Web Consortium (W3C). The previous version, HTML 4, was standardized in 1997.</p>
<p>
	Its core aims have been to improve the language with support for the latest multimedia while keeping it easily readable by humans and consistently understood by computers and devices (web browsers, parsers, etc.). HTML5 is intended to subsume not only HTML 4, but also XHTML 1 and DOM Level 2 HTML.</p>
', CAST(0x0000A444010909E9 AS DateTime), 2, 1, 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (4, N'Cascading Style Sheets', N'<p>
	<strong>Cascading Style Sheets</strong> (<strong>CSS</strong>) is a style sheet language used for describing the look and formatting of a document written in a markup language. While most often used to change the style of web pages and user interfaces written in HTML and XHTML, the language can be applied to any kind of XML document, including plain XML, SVG and XUL. Along with HTML and JavaScript, CSS is a cornerstone technology used by most websites to create visually engaging webpages, user interfaces for web applications, and user interfaces for many mobile applications.</p>
<p>
	The CSS specification describes a priority scheme to determine which style rules apply if more than one rule matches against a particular element. In this so-called <em>cascade</em>, priorities or <em>weights</em> are calculated and assigned to rules, so that the results are predictable.</p>
', CAST(0x0000A44401093A67 AS DateTime), 2, 1, 2)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (5, N'Model–View–Controller', N'<p>
	<strong>Model–view–controller</strong> (<strong>MVC</strong>) is a software architectural pattern for implementing user interfaces. It divides a given software application into three interconnected parts, so as to separate internal representations of information from the ways that information is presented to or accepted from the user.</p>
<p>
	As with other software patterns, MVC expresses the "core of the solution" to a problem while allowing it to be adapted for each system. Particular MVC architectures can vary significantly from the traditional description here.</p>
', CAST(0x0000A44401098ADF AS DateTime), 3, 1, 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (6, N'ASP.NET', N'<p>
	<strong>ASP.NET</strong> is an open source server-side Web application framework designed for Web development to produce dynamic Web pages. It was developed by Microsoft to allow programmers to build dynamic web sites, web applications and web services.</p>
<p>
	It was first released in January 2002 with version 1.0 of the .NET Framework, and is the successor to Microsoft''s Active Server Pages (ASP) technology. ASP.NET is built on the Common Language Runtime (CLR), allowing programmers to write ASP.NET code using any supported .NET language. The ASP.NET SOAP extension framework allows ASP.NET components to process SOAP messages.</p>
', CAST(0x0000A4440109A274 AS DateTime), 3, 1, 1)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (7, N'AngularJS', N'<p>
	<strong>AngularJS</strong>, commonly referred to as <strong>Angular</strong>, is an <a href="http://en.wikipedia.org/wiki/Open-source_software" title="Open-source software">open-source</a> web application framework maintained by Google and a community of individual developers and corporations to address many of the challenges encountered in developing single-page applications. Its goal is to simplify both development and testing of such applications by providing a framework for client-side model–view–controller (MVC) architecture, along with components commonly used in rich internet applications.</p>
<p>
	The library works by first reading the HTML page, which has embedded into it additional custom tag attributes. Those attributes are interpreted as directives telling Angular to bind input or output parts of the page to a model that is represented by standard JavaScript variables. The values of those JavaScript variables can be manually set within the code, or retrieved from static or dynamic JSON resources.</p>
', CAST(0x0000A4440109EDD3 AS DateTime), 4, 1, 4)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (8, N'jQuery', N'<p>
	<strong>jQuery</strong> is a cross-platform JavaScript library designed to simplify the client-side scripting of HTML.Used by over 60% of the 10,000 most visited websites, jQuery is the most popular JavaScript library in use today. jQuery is free, open-source software licensed under the MIT License.</p>
<p>
	jQuery''s syntax is designed to make it easier to navigate a document, select DOM elements, create animations, handle events, and develop Ajax applications. jQuery also provides capabilities for developers to create plug-ins on top of the JavaScript library. This enables developers to create abstractions for low-level interaction and animation, advanced effects and high-level, theme-able widgets. The modular approach to the jQuery library allows the creation of powerful dynamic web pages and web applications.</p>
', CAST(0x0000A444010A053D AS DateTime), 4, 1, 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (9, N'Ajax (programming)', N'<p>
	Ajax (also AJAX; short for asynchronous <strong>JavaScript</strong> and <strong>XML</strong>) is a group of interrelated Web development techniques used on the client-side to create asynchronous Web applications. With Ajax, web applications can send data to and retrieve from a server asynchronously (in the background) without interfering with the display and behavior of the existing page. Data can be retrieved using the <code>XMLHttpRequest</code> object. Despite the name, the use of XML is not required (JSON is often used in the AJAJ variant), and the requests do not need to be asynchronous.</p>
<p>
	Ajax is not a single technology, but a group of technologies. HTML and CSS can be used in combination to mark up and style information. The DOM is accessed with JavaScript to dynamically display – and allow the user to interact with – the information presented. JavaScript and the XMLHttpRequest object provide a method for exchanging data asynchronously between browser and server to avoid full page reloads.</p>
', CAST(0x0000A444016AE731 AS DateTime), 2, 1, 6)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (10, N'SQL', N'<p>
	<strong>SQL</strong> <strong>Structured Query Language </strong>is a special-purpose programming language designed for managing data held in a relational database management system (RDBMS), or for stream processing in a relational data stream management system (RDSMS).</p>
<p>
	Originally based upon relational algebra and tuple relational calculus, SQL consists of a data definition language and a data manipulation language. The scope of SQL includes data insert, query, update and delete, schema creation and modification, and data access control. Although SQL is often described as, and to a great extent is, a declarative language (4GL), it also includes procedural elements.</p>
', CAST(0x0000A44401182E74 AS DateTime), 4, 0, 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (11, N'Java (programming language)', N'<p>
	<strong>Java</strong> is a general-purpose computer programming language that is concurrent, class-based, object-oriented, and specifically designed to have as few implementation dependencies as possible. It is intended to let application developers "write once, run anywhere" (WORA), meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.</p>
<p>
	The original and reference implementation Java compilers, virtual machines, and class libraries were originally released by Sun under proprietary licences. As of May 2007, in compliance with the specifications of the Java Community Process, Sun relicensed most of its Java technologies under the GNU General Public License. Others have also developed alternative implementations of these Sun technologies, such as the GNU Compiler for Java (bytecode compiler), GNU Classpath (standard libraries), and IcedTea-Web (browser plugin for applets).</p>
', CAST(0x0000A44401186857 AS DateTime), 3, 0, 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (12, N'PHP', N'<p>
	<strong>PHP</strong> is a server-side scripting language designed for web development but also used as a general-purpose programming language. As of January 2013, PHP was installed on more than 240 million websites (39% of those sampled) and 2.1 million web servers. Originally created by Rasmus Lerdorf in 1994, the reference implementation of PHP (powered by the Zend Engine) is now produced by The PHP Group. While PHP originally stood for <em>Personal Home Page</em>, it now stands for <em>PHP: Hypertext Preprocessor</em>, which is a recursive backronym.</p>
<p>
	The canonical PHP interpreter, powered by the Zend Engine, is free software released under the PHP License. PHP has been widely ported and can be deployed on most web servers on almost every operating system and platform, free of charge.</p>
', CAST(0x0000A4440118AFA8 AS DateTime), 1, 0, 0)
INSERT [dbo].[Posts] ([PostID], [Title], [Content], [PostedDate], [UserID], [IsPublished], [NoOfView]) VALUES (13, N'Looking for a career path in IT/ITES Industry of Bangladesh? Want to be a Future Leader of IT World?', N'<p>
	The initiative of LICT is part of the government''s plan to create 30,000 direct and 120,000 indirect jobs in the IT and ITES companies under LICT Project in which the World Bank is providing US$ 70 million credit for implementing the Leveraging ICT for growth, Employment and Governance project (LICT) of Bangladesh Computer Council (BCC) under the ICT Division of Posts, Telecommunication and IT Ministry.<br />
	<br />
	The LICT has good package of incentives for the trainees and the IT and ITES companies against the training and recruitment to be made by them of the FTFL trainees.<br />
	<br />
	The LICT in collaboration with IT and ITES industries will select the trainees for FTFL as per skills demand, especially in the areas of software development, business process outsourcing (BPO) and IT/ITES related management<br />
	<br />
	The LICT will train them according to companies need and after completion of six-months training the trainees will be absorbed by the companies as FTFL.<br />
	<br />
	FTFL would be brought under international certification by holding examination and their activities will be monitored online by the LICT project for a certain period of time.<br />
	<br />
	Initially the program will be launched for building 840 educated youths as FTFL and befitting to the skills demand of IT and ITES companies by December this year. Out of 840 initial FTFL</p>
<ol>
	<li>
		240 will be selected for software development (IT)</li>
	<li>
		200 for BPO (ITES)</li>
	<li>
		200 for IT/ITES related management</li>
	<li>
		200 for ITSS (IT Sales & Support)</li>
</ol>
<p>
	<br />
	Leading IT experts of IT and ITES companies will conduct the training. LICT project authorities have already asked the Bangladesh Association of Software Information and Services (BASIS), a platform of the country''s IT and ITES companies, to send the list of manpower required for IT and ITES companies.</p>
', CAST(0x0000A4450099C80E AS DateTime), 2, 1, 6)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Email], [CreatedDate], [Password]) VALUES (1, N'shawon', N'shawon@yahoo.com', CAST(0x0000A44401012347 AS DateTime), N'01710502380')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [CreatedDate], [Password]) VALUES (2, N'msd.unknown', N'msd@mail.com', CAST(0x0000A4440108D114 AS DateTime), N'01617962783')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [CreatedDate], [Password]) VALUES (3, N'ratna', N'ratna@yahoo.com', CAST(0x0000A44401096630 AS DateTime), N'01712415275')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [CreatedDate], [Password]) VALUES (4, N'bristy', N'bristy@yahoo.com', CAST(0x0000A4440109CE55 AS DateTime), N'01625294021')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_PostID]    Script Date: 20/02/2015 09:41:44 ******/
CREATE NONCLUSTERED INDEX [IX_PostID] ON [dbo].[Comments]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 20/02/2015 09:41:44 ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[Comments]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserID]    Script Date: 20/02/2015 09:41:44 ******/
CREATE NONCLUSTERED INDEX [IX_UserID] ON [dbo].[Posts]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Posts_PostID] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Posts_PostID]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.Users_UserID]
GO
USE [master]
GO
ALTER DATABASE [BlogDB] SET  READ_WRITE 
GO
