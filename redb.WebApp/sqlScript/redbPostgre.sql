DROP SEQUENCE IF EXISTS global_identity;
DROP TABLE IF EXISTS _deleted_objects;
DROP TABLE IF EXISTS _availabilities;
DROP TABLE IF EXISTS _values;
DROP TABLE IF EXISTS _permissions;
DROP TABLE IF EXISTS _structures;
DROP TABLE IF EXISTS _users_roles;
DROP TABLE IF EXISTS _roles;
DROP TABLE IF EXISTS _list_items;
DROP TABLE IF EXISTS _lists;
DROP TABLE IF EXISTS _objects;
DROP TABLE IF EXISTS _links;
DROP TABLE IF EXISTS _users;
DROP TABLE IF EXISTS _functions;
DROP TABLE IF EXISTS _schemes;
DROP TABLE IF EXISTS _types;

CREATE TABLE _types(
	_id bigint NOT NULL,
	_name varchar(250) NOT NULL,
	_db_type varchar(250) NULL,
	_type varchar(250) NULL,
    CONSTRAINT PK__types PRIMARY KEY (_id)
);

CREATE TABLE _links(
	_id bigint NOT NULL,
	_id_1 bigint NOT NULL,
	_id_2 bigint NOT NULL,
    CONSTRAINT PK__links PRIMARY KEY (_id),
    CONSTRAINT IX__links UNIQUE (_id_1, _id_2),
    CONSTRAINT CK__links CHECK  (_id_1<>_id_2)
);

CREATE TABLE _lists(
	_id bigint NOT NULL,
	_name varchar(250) NOT NULL,
	_alias varchar(250) NULL,
    CONSTRAINT PK__lists PRIMARY KEY (_id)
);


CREATE TABLE _roles(
	_id bigint NOT NULL,
	_name varchar(250) NOT NULL,
    CONSTRAINT PK__roles PRIMARY KEY (_id),
    CONSTRAINT IX__roles UNIQUE (_name)
);


CREATE TABLE _users(
	_id bigint NOT NULL,
	_login varchar(250) NOT NULL,
	_password TEXT NOT NULL,
	_name varchar(250) NOT NULL,
	_phone varchar(250) NULL,
	_email varchar(250) NULL,
	_date_register timestamp DEFAULT now() NOT NULL,
	_date_dismiss timestamp NULL,
	_enabled boolean DEFAULT true NOT NULL,
    CONSTRAINT PK__users PRIMARY KEY (_id)
);


CREATE TABLE _users_roles(
	_id bigint NOT NULL,
	_id_role bigint NOT NULL,
    _id_user bigint NOT NULL,
    CONSTRAINT PK__users_roles PRIMARY KEY (_id),
    CONSTRAINT IX__users_roles UNIQUE (_id_role, _id_user),
    CONSTRAINT FK__users_roles__roles FOREIGN KEY (_id_role) REFERENCES _roles (_id) ON DELETE CASCADE,
    CONSTRAINT FK__users_roles__users FOREIGN KEY (_id_user) REFERENCES _roles (_id) ON DELETE CASCADE
);


CREATE TABLE _schemes(
	_id bigint NOT NULL,
	_id_parent bigint NULL,
	_name varchar(250) NOT NULL,
	_alias varchar(250) NULL,
	_name_space varchar(1000) NULL,
    CONSTRAINT PK__schemes PRIMARY KEY (_id),
	CONSTRAINT IX__schemes UNIQUE (_name),
    CONSTRAINT FK__schemes__schemes FOREIGN KEY (_id_parent) REFERENCES _schemes (_id) 
);


