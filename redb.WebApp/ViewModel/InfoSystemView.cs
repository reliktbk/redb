using redb.Core;
using redb.WebApp.DataModels;
using System.Diagnostics.Metrics;

namespace redb.WebApp.ViewModel
{
    public class InfoSystemView(IRedbService redbService)
    {
        public string dbVersion { get; private set; } = redbService.dbVersion;
        public string dbType { get; private set; } = redbService.dbType;
        public string dbMigration { get; private set; } = redbService.dbMigration;

        public int? dbSize { get; private set; } = redbService.dbSize;

    }
}
