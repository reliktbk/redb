using System;
using System.Collections.Generic;

namespace redb.Core.Models;

public partial class _RRole
{
    public long Id { get; set; }
    public string Name { get; set; } = null!;

    public virtual ICollection<_RPermission> Permissions { get; set; } = new List<_RPermission>();

    public virtual ICollection<_RUsersRole> UsersRoleIdRoleNavigations { get; set; } = new List<_RUsersRole>();

    public virtual ICollection<_RUsersRole> UsersRoleIdUserNavigations { get; set; } = new List<_RUsersRole>();
}
