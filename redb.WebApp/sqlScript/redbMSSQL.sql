USE [redb]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetChildObjects]    Script Date: 19.01.2024 15:52:30 ******/
DROP PROCEDURE [dbo].[sp_GetChildObjects]
GO
ALTER TABLE [dbo].[_permissions] DROP CONSTRAINT [CK__permissions_users_roles]
GO
ALTER TABLE [dbo].[_links] DROP CONSTRAINT [CK__links]
GO
ALTER TABLE [dbo].[_values] DROP CONSTRAINT [FK__values__structures]
GO
ALTER TABLE [dbo].[_values] DROP CONSTRAINT [FK__values__objects]
GO
ALTER TABLE [dbo].[_users_roles] DROP CONSTRAINT [FK__users_roles__users]
GO
ALTER TABLE [dbo].[_users_roles] DROP CONSTRAINT [FK__users_roles__roles]
GO
ALTER TABLE [dbo].[_structures] DROP CONSTRAINT [FK__structures__types]
GO
ALTER TABLE [dbo].[_structures] DROP CONSTRAINT [FK__structures__structures]
GO
ALTER TABLE [dbo].[_structures] DROP CONSTRAINT [FK__structures__schemes]
GO
ALTER TABLE [dbo].[_structures] DROP CONSTRAINT [FK__structures__lists]
GO
ALTER TABLE [dbo].[_schemes] DROP CONSTRAINT [FK__schemes__schemes]
GO
ALTER TABLE [dbo].[_permissions] DROP CONSTRAINT [FK__permissions__users]
GO
ALTER TABLE [dbo].[_permissions] DROP CONSTRAINT [FK__permissions__roles]
GO
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [FK__objects__users2]
GO
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [FK__objects__users1]
GO
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [FK__objects__schemes]
GO
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [FK__objects__objects]
GO
ALTER TABLE [dbo].[_list_items] DROP CONSTRAINT [FK__list_items__lists]
GO
ALTER TABLE [dbo].[_list_items] DROP CONSTRAINT [FK__list_items__id_objects]
GO
ALTER TABLE [dbo].[_functions] DROP CONSTRAINT [FK__functions__schemes]
GO
ALTER TABLE [dbo].[_availabilities] DROP CONSTRAINT [FK__availabilities__schemes_2]
GO
ALTER TABLE [dbo].[_availabilities] DROP CONSTRAINT [FK__availabilities__schemes_1]
GO
ALTER TABLE [dbo].[_users] DROP CONSTRAINT [DF__users__enabled]
GO
ALTER TABLE [dbo].[_users] DROP CONSTRAINT [DF__users__date_register]
GO
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [DF__objects__date_modify]
GO
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [DF__objects__date_create]
GO
/****** Object:  Index [IX_values_String]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX_values_String] ON [dbo].[_values]
GO
/****** Object:  Index [IX_values_Long]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX_values_Long] ON [dbo].[_values]
GO
/****** Object:  Index [IX_values_Guid]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX_values_Guid] ON [dbo].[_values]
GO
/****** Object:  Index [IX_values_Double]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX_values_Double] ON [dbo].[_values]
GO
/****** Object:  Index [IX_values_DateTime]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX_values_DateTime] ON [dbo].[_values]
GO
/****** Object:  Index [IX_values_Boolean]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX_values_Boolean] ON [dbo].[_values]
GO
/****** Object:  Index [IX__values_SO]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__values_SO] ON [dbo].[_values]
GO
/****** Object:  Index [PK__values]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_values] DROP CONSTRAINT [PK__values]
GO
/****** Object:  Index [IX__users_roles]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__users_roles] ON [dbo].[_users_roles]
GO
/****** Object:  Index [IX__users]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__users] ON [dbo].[_users]
GO
/****** Object:  Index [IX__types]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__types] ON [dbo].[_types]
GO
/****** Object:  Index [IX__structures]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__structures] ON [dbo].[_structures]
GO
/****** Object:  Index [PK__structure]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_structures] DROP CONSTRAINT [PK__structure]
GO
/****** Object:  Index [IX__schemes]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__schemes] ON [dbo].[_schemes]
GO
/****** Object:  Index [IX__roles]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__roles] ON [dbo].[_roles]
GO
/****** Object:  Index [PK__roles]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_roles] DROP CONSTRAINT [PK__roles]
GO
/****** Object:  Index [IX__permissions]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__permissions] ON [dbo].[_permissions]
GO
/****** Object:  Index [IX__objects_7]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_7] ON [dbo].[_objects]
GO
/****** Object:  Index [IX__objects_6]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_6] ON [dbo].[_objects]
GO
/****** Object:  Index [IX__objects_5]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_5] ON [dbo].[_objects]
GO
/****** Object:  Index [IX__objects_4]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_4] ON [dbo].[_objects]
GO
/****** Object:  Index [IX__objects_3]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_3] ON [dbo].[_objects]
GO
/****** Object:  Index [IX__objects_2]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_2] ON [dbo].[_objects]
GO
/****** Object:  Index [IX__objects_1]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__objects_1] ON [dbo].[_objects]
GO
/****** Object:  Index [PK__objects]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_objects] DROP CONSTRAINT [PK__objects]
GO
/****** Object:  Index [PK__lists]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_lists] DROP CONSTRAINT [PK__lists]
GO
/****** Object:  Index [PK__list_items]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_list_items] DROP CONSTRAINT [PK__list_items]
GO
/****** Object:  Index [IX__links]    Script Date: 19.01.2024 15:52:30 ******/
DROP INDEX [IX__links] ON [dbo].[_links]
GO
/****** Object:  Index [PK__functions]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_functions] DROP CONSTRAINT [PK__functions]
GO
/****** Object:  Index [IX__availabilities]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_availabilities] DROP CONSTRAINT [IX__availabilities]
GO
/****** Object:  Table [dbo].[_values]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_values]') AND type in (N'U'))
DROP TABLE [dbo].[_values]
GO
/****** Object:  Table [dbo].[_users_roles]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_users_roles]') AND type in (N'U'))
DROP TABLE [dbo].[_users_roles]
GO
/****** Object:  Table [dbo].[_users]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_users]') AND type in (N'U'))
DROP TABLE [dbo].[_users]
GO
/****** Object:  Table [dbo].[_types]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_types]') AND type in (N'U'))
DROP TABLE [dbo].[_types]
GO
/****** Object:  Table [dbo].[_structures]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_structures]') AND type in (N'U'))
DROP TABLE [dbo].[_structures]
GO
/****** Object:  Table [dbo].[_schemes]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_schemes]') AND type in (N'U'))
DROP TABLE [dbo].[_schemes]
GO
/****** Object:  Table [dbo].[_roles]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_roles]') AND type in (N'U'))
DROP TABLE [dbo].[_roles]
GO
/****** Object:  Table [dbo].[_permissions]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_permissions]') AND type in (N'U'))
DROP TABLE [dbo].[_permissions]
GO
/****** Object:  Table [dbo].[_objects]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_objects]') AND type in (N'U'))
DROP TABLE [dbo].[_objects]
GO
/****** Object:  Table [dbo].[_lists]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_lists]') AND type in (N'U'))
DROP TABLE [dbo].[_lists]
GO
/****** Object:  Table [dbo].[_list_items]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_list_items]') AND type in (N'U'))
DROP TABLE [dbo].[_list_items]
GO
/****** Object:  Table [dbo].[_links]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_links]') AND type in (N'U'))
DROP TABLE [dbo].[_links]
GO
/****** Object:  Table [dbo].[_functions]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_functions]') AND type in (N'U'))
DROP TABLE [dbo].[_functions]
GO
/****** Object:  Table [dbo].[_deleted_objects]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_deleted_objects]') AND type in (N'U'))
DROP TABLE [dbo].[_deleted_objects]
GO
/****** Object:  Table [dbo].[_availabilities]    Script Date: 19.01.2024 15:52:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_availabilities]') AND type in (N'U'))
DROP TABLE [dbo].[_availabilities]
GO
/****** Object:  Table [dbo].[_availabilities]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_availabilities](
	[_id] [bigint] NOT NULL,
	[_id_scheme_1] [bigint] NULL,
	[_id_scheme_2] [bigint] NOT NULL,
 CONSTRAINT [PK__availabilities] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_deleted_objects]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_deleted_objects](
	[_id] [bigint] NOT NULL,
	[_id_parent] [bigint] NULL,
	[_id_scheme] [bigint] NOT NULL,
	[_id_owner] [bigint] NOT NULL,
	[_id_who_change] [bigint] NOT NULL,
	[_date_create] [datetime] NOT NULL,
	[_date_modify] [datetime] NOT NULL,
	[_date_begin] [datetime] NULL,
	[_date_complete] [datetime] NULL,
	[_key] [bigint] NULL,
	[_code_int] [int] NULL,
	[_code_string] [nvarchar](250) NULL,
	[_code_guid] [uniqueidentifier] NULL,
	[_name] [nvarchar](250) NULL,
	[_note] [nvarchar](1000) NULL,
	[_hash] [varbinary](32) NULL,
	[_values] [varbinary](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_functions]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_functions](
	[_id] [bigint] NOT NULL,
	[_id_scheme] [bigint] NOT NULL,
	[_language] [nvarchar](50) NOT NULL,
	[_name] [nvarchar](1000) NOT NULL,
	[_body] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_links]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_links](
	[_id] [bigint] NOT NULL,
	[_id_1] [bigint] NOT NULL,
	[_id_2] [bigint] NOT NULL,
 CONSTRAINT [PK__links] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_list_items]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_list_items](
	[_id] [bigint] NOT NULL,
	[_id_list] [bigint] NOT NULL,
	[_value] [nvarchar](250) NULL,
	[_id_object] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_lists]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_lists](
	[_id] [bigint] NOT NULL,
	[_name] [nvarchar](250) NOT NULL,
	[_alias] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_objects]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_objects](
	[_id] [bigint] NOT NULL,
	[_id_parent] [bigint] NULL,
	[_id_scheme] [bigint] NOT NULL,
	[_id_owner] [bigint] NOT NULL,
	[_id_who_change] [bigint] NOT NULL,
	[_date_create] [datetime] NOT NULL,
	[_date_modify] [datetime] NOT NULL,
	[_date_begin] [datetime] NULL,
	[_date_complete] [datetime] NULL,
	[_key] [bigint] NULL,
	[_code_int] [int] NULL,
	[_code_string] [nvarchar](250) NULL,
	[_code_guid] [uniqueidentifier] NULL,
	[_name] [nvarchar](250) NULL,
	[_note] [nvarchar](1000) NULL,
	[_hash] [varbinary](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_permissions]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_permissions](
	[_id] [bigint] NOT NULL,
	[_id_role] [bigint] NULL,
	[_id_user] [bigint] NULL,
	[_id_ref] [bigint] NOT NULL,
	[_select] [bit] NULL,
	[_insert] [bit] NULL,
	[_update] [bit] NULL,
	[_delete] [bit] NULL,
 CONSTRAINT [PK__object_permissions] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_roles]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_roles](
	[_id] [bigint] NOT NULL,
	[_name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_schemes]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_schemes](
	[_id] [bigint] NOT NULL,
	[_id_parent] [bigint] NULL,
	[_name] [nvarchar](250) NOT NULL,
	[_alias] [nvarchar](250) NULL,
	[_name_space] [nvarchar](1000) NULL,
 CONSTRAINT [PK__schemes] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_structures]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_structures](
	[_id] [bigint] NOT NULL,
	[_id_parent] [bigint] NULL,
	[_id_scheme] [bigint] NOT NULL,
	[_id_override] [bigint] NULL,
	[_id_type] [bigint] NOT NULL,
	[_id_list] [bigint] NULL,
	[_name] [nvarchar](250) NOT NULL,
	[_alias] [nvarchar](250) NULL,
	[_order] [int] NULL,
	[_readonly] [bit] NULL,
	[_allow_not_null] [bit] NULL,
	[_is_array] [bit] NULL,
	[_is_compress] [bit] NULL,
	[_store_null] [bit] NULL,
	[_default_value] [varbinary](max) NULL,
	[_default_editor] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_types]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_types](
	[_id] [bigint] NOT NULL,
	[_name] [nvarchar](250) NOT NULL,
	[_db_type] [nvarchar](250) NULL,
	[_type] [nvarchar](250) NULL,
 CONSTRAINT [PK__types] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_users]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_users](
	[_id] [bigint] NOT NULL,
	[_login] [nvarchar](250) NOT NULL,
	[_password] [nvarchar](max) NOT NULL,
	[_name] [nvarchar](250) NOT NULL,
	[_phone] [nvarchar](250) NULL,
	[_email] [nvarchar](250) NULL,
	[_date_register] [datetime] NOT NULL,
	[_date_dismiss] [datetime] NULL,
	[_enabled] [bit] NOT NULL,
 CONSTRAINT [PK__users] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_users_roles]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_users_roles](
	[_id] [bigint] NOT NULL,
	[_id_role] [bigint] NOT NULL,
	[_id_user] [bigint] NOT NULL,
 CONSTRAINT [PK__users_roles] PRIMARY KEY CLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_values]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_values](
	[_id] [bigint] NOT NULL,
	[_id_structure] [bigint] NOT NULL,
	[_id_object] [bigint] NOT NULL,
	[_String] [nvarchar](850) NULL,
	[_Long] [bigint] NULL,
	[_Guid] [uniqueidentifier] NULL,
	[_Double] [float] NULL,
	[_DateTime] [datetime] NULL,
	[_Boolean] [bit] NULL,
	[_ByteArray] [varbinary](max) NULL,
	[_Text] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[_roles] ([_id], [_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[_roles] ([_id], [_name]) VALUES (2, N'Debug')
GO
INSERT [dbo].[_roles] ([_id], [_name]) VALUES (3, N'Test')
GO
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775700, 'String', 'nvarchar(850)', 'string');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775701, 'ByteArray', 'bytearray', 'byte[]');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775702, 'Text', 'text', 'string');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775703, 'Object', 'bigint', '_RObject');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775704, 'Long', 'bigint', 'long');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775705, 'Guid', 'uuid', 'Guid');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775706, 'ListItem', 'bigint', '_RListItem');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775707, 'Double', 'double', 'double');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775708, 'DateTime', 'timestamp', 'DateTime');
INSERT INTO _types (_id, _name, _db_type, _type) VALUES (-9223372036854775709, 'Boolean', 'bit', 'boolean');
GO
INSERT [dbo].[_users] ([_id], [_login], [_password], [_name], [_phone], [_email], [_date_register], [_date_dismiss], [_enabled]) VALUES (-9223372036854775800, N'admin', N'', N'admin', NULL, NULL, CAST(N'2023-12-26T01:14:34.410' AS DateTime), NULL, 1)
GO
/****** Object:  Index [IX__availabilities]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_availabilities] ADD  CONSTRAINT [IX__availabilities] UNIQUE NONCLUSTERED 
(
	[_id_scheme_1] ASC,
	[_id_scheme_2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__functions]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_functions] ADD  CONSTRAINT [PK__functions] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__links]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__links] ON [dbo].[_links]
(
	[_id_1] ASC,
	[_id_2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__list_items]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_list_items] ADD  CONSTRAINT [PK__list_items] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__lists]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_lists] ADD  CONSTRAINT [PK__lists] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__objects]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_objects] ADD  CONSTRAINT [PK__objects] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__objects_1]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_1] ON [dbo].[_objects]
(
	[_date_create] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__objects_2]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_2] ON [dbo].[_objects]
(
	[_date_modify] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__objects_3]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_3] ON [dbo].[_objects]
(
	[_code_int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__objects_4]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_4] ON [dbo].[_objects]
(
	[_code_string] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__objects_5]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_5] ON [dbo].[_objects]
(
	[_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__objects_6]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_6] ON [dbo].[_objects]
(
	[_code_guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__objects_7]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX__objects_7] ON [dbo].[_objects]
(
	[_hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__permissions]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__permissions] ON [dbo].[_permissions]
(
	[_id_ref] ASC,
	[_select] ASC,
	[_insert] ASC,
	[_update] ASC,
	[_delete] ASC,
	[_id_role] ASC,
	[_id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__roles]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_roles] ADD  CONSTRAINT [PK__roles] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__roles]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__roles] ON [dbo].[_roles]
(
	[_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__schemes]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__schemes] ON [dbo].[_schemes]
(
	[_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__structure]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_structures] ADD  CONSTRAINT [PK__structure] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__structures]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__structures] ON [dbo].[_structures]
(
	[_id_scheme] ASC,
	[_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__types]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__types] ON [dbo].[_types]
(
	[_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX__users]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__users] ON [dbo].[_users]
(
	[_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__users_roles]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__users_roles] ON [dbo].[_users_roles]
(
	[_id_role] ASC,
	[_id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK__values]    Script Date: 19.01.2024 15:52:30 ******/
