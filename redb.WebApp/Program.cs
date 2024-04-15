using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using redb.Core;
using redb.Core.Models;
using System;
using System.Globalization;



namespace redb.WebApp
{
    public class Program
    {
        public static async Task Main(string[] args)
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
                .AddDefaultIdentity<IdentityUser>(options =>
                {
                    options.SignIn.RequireConfirmedAccount = true;
                    //options.Password.RequireDigit = false;
                    //options.Password.RequireNonAlphanumeric = false;
                    //options.Password.RequiredLength = 5;
                    //options.Password.RequireUppercase = false;
                })
                .AddEntityFrameworkStores<IdentityDbContext>();
            builder.Services.AddMvc();
            builder.Services.AddRazorPages(options =>
            {
                options.Conventions.AuthorizeFolder("/pageItems");
            });

            builder.Services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.ForwardedHeaders =
                    ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
            });

            //CreateRoles(builder.Services.BuildServiceProvider());

            WebApplication app = builder.Build();
            app.Use((context, next) =>
            {
                context.Request.Scheme = "https";
                return next(context);
            });
            app.UseForwardedHeaders();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            }

            app.UseHsts();


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
               .UseAuthorization()
               .UseEndpoints(endpoints =>
               {
                   endpoints.MapGet("/Identity/Account/Register", context => Task.Factory.StartNew(() => context.Response.Redirect("/Identity/Account/Login", true, true)));
                   endpoints.MapPost("/Identity/Account/Register", context => Task.Factory.StartNew(() => context.Response.Redirect("/Identity/Account/Login", true, true)));
               });

 
            //app.UseForwardedHeaders(new ForwardedHeadersOptions
            //{
            //    RequireHeaderSymmetry = false,
            //    ForwardedHeaders = ForwardedHeaders.All,
            //});




            app.MapControllers();
            app.MapRazorPages();

            app.Run();
        }

        //static private async void CreateRoles(IServiceProvider serviceProvider)
        //{
        //    //initializing custom roles 
        //    //var RoleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
        //    var UserManager = serviceProvider.GetRequiredService<UserManager<IdentityUser>>();
        //    //string[] roleNames = { "Admin", "Store-Manager", "Member" };
        //    //IdentityResult roleResult;

        //    //foreach (var roleName in roleNames)
        //    //{
        //    //    var roleExist = await RoleManager.RoleExistsAsync(roleName);
        //    //    // ensure that the role does not exist
        //    //    if (!roleExist)
        //    //    {
        //    //        //create the roles and seed them to the database: 
        //    //        roleResult = await RoleManager.CreateAsync(new IdentityRole(roleName));
        //    //    }
        //    //}

        //    // find the user with the admin email 
        //    var _user = await UserManager.FindByEmailAsync("admin@email.com");

        //    // check if the user exists
        //    if (_user == null)
        //    {
        //        //Here you could create the super admin who will maintain the web app
        //        var poweruser = new IdentityUser
        //        {
        //            UserName = "admin",
        //            Email = "admin@email.com",
        //            EmailConfirmed = true

        //        };
        //        string adminPassword = "admin";

        //        var createPowerUser = await UserManager.CreateAsync(poweruser, adminPassword);
        //        if (createPowerUser.Succeeded)
        //        {
        //            //here we tie the new user to the role
        //            //await UserManager.AddToRoleAsync(poweruser, "Admin");

        //        }
        //    }
        //}
    }
}

