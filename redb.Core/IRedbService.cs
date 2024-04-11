using Microsoft.EntityFrameworkCore;
using redb.Core.Models;

namespace redb.Core
{
    public interface IRedbService
    {
        string dbVersion { get; }
        string dbType { get; }
        string dbMigration { get; }

        int? dbSize { get; }

        IQueryable<_RObject> Get_AllRObjects();
        IQueryable<_RObject> Get_RObjectById(long id);
        IQueryable<_RObject> Get_RObjectsByParentId(long? parentId = null);
        IQueryable<_RObject> Get_RObjectsByParentName(string? parentName = null);
        IQueryable<_RObject> Get_AllRObjectsByName(string? name = null);
        IQueryable<_RFunction> Get_RFunctions();

        IQueryable<_RScheme> Get_AllSchemes();
    }
}