CREATE TABLE _structures(
	_id bigint NOT NULL,
	_id_parent bigint NULL,
	_id_scheme bigint NOT NULL,
	_id_override bigint NULL,
	_id_type bigint NOT NULL,
	_id_list bigint NULL,
	_name varchar(250) NOT NULL,
	_alias varchar(250) NULL,
	_order int NULL,
	_readonly boolean NULL,
	_allow_not_null boolean NULL,
	_is_array boolean NULL,
	_is_compress boolean NULL,
	_store_null boolean NULL,
	_default_value bytea NULL,
	_default_editor text NULL,
    CONSTRAINT PK__structure PRIMARY KEY (_id),
	CONSTRAINT IX__structures UNIQUE (_id_scheme,_name),
    CONSTRAINT FK__structures__structures FOREIGN KEY (_id_parent) REFERENCES _structures (_id),
    CONSTRAINT FK__structures__schemes FOREIGN KEY (_id_scheme) REFERENCES _schemes (_id),
    CONSTRAINT FK__structures__types FOREIGN KEY (_id_type) REFERENCES _types (_id),
    CONSTRAINT FK__structures__lists FOREIGN KEY (_id_list) REFERENCES _lists (_id)
);

CREATE TABLE _availabilities(
	_id bigint NOT NULL,
	_id_scheme_1 bigint,
	_id_scheme_2 bigint NOT NULL,
    CONSTRAINT PK__availabilities PRIMARY KEY (_id),
	CONSTRAINT IX__availabilities UNIQUE (_id_scheme_1,_id_scheme_2),
    CONSTRAINT FK__availabilities__schemes_1 FOREIGN KEY (_id_scheme_1) REFERENCES _schemes (_id), 
    CONSTRAINT FK__availabilities__schemes_2 FOREIGN KEY (_id_scheme_2) REFERENCES _schemes (_id)  ON DELETE CASCADE
);

CREATE TABLE _objects(
	_id bigint NOT NULL,
	_id_parent bigint NULL,
	_id_scheme bigint NOT NULL,
	_id_owner bigint NOT NULL,
	_id_who_change bigint NOT NULL,
	_date_create timestamp DEFAULT now() NOT NULL,
	_date_modify timestamp DEFAULT now() NOT NULL,
	_date_begin timestamp NULL,
	_date_complete timestamp NULL,
	_key bigint NULL,
	_code_int int NULL,
	_code_string varchar(250) NULL,
	_code_guid uuid NULL,
	_name varchar(250) NULL,
	_note varchar(1000) NULL,
	_hash bytea NULL,
    CONSTRAINT PK__objects PRIMARY KEY (_id),
	CONSTRAINT CK__hash CHECK (length(_hash)<=32),
    CONSTRAINT FK__objects__objects FOREIGN KEY (_id_parent) REFERENCES _objects (_id) ON DELETE CASCADE,
    CONSTRAINT FK__objects__schemes FOREIGN KEY (_id_scheme) REFERENCES _schemes (_id) ON DELETE CASCADE, 
    CONSTRAINT FK__objects__users1 FOREIGN KEY (_id_owner) REFERENCES _users (_id),
	CONSTRAINT FK__objects__users2 FOREIGN KEY (_id_who_change) REFERENCES _users (_id)    
);

CREATE INDEX IF NOT EXISTS "IX__objects_1" ON _objects (_date_create) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX__objects_2" ON _objects (_date_modify) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX__objects_3" ON _objects (_code_int) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX__objects_4" ON _objects (_code_string) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX__objects_5" ON _objects (_name) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX__objects_6" ON _objects (_code_guid) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX__objects_7" ON _objects (_hash) WITH (deduplicate_items=True);


CREATE TABLE _deleted_objects(
	_id bigint NOT NULL,
	_date_delete timestamp DEFAULT now() NOT NULL,
	_id_parent bigint NULL,
	_id_scheme bigint NOT NULL,
	_id_owner bigint NOT NULL,
	_id_who_change bigint NOT NULL,
	_date_create timestamp DEFAULT now() NOT NULL,
	_date_modify timestamp DEFAULT now() NOT NULL,
	_date_begin timestamp NULL,
	_date_complete timestamp NULL,
	_key bigint NULL,
	_code_int int NULL,
	_code_string varchar(250) NULL,
	_code_guid uuid NULL,
	_name varchar(250) NULL,
	_note varchar(1000) NULL,
	_hash bytea NULL,
	_values bytea NULL,
    CONSTRAINT PK__deleted_objects PRIMARY KEY (_id)
);

