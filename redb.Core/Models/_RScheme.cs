﻿using System;
using System.Collections.Generic;

namespace redb.Core.Models;

public partial class _RScheme
{
    public long Id { get; set; }
    public long? IdParent { get; set; }

    public string Name { get; set; } = null!;

    public string? Alias { get; set; }

    public string? NameSpace { get; set; }

    public virtual ICollection<_RAvailability> AvailabilityIdScheme1Navigations { get; set; } = new List<_RAvailability>();

    public virtual ICollection<_RAvailability> AvailabilityIdScheme2Navigations { get; set; } = new List<_RAvailability>();

    public virtual ICollection<_RFunction> Functions { get; set; } = new List<_RFunction>();

    public virtual _RScheme? IdParentNavigation { get; set; }

    public virtual ICollection<_RScheme> InverseIdParentNavigation { get; set; } = new List<_RScheme>();

    public virtual ICollection<_RObject> Objects { get; set; } = new List<_RObject>();

    public virtual ICollection<_RStructure> Structures { get; set; } = new List<_RStructure>();
}
