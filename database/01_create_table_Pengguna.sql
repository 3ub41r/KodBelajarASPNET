/****** Object:  Table [dbo].[Pengguna]    Script Date: 11/01/2017 22:59:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Pengguna](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nama] [varchar](100) NOT NULL,
	[Jawatan] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Katalaluan] [varchar](100) NULL,
	[NoStaf] [varchar](20) NULL,
 CONSTRAINT [PK_Pengguna] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


