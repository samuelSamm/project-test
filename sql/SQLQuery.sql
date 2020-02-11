-- np:\\.\pipe\LOCALDB#9E38BD42\tsql\query
create database master_all 
go 
use master_all
go
create table dbo.users(
	idUser int IDENTITY(1,1) NOT NULL,
	name varchar(50) NOT NULL,
	pass varchar(100) NOT NULL,
	age int NOT NULL,
	createdDate date NOT NULL,
	estatus char(1) NOT NULL,
	PRIMARY KEY (idUser) 
)
go
/*crear la tabla Catalogo de perfiles*/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[jf_cat_profile](
	[id_profile] [bigint] IDENTITY(1,1) NOT NULL,
	[description_profile] [varchar](30) NOT NULL,
	[code_profile] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_profile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/*crear tabla de relacion perfiles y usuarios*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jf_rel_user_profile](
	[id_rel_user_profile] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[profile_id] [bigint] NOT NULL,
 CONSTRAINT [PK_jf__rel_user_profile] PRIMARY KEY CLUSTERED 
(
	[id_rel_user_profile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[jf_rel_user_profile]  WITH CHECK ADD  CONSTRAINT [FK_jf_rel_user_profile_jf_cat_profile] FOREIGN KEY([profile_id])
REFERENCES [dbo].[jf_cat_profile] ([id_profile])
GO

ALTER TABLE [dbo].[jf_rel_user_profile] CHECK CONSTRAINT [FK_jf_rel_user_profile_jf_cat_profile]
GO

ALTER TABLE [dbo].[jf_rel_user_profile]  WITH CHECK ADD  CONSTRAINT [FK_jf_rel_user_profile_jf_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([idUser])
GO

ALTER TABLE [dbo].[jf_rel_user_profile] CHECK CONSTRAINT [FK_jf_rel_user_profile_jf_user]
GO
/****** Object:  Table [dbo].[jf_persistent_logins]    Script Date: 11/02/2020 02:30:36 a.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[jf_persistent_logins](
	[id_persistent_login] [bigint] NOT NULL,
	[username] [varchar](64) NOT NULL,
	[series] [varchar](64) NOT NULL,
	[token] [varchar](64) NOT NULL,
	[last_used] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_persistent_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/*INSERTS NECESARIOS*/
select * from users
INSERT INTO USERS (name, pass, age, createdDate, estatus) VALUES('demo', 'demo', 18, getDate(), 1)
select * from jf_cat_profile
INSERT INTO jf_cat_profile (description_profile, code_profile) VALUES ('ADMIN','PROADMIN')
INSERT INTO jf_cat_profile (description_profile, code_profile) VALUES ('JF_USER','PROJFUSER')
select * from jf_rel_user_profile
INSERT INTO jf_rel_user_profile (user_id, profile_id) VALUES (1,1)