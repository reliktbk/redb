using System;
using System.Collections.Generic;

namespace redb.Core.Models;

public partial class _RDependence
{
    public long Id { get; set; }
    public long? IdScheme1 { get; set; }

    public long IdScheme2 { get; set; }

    public virtual _RScheme? IdScheme1Navigation { get; set; }

    public virtual _RScheme IdScheme2Navigation { get; set; } = null!;
}