CREATE TABLE _list_items(
	_id bigint NOT NULL,
	_id_list bigint NOT NULL,
	_value varchar(250) NULL,
	_id_object bigint NULL,
    CONSTRAINT PK__list_items PRIMARY KEY (_id),
    CONSTRAINT FK__list_items__id_list FOREIGN KEY (_id_list) REFERENCES _lists (_id) ON DELETE CASCADE,
    CONSTRAINT FK__list_items__objects FOREIGN KEY (_id_object) REFERENCES _objects (_id)
);

CREATE TABLE _values(
	_id bigint NOT NULL,
	_id_structure bigint NOT NULL,
	_id_object bigint NOT NULL,
	_String varchar(850) NULL,
	_Long bigint NULL,
	_Guid uuid NULL,
	_Double float NULL,
	_DateTime timestamp NULL,
	_Boolean boolean NULL,
	_ByteArray bytea NULL,
	_Text text NULL,
    CONSTRAINT PK__values PRIMARY KEY (_id),
    CONSTRAINT FK__values__objects FOREIGN KEY (_id_object) REFERENCES _objects (_id) ON DELETE CASCADE,
    CONSTRAINT FK__values__structures FOREIGN KEY (_id_structure) REFERENCES _structures (_id) ON DELETE CASCADE,
	CONSTRAINT IX__values_SO UNIQUE (_id_structure,_id_object)
); 

CREATE INDEX IF NOT EXISTS "IX_values_String" ON _values (_String) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX_values_Long" ON _values (_Long) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX_values_Guid" ON _values (_Guid) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX_values_Double" ON _values (_Double) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX_values_DateTime" ON _values (_DateTime) WITH (deduplicate_items=True);
CREATE INDEX IF NOT EXISTS "IX_values_Boolean" ON _values (_Boolean) WITH (deduplicate_items=True);


CREATE TABLE _permissions(
	_id bigint NOT NULL,
	_id_role bigint NULL,
	_id_user bigint NULL,
	_id_ref bigint NOT NULL,
	_select boolean NULL,
	_insert boolean NULL,
	_update boolean NULL,
	_delete boolean NULL,
    CONSTRAINT PK__object_permissions PRIMARY KEY (_id),
    CONSTRAINT CK__permissions_users_roles CHECK  (_id_role IS NOT NULL AND _id_user IS NULL OR _id_role IS NULL AND _id_user IS NOT NULL),
    CONSTRAINT IX__permissions UNIQUE (_id_role, _id_user, _id_ref, _select, _insert, _update, _delete),
    CONSTRAINT FK__permissions__roles FOREIGN KEY (_id_role) REFERENCES _roles (_id) ON DELETE CASCADE,
    CONSTRAINT FK__permissions__users FOREIGN KEY (_id_user) REFERENCES _users (_id) ON DELETE CASCADE
);

CREATE TABLE _functions
(
    _id bigint NOT NULL,
    _id_scheme bigint NOT NULL,
	_language varchar(50) NOT NULL,
    _name varchar(1000) NOT NULL,
    _body text NOT NULL,
    CONSTRAINT PK__functions PRIMARY KEY (_id),
    CONSTRAINT FK__functions__schemes FOREIGN KEY (_id_scheme) REFERENCES _schemes (_id)
);


CREATE SEQUENCE global_identity
 AS bigint
 START WITH -9223372036854769999
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807;

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

INSERT INTO _users (_id, _login, _password, _name, _phone, _email, _date_register, _date_dismiss, _enabled) VALUES (-9223372036854775800, 'admin', '', 'admin', NULL, NULL, CAST('2023-12-26T01:14:34.410' AS TimeStamp), NULL, true);
