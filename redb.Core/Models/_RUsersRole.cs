
using System;
using System.Collections.Generic;

namespace redb.Core.Models;

public partial class _RUsersRole
{
    public long Id { get; set; }
    public long IdRole { get; set; }

    public long IdUser { get; set; }

    public virtual _RRole IdRoleNavigation { get; set; } = null!;

    public virtual _RRole IdUserNavigation { get; set; } = null!;
}
