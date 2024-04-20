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

        IQueryable<T> GetAll<T>() where T : class;
        Task<T?> GetById<T>(long id) where T : class;
        Task<int> DeleteById<T>(long id) where T : class;
    }
}
