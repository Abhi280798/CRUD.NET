USE [master]
GO
/****** Object:  Database [TechnicalAssignment]    Script Date: 05-12-2022 00:09:57 ******/
CREATE DATABASE [TechnicalAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechnicalAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TechnicalAssignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechnicalAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TechnicalAssignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechnicalAssignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechnicalAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechnicalAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechnicalAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechnicalAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TechnicalAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechnicalAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET RECOVERY FULL 
GO
ALTER DATABASE [TechnicalAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [TechnicalAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechnicalAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechnicalAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechnicalAssignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechnicalAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechnicalAssignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechnicalAssignment', N'ON'
GO
ALTER DATABASE [TechnicalAssignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [TechnicalAssignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TechnicalAssignment]
GO
/****** Object:  Table [dbo].[tbl_Designations]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Designations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employees]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[ContactNumber] [int] NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[DesignationID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD FOREIGN KEY([DesignationID])
REFERENCES [dbo].[tbl_Designations] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[_Sp_AddNewEmpDetails]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[_Sp_AddNewEmpDetails] 
	-- Add the parameters for the stored procedure here
   @FirstName varchar (max), 
   @LastName varchar (max), 
   @ContactNumber int, 
   @Email varchar (max), 
   @DesignationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	 Insert into tbl_Employees values(@FirstName,@LastName,@ContactNumber,@Email,@DesignationID) 
END


--EXEC _Sp_AddNewEmpDetails @FirstName = 'A',@LastName ='B',@ContactNumber = 123,@Email = 'ak2142818@gmail.com',@DesignationID = 1

--Select * From tbl_Employees
GO
/****** Object:  StoredProcedure [dbo].[_Sp_DeleteEmpById]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[_Sp_DeleteEmpById] 
	-- Add the parameters for the stored procedure here
 @EmpId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from tbl_Employees where Id=@EmpId  
END
GO
/****** Object:  StoredProcedure [dbo].[_Sp_GetDesigination]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[_Sp_GetDesigination] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM tbl_Designations
END
GO
/****** Object:  StoredProcedure [dbo].[_Sp_GetEmployees]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[_Sp_GetEmployees]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--SELECT * FROM tbl_Employees

SELECT E.ID, E.FirstName,E.LastName,E.ContactNumber,
E.Email,D.Designation
FROM tbl_Employees AS E
INNER JOIN tbl_Designations AS D
ON E.DesignationID = D.ID;
END
GO
/****** Object:  StoredProcedure [dbo].[_Sp_UpdateEmpDetails]    Script Date: 05-12-2022 00:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[_Sp_UpdateEmpDetails] 
	-- Add the parameters for the stored procedure here
	  @EmpId int,  
      @FirstName varchar (max),  
      @LastName varchar (max), 
	  @ContactNumber int, 
	  @Email varchar (max),
	  @DesignationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
   Update tbl_Employees   
   set FirstName = @FirstName,  
   LastName = @LastName,  
   ContactNumber = @ContactNumber,
   Email = @Email,
   DesignationID = @DesignationID
   where Id=@EmpId 
END
GO
USE [master]
GO
ALTER DATABASE [TechnicalAssignment] SET  READ_WRITE 
GO
