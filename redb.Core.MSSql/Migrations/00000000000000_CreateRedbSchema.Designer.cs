﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using redb.Core.Models;

#nullable disable

namespace redb.Core.MSSql.Migrations
{
    [DbContext(typeof(RedbContext))]
    [Migration("00000000000000_CreateRedbSchema")]
    partial class CreateRedbSchema
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseCollation("Cyrillic_General_CI_AS")
                .HasAnnotation("ProductVersion", "8.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.HasSequence("global_identity")
                .StartsAt(-9223372036854770000L);

            modelBuilder.Entity("redb.Core.Models._RDeletedObject", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<Guid?>("CodeGuid")
                        .HasColumnType("uniqueidentifier")
                        .HasColumnName("_code_guid");

                    b.Property<long?>("CodeInt")
                        .HasColumnType("bigint")
                        .HasColumnName("_code_int");

                    b.Property<string>("CodeString")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_code_string");

                    b.Property<DateTime?>("DateBegin")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_begin");

                    b.Property<DateTime?>("DateComplete")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_complete");

                    b.Property<DateTime>("DateCreate")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_create");

                    b.Property<DateTime>("DateDelete")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("_date_delete")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<DateTime>("DateModify")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_modify");

                    b.Property<byte[]>("Hash")
                        .HasMaxLength(32)
                        .HasColumnType("varbinary(32)")
                        .HasColumnName("_hash");

                    b.Property<long>("IdOwner")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_owner");

                    b.Property<long?>("IdParent")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_parent");

                    b.Property<long>("IdScheme")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_scheme");

                    b.Property<long>("IdWhoChange")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_who_change");

                    b.Property<long?>("Key")
                        .HasColumnType("bigint")
                        .HasColumnName("_key");

                    b.Property<string>("Name")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.Property<string>("Note")
                        .HasMaxLength(1000)
                        .HasColumnType("nvarchar(1000)")
                        .HasColumnName("_note");

                    b.Property<byte[]>("Values")
                        .HasColumnType("varbinary(max)")
                        .HasColumnName("_values");

                    b.HasKey("Id")
                        .HasName("PK___deleted__DED88B1C45174CE0");

                    b.ToTable("_deleted_objects", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RDependency", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<long?>("IdScheme1")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_scheme_1");

                    b.Property<long>("IdScheme2")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_scheme_2");

                    b.HasKey("Id");

                    b.HasIndex(new[] { "IdScheme1", "IdScheme2" }, "IX__dependencies")
                        .IsUnique()
                        .HasFilter("[_id_scheme_1] IS NOT NULL");

                    b.HasIndex(new[] { "IdScheme1" }, "IX__dependencies__schemes_1");

                    b.HasIndex(new[] { "IdScheme2" }, "IX__dependencies__schemes_2");

                    b.ToTable("_dependencies", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RFunction", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<string>("Body")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("_body");

                    b.Property<long>("IdScheme")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_scheme");

                    b.Property<string>("Language")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)")
                        .HasColumnName("_language");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(400)
                        .HasColumnType("nvarchar(400)")
                        .HasColumnName("_name");

                    b.HasKey("Id");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.HasIndex(new[] { "IdScheme" }, "IX__functions__schemes");

                    b.HasIndex(new[] { "IdScheme", "Name" }, "IX__functions_scheme_name")
                        .IsUnique();

                    b.ToTable("_functions", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RLink", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<long>("Id1")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_1");

                    b.Property<long>("Id2")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_2");

                    b.HasKey("Id");

                    b.HasIndex(new[] { "Id1", "Id2" }, "IX__links")
                        .IsUnique();

                    b.ToTable("_links", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RList", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<string>("Alias")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_alias");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.HasKey("Id");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.ToTable("_lists", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RListItem", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<long>("IdList")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_list");

                    b.Property<long?>("IdObject")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_object");

                    b.Property<string>("_RValue")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_value");

                    b.HasKey("Id");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.HasIndex(new[] { "IdList" }, "IX__list_items__id_list");

                    b.HasIndex(new[] { "IdObject" }, "IX__list_items__objects");

                    b.ToTable("_list_items", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RObject", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<Guid?>("CodeGuid")
                        .HasColumnType("uniqueidentifier")
                        .HasColumnName("_code_guid");

                    b.Property<long?>("CodeInt")
                        .HasColumnType("bigint")
                        .HasColumnName("_code_int");

                    b.Property<string>("CodeString")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_code_string");

                    b.Property<DateTime?>("DateBegin")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_begin");

                    b.Property<DateTime?>("DateComplete")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_complete");

                    b.Property<DateTime>("DateCreate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("_date_create")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<DateTime>("DateModify")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("_date_modify")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<byte[]>("Hash")
                        .HasMaxLength(32)
                        .HasColumnType("varbinary(32)")
                        .HasColumnName("_hash");

                    b.Property<long>("IdOwner")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_owner");

                    b.Property<long?>("IdParent")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_parent");

                    b.Property<long>("IdScheme")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_scheme");

                    b.Property<long>("IdWhoChange")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_who_change");

                    b.Property<long?>("Key")
                        .HasColumnType("bigint")
                        .HasColumnName("_key");

                    b.Property<string>("Name")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.Property<string>("Note")
                        .HasMaxLength(1000)
                        .HasColumnType("nvarchar(1000)")
                        .HasColumnName("_note");

                    b.HasKey("Id");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.HasIndex(new[] { "CodeGuid" }, "IX__objects__code_guid");

                    b.HasIndex(new[] { "CodeInt" }, "IX__objects__code_int");

                    b.HasIndex(new[] { "CodeString" }, "IX__objects__code_string");

                    b.HasIndex(new[] { "DateCreate" }, "IX__objects__date_create");

                    b.HasIndex(new[] { "DateModify" }, "IX__objects__date_modify");

                    b.HasIndex(new[] { "Hash" }, "IX__objects__hash");

                    b.HasIndex(new[] { "Name" }, "IX__objects__name");

                    b.HasIndex(new[] { "IdParent" }, "IX__objects__objects");

                    b.HasIndex(new[] { "IdScheme" }, "IX__objects__schemes");

                    b.HasIndex(new[] { "IdOwner" }, "IX__objects__users1");

                    b.HasIndex(new[] { "IdWhoChange" }, "IX__objects__users2");

                    b.ToTable("_objects", null, t =>
                        {
                            t.HasTrigger("TR__objects__deleted_objects");
                        });

                    b.HasAnnotation("SqlServer:UseSqlOutputClause", false);
                });

            modelBuilder.Entity("redb.Core.Models._RPermission", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<bool?>("Delete")
                        .HasColumnType("bit")
                        .HasColumnName("_delete");

                    b.Property<long>("IdRef")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_ref");

                    b.Property<long?>("IdRole")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_role");

                    b.Property<long?>("IdUser")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_user");

                    b.Property<bool?>("Insert")
                        .HasColumnType("bit")
                        .HasColumnName("_insert");

                    b.Property<bool?>("Select")
                        .HasColumnType("bit")
                        .HasColumnName("_select");

                    b.Property<bool?>("Update")
                        .HasColumnType("bit")
                        .HasColumnName("_update");

                    b.HasKey("Id")
                        .HasName("PK__object_permissions");

                    b.HasIndex(new[] { "IdRef", "Select", "Insert", "Update", "Delete", "IdRole", "IdUser" }, "IX__permissions")
                        .IsUnique()
                        .HasFilter("[_select] IS NOT NULL AND [_insert] IS NOT NULL AND [_update] IS NOT NULL AND [_delete] IS NOT NULL AND [_id_role] IS NOT NULL AND [_id_user] IS NOT NULL");

                    b.HasIndex(new[] { "IdRole" }, "IX__permissions__roles");

                    b.HasIndex(new[] { "IdUser" }, "IX__permissions__users");

                    b.ToTable("_permissions", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RRole", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.HasKey("Id");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.HasIndex(new[] { "Name" }, "IX__roles")
                        .IsUnique();

                    b.ToTable("_roles", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RScheme", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<string>("Alias")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_alias");

                    b.Property<long?>("IdParent")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_parent");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.Property<string>("NameSpace")
                        .HasMaxLength(1000)
                        .HasColumnType("nvarchar(1000)")
                        .HasColumnName("_name_space");

                    b.HasKey("Id");

                    b.HasIndex(new[] { "Name" }, "IX__schemes")
                        .IsUnique();

                    b.HasIndex(new[] { "IdParent" }, "IX__schemes__schemes");

                    b.ToTable("_schemes", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RStructure", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<string>("Alias")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_alias");

                    b.Property<bool?>("AllowNotNull")
                        .HasColumnType("bit")
                        .HasColumnName("_allow_not_null");

                    b.Property<string>("DefaultEditor")
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("_default_editor");

                    b.Property<byte[]>("DefaultValue")
                        .HasColumnType("varbinary(max)")
                        .HasColumnName("_default_value");

                    b.Property<long?>("IdList")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_list");

                    b.Property<long?>("IdOverride")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_override");

                    b.Property<long?>("IdParent")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_parent");

                    b.Property<long>("IdScheme")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_scheme");

                    b.Property<long>("IdType")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_type");

                    b.Property<bool?>("IsArray")
                        .HasColumnType("bit")
                        .HasColumnName("_is_array");

                    b.Property<bool?>("IsCompress")
                        .HasColumnType("bit")
                        .HasColumnName("_is_compress");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.Property<long?>("Order")
                        .HasColumnType("bigint")
                        .HasColumnName("_order");

                    b.Property<bool?>("Readonly")
                        .HasColumnType("bit")
                        .HasColumnName("_readonly");

                    b.Property<bool?>("StoreNull")
                        .HasColumnType("bit")
                        .HasColumnName("_store_null");

                    b.HasKey("Id")
                        .HasName("PK__structure");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.HasIndex(new[] { "IdScheme", "Name" }, "IX__structures")
                        .IsUnique();

                    b.HasIndex(new[] { "IdList" }, "IX__structures__lists");

                    b.HasIndex(new[] { "IdScheme" }, "IX__structures__schemes");

                    b.HasIndex(new[] { "IdParent" }, "IX__structures__structures");

                    b.HasIndex(new[] { "IdType" }, "IX__structures__types");

                    b.ToTable("_structures", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RType", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<string>("DbType")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_db_type");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.Property<string>("Type1")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_type");

                    b.HasKey("Id");

                    b.HasIndex(new[] { "Name" }, "IX__types")
                        .IsUnique();

                    b.ToTable("_types", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RUser", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<DateTime?>("DateDismiss")
                        .HasColumnType("datetime")
                        .HasColumnName("_date_dismiss");

                    b.Property<DateTime>("DateRegister")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("_date_register")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<string>("Email")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_email");

                    b.Property<bool>("Enabled")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bit")
                        .HasDefaultValue(true)
                        .HasColumnName("_enabled");

                    b.Property<string>("Login")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_login");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_name");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("_password");

                    b.Property<string>("Phone")
                        .HasMaxLength(250)
                        .HasColumnType("nvarchar(250)")
                        .HasColumnName("_phone");

                    b.HasKey("Id");

                    b.HasIndex(new[] { "Login" }, "IX__users")
                        .IsUnique();

                    b.ToTable("_users", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RUsersRole", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<long>("IdRole")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_role");

                    b.Property<long>("IdUser")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_user");

                    b.HasKey("Id");

                    b.HasIndex(new[] { "IdRole", "IdUser" }, "IX__users_roles")
                        .IsUnique();

                    b.HasIndex(new[] { "IdRole" }, "IX__users_roles__roles");

                    b.HasIndex(new[] { "IdUser" }, "IX__users_roles__users");

                    b.ToTable("_users_roles", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RValue", b =>
                {
                    b.Property<long>("Id")
                        .HasColumnType("bigint")
                        .HasColumnName("_id");

                    b.Property<bool?>("Boolean")
                        .HasColumnType("bit")
                        .HasColumnName("_Boolean");

                    b.Property<byte[]>("ByteArray")
                        .HasColumnType("varbinary(max)")
                        .HasColumnName("_ByteArray");

                    b.Property<DateTime?>("DateTime")
                        .HasColumnType("datetime")
                        .HasColumnName("_DateTime");

                    b.Property<double?>("Double")
                        .HasColumnType("float")
                        .HasColumnName("_Double");

                    b.Property<Guid?>("Guid")
                        .HasColumnType("uniqueidentifier")
                        .HasColumnName("_Guid");

                    b.Property<long>("IdObject")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_object");

                    b.Property<long>("IdStructure")
                        .HasColumnType("bigint")
                        .HasColumnName("_id_structure");

                    b.Property<long?>("Long")
                        .HasColumnType("bigint")
                        .HasColumnName("_Long");

                    b.Property<string>("String")
                        .HasMaxLength(850)
                        .HasColumnType("nvarchar(850)")
                        .HasColumnName("_String");

                    b.Property<string>("Text")
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("_Text");

                    b.HasKey("Id");

                    SqlServerKeyBuilderExtensions.IsClustered(b.HasKey("Id"), false);

                    b.HasIndex(new[] { "IdStructure", "IdObject" }, "IX__values_SO")
                        .IsUnique();

                    b.HasIndex(new[] { "Boolean" }, "IX__values__Boolean");

                    b.HasIndex(new[] { "DateTime" }, "IX__values__DateTime");

                    b.HasIndex(new[] { "Double" }, "IX__values__Double");

                    b.HasIndex(new[] { "Guid" }, "IX__values__Guid");

                    b.HasIndex(new[] { "Long" }, "IX__values__Long");

                    b.HasIndex(new[] { "String" }, "IX__values__String");

                    b.HasIndex(new[] { "IdObject" }, "IX__values__objects");

                    b.HasIndex(new[] { "IdStructure" }, "IX__values__structures");

                    b.ToTable("_values", (string)null);
                });

            modelBuilder.Entity("redb.Core.Models._RDependency", b =>
                {
                    b.HasOne("redb.Core.Models._RScheme", "Scheme1Navigation")
                        .WithMany("DependencyScheme1Navigations")
                        .HasForeignKey("IdScheme1")
                        .OnDelete(DeleteBehavior.Cascade)
                        .HasConstraintName("FK__dependencies__schemes_1");

                    b.HasOne("redb.Core.Models._RScheme", "Scheme2Navigation")
                        .WithMany("DependencyScheme2Navigations")
                        .HasForeignKey("IdScheme2")
                        .IsRequired()
                        .HasConstraintName("FK__dependencies__schemes_2");

                    b.Navigation("Scheme1Navigation");

                    b.Navigation("Scheme2Navigation");
                });

            modelBuilder.Entity("redb.Core.Models._RFunction", b =>
                {
                    b.HasOne("redb.Core.Models._RScheme", "SchemeNavigation")
                        .WithMany("Functions")
                        .HasForeignKey("IdScheme")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__functions__schemes");

                    b.Navigation("SchemeNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RListItem", b =>
                {
                    b.HasOne("redb.Core.Models._RList", "ListNavigation")
                        .WithMany("ListItems")
                        .HasForeignKey("IdList")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__list_items__lists");

                    b.HasOne("redb.Core.Models._RObject", "ObjectNavigation")
                        .WithMany("ListItems")
                        .HasForeignKey("IdObject")
                        .HasConstraintName("FK__list_items__id_objects");

                    b.Navigation("ListNavigation");

                    b.Navigation("ObjectNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RObject", b =>
                {
                    b.HasOne("redb.Core.Models._RUser", "OwnerNavigation")
                        .WithMany("ObjectOwnerNavigations")
                        .HasForeignKey("IdOwner")
                        .IsRequired()
                        .HasConstraintName("FK__objects__users1");

                    b.HasOne("redb.Core.Models._RObject", "ParentNavigation")
                        .WithMany("InverseParentNavigation")
                        .HasForeignKey("IdParent")
                        .HasConstraintName("FK__objects__objects");

                    b.HasOne("redb.Core.Models._RScheme", "SchemeNavigation")
                        .WithMany("Objects")
                        .HasForeignKey("IdScheme")
                        .IsRequired()
                        .HasConstraintName("FK__objects__schemes");

                    b.HasOne("redb.Core.Models._RUser", "WhoChangeNavigation")
                        .WithMany("ObjectWhoChangeNavigations")
                        .HasForeignKey("IdWhoChange")
                        .IsRequired()
                        .HasConstraintName("FK__objects__users2");

                    b.Navigation("OwnerNavigation");

                    b.Navigation("ParentNavigation");

                    b.Navigation("SchemeNavigation");

                    b.Navigation("WhoChangeNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RPermission", b =>
                {
                    b.HasOne("redb.Core.Models._RRole", "RoleNavigation")
                        .WithMany("Permissions")
                        .HasForeignKey("IdRole")
                        .HasConstraintName("FK__permissions__roles");

                    b.HasOne("redb.Core.Models._RUser", "UserNavigation")
                        .WithMany("Permissions")
                        .HasForeignKey("IdUser")
                        .HasConstraintName("FK__permissions__users");

                    b.Navigation("RoleNavigation");

                    b.Navigation("UserNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RScheme", b =>
                {
                    b.HasOne("redb.Core.Models._RScheme", "ParentNavigation")
                        .WithMany("InverseParentNavigation")
                        .HasForeignKey("IdParent")
                        .HasConstraintName("FK__schemes__schemes");

                    b.Navigation("ParentNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RStructure", b =>
                {
                    b.HasOne("redb.Core.Models._RList", "ListNavigation")
                        .WithMany("Structures")
                        .HasForeignKey("IdList")
                        .HasConstraintName("FK__structures__lists");

                    b.HasOne("redb.Core.Models._RStructure", "ParentNavigation")
                        .WithMany("InverseParentNavigation")
                        .HasForeignKey("IdParent")
                        .HasConstraintName("FK__structures__structures");

                    b.HasOne("redb.Core.Models._RScheme", "SchemeNavigation")
                        .WithMany("Structures")
                        .HasForeignKey("IdScheme")
                        .IsRequired()
                        .HasConstraintName("FK__structures__schemes");

                    b.HasOne("redb.Core.Models._RType", "TypeNavigation")
                        .WithMany("Structures")
                        .HasForeignKey("IdType")
                        .IsRequired()
                        .HasConstraintName("FK__structures__types");

                    b.Navigation("ListNavigation");

                    b.Navigation("ParentNavigation");

                    b.Navigation("SchemeNavigation");

                    b.Navigation("TypeNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RUsersRole", b =>
                {
                    b.HasOne("redb.Core.Models._RRole", "RoleNavigation")
                        .WithMany("UsersRoles")
                        .HasForeignKey("IdRole")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__users_roles__roles");

                    b.HasOne("redb.Core.Models._RUser", "UserNavigation")
                        .WithMany("UsersRoles")
                        .HasForeignKey("IdUser")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__users_roles__users");

                    b.Navigation("RoleNavigation");

                    b.Navigation("UserNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RValue", b =>
                {
                    b.HasOne("redb.Core.Models._RObject", "ObjectNavigation")
                        .WithMany("Values")
                        .HasForeignKey("IdObject")
                        .IsRequired()
                        .HasConstraintName("FK__values__objects");

                    b.HasOne("redb.Core.Models._RStructure", "StructureNavigation")
                        .WithMany("Values")
                        .HasForeignKey("IdStructure")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired()
                        .HasConstraintName("FK__values__structures");

                    b.Navigation("ObjectNavigation");

                    b.Navigation("StructureNavigation");
                });

            modelBuilder.Entity("redb.Core.Models._RList", b =>
                {
                    b.Navigation("ListItems");

                    b.Navigation("Structures");
                });

            modelBuilder.Entity("redb.Core.Models._RObject", b =>
                {
                    b.Navigation("InverseParentNavigation");

                    b.Navigation("ListItems");

                    b.Navigation("Values");
                });

            modelBuilder.Entity("redb.Core.Models._RRole", b =>
                {
                    b.Navigation("Permissions");

                    b.Navigation("UsersRoles");
                });

            modelBuilder.Entity("redb.Core.Models._RScheme", b =>
                {
                    b.Navigation("DependencyScheme1Navigations");

                    b.Navigation("DependencyScheme1Navigations");

                    b.Navigation("Functions");

                    b.Navigation("InverseParentNavigation");

                    b.Navigation("Objects");

                    b.Navigation("Structures");
                });

            modelBuilder.Entity("redb.Core.Models._RStructure", b =>
                {
                    b.Navigation("InverseParentNavigation");

                    b.Navigation("Values");
                });

            modelBuilder.Entity("redb.Core.Models._RType", b =>
                {
                    b.Navigation("Structures");
                });

            modelBuilder.Entity("redb.Core.Models._RUser", b =>
                {
                    b.Navigation("ObjectOwnerNavigations");

                    b.Navigation("ObjectWhoChangeNavigations");

                    b.Navigation("Permissions");

                    b.Navigation("UsersRoles");
                });
#pragma warning restore 612, 618
        }
    }
}
