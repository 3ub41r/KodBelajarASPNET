/****** Object:  Table [dbo].[PencapaianProgramExcel]    Script Date: 11/04/2017 21:50:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PencapaianProgramExcel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KodProgram] [varchar](500) NULL,
	[TarikhProgram] [varchar](500) NULL,
	[BilanganHari] [varchar](500) NULL,
	[Lulus] [varchar](500) NULL,
	[IdMuatNaikExcel] [int] NOT NULL,
	[Ralat] [varchar](500) NULL,
	[TarikhDiimpot] [datetime] NULL,
 CONSTRAINT [PK_PencapaianProgramExcel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PencapaianProgramExcel]  WITH CHECK ADD  CONSTRAINT [FK_PencapaianProgramExcel_MuatNaikExcel] FOREIGN KEY([IdMuatNaikExcel])
REFERENCES [dbo].[MuatNaikExcel] ([Id])
GO

ALTER TABLE [dbo].[PencapaianProgramExcel] CHECK CONSTRAINT [FK_PencapaianProgramExcel_MuatNaikExcel]
GO


