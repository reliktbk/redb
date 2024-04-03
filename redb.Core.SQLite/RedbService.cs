using Microsoft.Extensions.DependencyInjection;
using redb.Core.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace redb.Core.SQLite
{
    public partial class RedbService(IServiceProvider serviceProvider) : IRedbService
    {
        private readonly redb.Core.RedbContext _redbContext = serviceProvider.GetService<RedbContext>() ?? throw new NotImplementedException();

        //public List<_RType> Get_RType() => [.. _redbContext.Types];
        public string dbVersion => _redbContext.Database.SqlQueryRaw<string>("select sqlite_version() value").First();

        public string dbType => _redbContext.Database.IsSqlite() ? "SQLite" : "undefined";

        public string dbMigration => _redbContext.Database.GetMigrations().Last();

        public int? dbSize => _redbContext.Database.SqlQueryRaw<int>("select page_count* page_size as value FROM pragma_page_count(), pragma_page_size()").First();

        public IQueryable<_RObject> Get_AllRObjects() => _redbContext.Objects.AsQueryable();

        public IQueryable<_RObject> Get_RObjectById(long id) => _redbContext.Objects.Where(o => o.Id == id);

        public IQueryable<_RObject> Get_AllRObjectsByName(string? name = null) => _redbContext.Objects.Where(o => o.Name == name);

        //=>[..(serviceProvider.GetService<RedbContext>() ?? throw new NotImplementedException()).Objects.Where(p=>p.IdParent == parentId)];
        public IQueryable<_RObject> Get_RObjectsByParentId(long? parentId = null)
            => _redbContext.Objects.Where(p => p.IdParent == parentId);

        public IQueryable<_RObject> Get_RObjectsByParentName(string? parentName = null)
            => _redbContext.Objects.Where(o => o.Name == parentName).Join(_redbContext.Objects, o1 => o1.Id, o2 => o2.IdParent, (o1, o2) => o2);

        public IQueryable<_RScheme> Get_AllSchemes()=>_redbContext.Schemes.AsQueryable();
    }
}

