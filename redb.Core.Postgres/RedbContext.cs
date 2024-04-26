using Microsoft.EntityFrameworkCore;
using redb.Core.Postgres.Migrations;

namespace redb.Core.Postgres;
public partial class RedbContext(DbContextOptions<RedbContext> options) : Core.RedbContext(options)
{
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        RedbContextModelSnapshot.RedbBuildModel(modelBuilder);
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
