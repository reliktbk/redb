using System;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using redb.Core.Models;
using redb.Core.Utils;

namespace redb.Core.Postgres
{
    public partial class RedbService(IServiceProvider serviceProvider) : IRedbService
    {
        private readonly Core.RedbContext _redbContext = serviceProvider.GetService<RedbContext>() ?? throw new NotImplementedException();
        public string dbVersion => _redbContext.Database.SqlQueryRaw<string>("SELECT version() \"Value\"").First();
        public string dbType => _redbContext.Database.IsNpgsql() ? "Postgresql" : "undefined";
        public string dbMigration => _redbContext.Database.GetMigrations().Last();
        public int? dbSize => _redbContext.Database.SqlQueryRaw<int>("select pg_database_size(current_database())  \"Value\"").First();

        public IQueryable<T> GetAll<T>() where T : class => _redbContext.Set<T>();
        public Task<T?> GetById<T>(long id) where T : class => _redbContext.FindAsync<T>(id).AsTask();
        public Task<int> DeleteById<T>(long id) where T : class => Task.Run<int>(()=>0); //_redbContext.Set<T>().Filter("Id", id).ExecuteDeleteAsync();
    }
}

