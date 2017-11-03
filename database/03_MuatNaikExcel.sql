/****** Object:  Table [dbo].[MuatNaikExcel]    Script Date: 11/03/2017 17:43:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MuatNaikExcel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NamaAsal] [varchar](500) NULL,
	[NamaBaru] [varchar](500) NULL,
	[TarikhMuatNaik] [datetime] NULL,
	[Lokasi] [varchar](500) NULL,
	[TelahImpot] [bit] NULL,
 CONSTRAINT [PK_MuatNaikExcel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[MuatNaikExcel] ADD  CONSTRAINT [DF_MuatNaikExcel_TelahImpot]  DEFAULT ((0)) FOR [TelahImpot]
GO