ALTER TABLE [dbo].[_values] ADD  CONSTRAINT [PK__values] PRIMARY KEY NONCLUSTERED 
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX__values_SO]    Script Date: 19.01.2024 15:52:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX__values_SO] ON [dbo].[_values]
(
	[_id_structure] ASC,
	[_id_object] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_values_Boolean]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_values_Boolean] ON [dbo].[_values]
(
	[_Boolean] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_values_DateTime]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_values_DateTime] ON [dbo].[_values]
(
	[_DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_values_Double]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_values_Double] ON [dbo].[_values]
(
	[_Double] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_values_Guid]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_values_Guid] ON [dbo].[_values]
(
	[_Guid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_values_Long]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_values_Long] ON [dbo].[_values]
(
	[_Long] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_values_String]    Script Date: 19.01.2024 15:52:30 ******/
CREATE NONCLUSTERED INDEX [IX_values_String] ON [dbo].[_values]
(
	[_String] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[_objects] ADD  CONSTRAINT [DF__objects__date_create]  DEFAULT (getdate()) FOR [_date_create]
GO
ALTER TABLE [dbo].[_objects] ADD  CONSTRAINT [DF__objects__date_modify]  DEFAULT (getdate()) FOR [_date_modify]
GO
ALTER TABLE [dbo].[_users] ADD  CONSTRAINT [DF__users__date_register]  DEFAULT (getdate()) FOR [_date_register]
GO
ALTER TABLE [dbo].[_users] ADD  CONSTRAINT [DF__users__enabled]  DEFAULT ((1)) FOR [_enabled]
GO
ALTER TABLE [dbo].[_availabilities]  WITH CHECK ADD  CONSTRAINT [FK__availabilities__schemes_1] FOREIGN KEY([_id_scheme_1])
REFERENCES [dbo].[_schemes] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_availabilities] CHECK CONSTRAINT [FK__availabilities__schemes_1]
GO
ALTER TABLE [dbo].[_availabilities]  WITH CHECK ADD  CONSTRAINT [FK__availabilities__schemes_2] FOREIGN KEY([_id_scheme_2])
REFERENCES [dbo].[_schemes] ([_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[_availabilities] CHECK CONSTRAINT [FK__availabilities__schemes_2]
GO
ALTER TABLE [dbo].[_functions]  WITH CHECK ADD  CONSTRAINT [FK__functions__schemes] FOREIGN KEY([_id_scheme])
REFERENCES [dbo].[_schemes] ([_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_functions] CHECK CONSTRAINT [FK__functions__schemes]
GO
ALTER TABLE [dbo].[_list_items]  WITH CHECK ADD  CONSTRAINT [FK__list_items__id_objects] FOREIGN KEY([_id_object])
REFERENCES [dbo].[_objects] ([_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[_list_items] CHECK CONSTRAINT [FK__list_items__id_objects]
GO
ALTER TABLE [dbo].[_list_items]  WITH CHECK ADD  CONSTRAINT [FK__list_items__lists] FOREIGN KEY([_id_list])
REFERENCES [dbo].[_lists] ([_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_list_items] CHECK CONSTRAINT [FK__list_items__lists]
GO
ALTER TABLE [dbo].[_objects]  WITH CHECK ADD  CONSTRAINT [FK__objects__objects] FOREIGN KEY([_id_parent])
REFERENCES [dbo].[_objects] ([_id])
GO
ALTER TABLE [dbo].[_objects] CHECK CONSTRAINT [FK__objects__objects]
GO
ALTER TABLE [dbo].[_objects]  WITH CHECK ADD  CONSTRAINT [FK__objects__schemes] FOREIGN KEY([_id_scheme])
REFERENCES [dbo].[_schemes] ([_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_objects] CHECK CONSTRAINT [FK__objects__schemes]
GO
ALTER TABLE [dbo].[_objects]  WITH CHECK ADD  CONSTRAINT [FK__objects__users1] FOREIGN KEY([_id_owner])
REFERENCES [dbo].[_users] ([_id])
GO
ALTER TABLE [dbo].[_objects] CHECK CONSTRAINT [FK__objects__users1]
GO
ALTER TABLE [dbo].[_objects]  WITH CHECK ADD  CONSTRAINT [FK__objects__users2] FOREIGN KEY([_id_who_change])
REFERENCES [dbo].[_users] ([_id])
GO
ALTER TABLE [dbo].[_objects] CHECK CONSTRAINT [FK__objects__users2]
GO
ALTER TABLE [dbo].[_permissions]  WITH CHECK ADD  CONSTRAINT [FK__permissions__roles] FOREIGN KEY([_id_user])
REFERENCES [dbo].[_roles] ([_id])
GO
ALTER TABLE [dbo].[_permissions] CHECK CONSTRAINT [FK__permissions__roles]
GO
ALTER TABLE [dbo].[_permissions]  WITH CHECK ADD  CONSTRAINT [FK__permissions__users] FOREIGN KEY([_id_user])
REFERENCES [dbo].[_users] ([_id])
GO
ALTER TABLE [dbo].[_permissions] CHECK CONSTRAINT [FK__permissions__users]
GO
ALTER TABLE [dbo].[_schemes]  WITH CHECK ADD  CONSTRAINT [FK__schemes__schemes] FOREIGN KEY([_id_parent])
REFERENCES [dbo].[_schemes] ([_id])
GO
ALTER TABLE [dbo].[_schemes] CHECK CONSTRAINT [FK__schemes__schemes]
GO
ALTER TABLE [dbo].[_structures]  WITH CHECK ADD  CONSTRAINT [FK__structures__lists] FOREIGN KEY([_id_list])
REFERENCES [dbo].[_lists] ([_id])
GO
ALTER TABLE [dbo].[_structures] CHECK CONSTRAINT [FK__structures__lists]
GO
ALTER TABLE [dbo].[_structures]  WITH CHECK ADD  CONSTRAINT [FK__structures__schemes] FOREIGN KEY([_id_scheme])
REFERENCES [dbo].[_schemes] ([_id])
GO
ALTER TABLE [dbo].[_structures] CHECK CONSTRAINT [FK__structures__schemes]
GO
ALTER TABLE [dbo].[_structures]  WITH CHECK ADD  CONSTRAINT [FK__structures__structures] FOREIGN KEY([_id_parent])
REFERENCES [dbo].[_structures] ([_id])
GO
ALTER TABLE [dbo].[_structures] CHECK CONSTRAINT [FK__structures__structures]
GO
ALTER TABLE [dbo].[_structures]  WITH NOCHECK ADD  CONSTRAINT [FK__structures__types] FOREIGN KEY([_id_type])
REFERENCES [dbo].[_types] ([_id])
GO
ALTER TABLE [dbo].[_structures] NOCHECK CONSTRAINT [FK__structures__types]
GO
ALTER TABLE [dbo].[_users_roles]  WITH CHECK ADD  CONSTRAINT [FK__users_roles__roles] FOREIGN KEY([_id_role])
REFERENCES [dbo].[_roles] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_users_roles] CHECK CONSTRAINT [FK__users_roles__roles]
GO
ALTER TABLE [dbo].[_users_roles]  WITH CHECK ADD  CONSTRAINT [FK__users_roles__users] FOREIGN KEY([_id_user])
REFERENCES [dbo].[_users] ([_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_users_roles] CHECK CONSTRAINT [FK__users_roles__users]
GO
ALTER TABLE [dbo].[_values]  WITH CHECK ADD  CONSTRAINT [FK__values__objects] FOREIGN KEY([_id_object])
REFERENCES [dbo].[_objects] ([_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_values] CHECK CONSTRAINT [FK__values__objects]
GO
ALTER TABLE [dbo].[_values]  WITH CHECK ADD  CONSTRAINT [FK__values__structures] FOREIGN KEY([_id_structure])
REFERENCES [dbo].[_structures] ([_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[_values] CHECK CONSTRAINT [FK__values__structures]
GO
ALTER TABLE [dbo].[_links]  WITH CHECK ADD  CONSTRAINT [CK__links] CHECK  (([_id_1]<>[_id_2]))
GO
ALTER TABLE [dbo].[_links] CHECK CONSTRAINT [CK__links]
GO
ALTER TABLE [dbo].[_permissions]  WITH CHECK ADD  CONSTRAINT [CK__permissions_users_roles] CHECK  (([_id_role] IS NOT NULL AND [_id_user] IS NULL OR [_id_role] IS NULL AND [_id_user] IS NOT NULL))
GO
ALTER TABLE [dbo].[_permissions] CHECK CONSTRAINT [CK__permissions_users_roles]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetChildObjects]    Script Date: 19.01.2024 15:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[sp_GetChildObjects]
  @id bigint
AS
BEGIN

    WITH  Nodes ([_id], [_id_parent], [Level]) 
    AS (
        SELECT  T._id, T._id_parent, 0 AS [Level]
        FROM    _objects T
        WHERE   T.[_id] = @id

        UNION ALL

        SELECT T._id, T._id_parent, N.[Level] + 1
        FROM    _objects T
                INNER JOIN Nodes N ON N.[_id] = T._id_parent
    )

    SELECT _id
    FROM    [_objects]
    WHERE   [_id] IN (
        SELECT  TOP 100 PERCENT N.[_id] 
        FROM    Nodes N
        ORDER BY N.[Level] DESC
    );

--with cte as (
--  select T.* from _objects as T
--    where T._id = @id
--  union all
--  select T.* from _objects as T
--    inner join cte as C on T._id_parent = C._Id
--)
--select * from cte

END
GO

/****** Object:  Sequence [dbo].[global_identity]    Script Date: 18.01.2024 14:37:50 ******/
DROP SEQUENCE [dbo].[global_identity]
GO

/****** Object:  Sequence [dbo].[global_identity]    Script Date: 18.01.2024 14:37:50 ******/
CREATE SEQUENCE [dbo].[global_identity] 
 AS [bigint]
 START WITH -9223372036854769999
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 NO CACHE 
GO
