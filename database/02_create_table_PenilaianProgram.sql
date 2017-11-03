/****** Object:  Table [dbo].[PencapaianProgram]    Script Date: 11/03/2017 09:23:02 ******/
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
	[IdPengguna] [int] NULL,
 CONSTRAINT [PK_PencapaianProgram] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PencapaianProgram]  WITH CHECK ADD  CONSTRAINT [FK_PencapaianProgram_Pengguna] FOREIGN KEY([IdPengguna])
REFERENCES [dbo].[Pengguna] ([Id])
GO

ALTER TABLE [dbo].[PencapaianProgram] CHECK CONSTRAINT [FK_PencapaianProgram_Pengguna]
GO

ALTER TABLE [dbo].[PencapaianProgram] ADD  CONSTRAINT [DF_PencapaianProgram_Terhapus]  DEFAULT ((0)) FOR [Terhapus]
GO


