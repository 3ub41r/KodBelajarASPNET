/****** Object:  Table [dbo].[PencapaianProgram]    Script Date: 11/04/2017 21:50:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PencapaianProgram](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KodProgram] [varchar](50) NOT NULL,
	[TarikhProgram] [datetime] NULL,
	[BilanganHari] [int] NULL,
	[Lulus] [bit] NULL,
	[JenisKemasukan] [varchar](50) NULL,
	[Terhapus] [bit] NOT NULL,
 CONSTRAINT [PK_PencapaianProgram] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PencapaianProgram] ADD  CONSTRAINT [DF_PencapaianProgram_Terhapus]  DEFAULT ((0)) FOR [Terhapus]
GO


