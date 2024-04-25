using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace redb.Core;

public abstract class RedbContext : DbContext
{
    public RedbContext()
    {
    }

    public RedbContext(DbContextOptions options)
        : base(options)
    {
    }

    public virtual DbSet<Models._RDependency> Dependencies { get; set; }

    public virtual DbSet<Models._RDeletedObject> DeletedObjects { get; set; }

    public virtual DbSet<Models._RFunction> Functions { get; set; }

    public virtual DbSet<Models._RLink> Links { get; set; }

    public virtual DbSet<Models._RList> Lists { get; set; }

    public virtual DbSet<Models._RListItem> ListItems { get; set; }

    public virtual DbSet<Models._RObject> Objects { get; set; }

    public virtual DbSet<Models._RPermission> Permissions { get; set; }

    public virtual DbSet<Models._RRole> Roles { get; set; }

    public virtual DbSet<Models._RScheme> Schemes { get; set; }

    public virtual DbSet<Models._RStructure> Structures { get; set; }

    public virtual DbSet<Models._RType> Types { get; set; }

    public virtual DbSet<Models._RUser> Users { get; set; }

    public virtual DbSet<Models._RUsersRole> UsersRoles { get; set; }

    public virtual DbSet<Models._RValue> Values { get; set; }
}
