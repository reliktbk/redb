using Microsoft.CodeAnalysis.CSharp.Syntax;
using redb.Core.Models;

namespace redb.WebApp.ViewModel
{
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

        public static explicit operator ObjectItemView(_RObject robject) => new()
        {
            Id = robject.Id.ToString(),
            CodeGuid = robject.CodeGuid,
            CodeString = robject.CodeString,
            CodeInt = robject.CodeInt,
            DateBegin = robject.DateBegin,
            DateComplete = robject.DateComplete,
            DateCreate = robject.DateCreate,
            DateModify = robject.DateModify,
            Hash = robject.Hash,
            ParentId = robject.IdParent.ToString(),
            KeyValue = robject.Key,
            Name = robject.Name,
            Note = robject.Note,
            Scheme = robject.IdSchemeNavigation.Name,
            User = robject.IdOwnerNavigation.Name
        };

    }
}
