using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore.ValueGeneration;
using redb.Core.Models;

namespace redb.WebApp.DataModels
{

    public class ObjectItemValueView
    {
        public required string Name { get; set; }
        public string? Value { get; set; }
    }
    public class ObjectItemView
    {
        public required string Id { get; set; }
        public string? ParentId { get; set; }

        public DateTime DateCreate { get; set; }

        public DateTime DateModify { get; set; }

        public DateTime? DateBegin { get; set; }

        public DateTime? DateComplete { get; set; }

        public long? KeyValue { get; set; }

        public long? CodeInt { get; set; }

        public string? CodeString { get; set; }

        public Guid? CodeGuid { get; set; }

        public string? Name { get; set; }

        public string? Note { get; set; }

        public byte[]? Hash { get; set; }

        public required string Scheme { get; set; }

        public required string User { get; set; }

        public required List<ObjectItemValueView> Properties { get; set; }

        public static explicit operator ObjectItemView(_RObject robj) => new()
        {
            Id = robj.Id.ToString(),
            CodeGuid = robj.CodeGuid,
            CodeString = robj.CodeString,
            CodeInt = robj.CodeInt,
            DateBegin = robj.DateBegin,
            DateComplete = robj.DateComplete,
            DateCreate = robj.DateCreate,
            DateModify = robj.DateModify,
            Hash = robj.Hash,
            ParentId = robj.IdParent.ToString(),
            KeyValue = robj.Key,
            Name = robj.Name,
            Note = robj.Note,
            Scheme = robj.IdSchemeNavigation.Name,
            User = robj.IdOwnerNavigation.Name,
            Properties = robj.Values.Select(o => new ObjectItemValueView
            {
                Name = o.IdStructureNavigation.Name,
                Value = ((Func<string?>)(() => o.GetType()
                    .GetProperty(o.IdStructureNavigation.IdTypeNavigation.DbType ?? throw new NotImplementedException())?
                    .GetValue(o)?.ToString())).Invoke()
            })
            .ToList()
        };

    }
}
