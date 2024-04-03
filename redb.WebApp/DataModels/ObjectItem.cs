using redb.Core.Models;

namespace redb.WebApp.DataModels
{
    public class ObjectItem
    {
        public long Id { get; set; }
        public long? ParentId { get; set; }

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

        public long Scheme { get; set; }

        public long User { get; set; } 
    }
}
