using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using redb.Core;
using redb.Core.Models;
using System.Globalization;



namespace redb.WebApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CultureInfo.DefaultThreadCurrentCulture = new CultureInfo("ru-Ru");

            WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            String IdentityConnectionString = builder.Configuration.GetConnectionString("IdentitySQLiteConnection") ?? throw new InvalidOperationException("Connection string IdentitySQLiteConnection not found.");
            String RedbConnectionString = builder.Configuration.GetConnectionString("RedbSQLiteConnection") ?? throw new InvalidOperationException("Connection string RedbSQLiteConnection not found.");
            builder.Services
                .AddScoped<RedbContext, Core.SQLite.RedbContext>()
                .AddScoped<IRedbService, Core.SQLite.RedbService>()
                .AddDbContext<Core.SQLite.RedbContext>(options => options.UseLazyLoadingProxies().UseSqlite(RedbConnectionString))
                .AddDbContext<IdentityDbContext>(options => options.UseSqlite(IdentityConnectionString))
                .AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
                .AddEntityFrameworkStores<IdentityDbContext>();
            builder.Services.AddMvc();
            builder.Services.AddRazorPages(options =>
            {
                //options.Conventions.AuthorizeFolder("/pageItems");
            });

            WebApplication app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }


            #region example MapGet 
            //see controller Sidebarlist
            //{
            //  app.MapGet("api/SidebarList/{name}", (IRedbService rs, string name) =>
            //        rs.Get_RObjectsParentsById()
            //                    .Where(o => o.Name == "WebApp").First()
            //                    .InverseIdParentNavigation.Where(o => o.Name == "WebApp.Sidebar").First()
            //                    .InverseIdParentNavigation.Where(o => o.Name == $"WebApp.Sidebar.{name}").First()
            //                    .InverseIdParentNavigation.SelectMany(v => v.Values).AsQueryable()
            //                    .GroupBy(k => k.IdObject)
            //                    .Select(g => new
            //                    {
            //                        name = g.Where(s => s.IdStructureNavigation.Name == "name").First().String,
            //                        path = g.Where(s => s.IdStructureNavigation.Name == "path").First().Text
            //                    }).OrderBy(o => o.name));
            //}
            #endregion

            app.UseHttpsRedirection()
                .UseStaticFiles()
                .UseRouting()
                .UseAuthorization();

            app.MapControllers();
            app.MapRazorPages();
            app.Run();
        }
    }
}

