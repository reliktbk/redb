using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using redb.Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using redb.Core;
using System;
using System.Globalization;
using System.Data;

namespace redb.WebApp
{
    public class Program
    {
        public static async Task Main(string[] args)
        {
            String? DB_TYPE = Environment.GetEnvironmentVariable("DB_TYPE")?.ToLower();
            String sqlInstance = "SQLite";
            sqlInstance = "MSSql".ToLower().Equals(DB_TYPE) ? "MSSql" : "Postgres".ToLower().Equals(DB_TYPE) ? "Postgres" : "SQLite";

            CultureInfo.DefaultThreadCurrentCulture = new CultureInfo("ru-Ru");

            WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            String IdentityConnectionString = builder.Configuration.GetConnectionString($"Identity{sqlInstance}Connection") ?? throw new InvalidOperationException("Connection string IdentitySQLiteConnection not found.");
            String RedbConnectionString = builder.Configuration.GetConnectionString($"Redb{sqlInstance}Connection") ?? throw new InvalidOperationException("Connection string RedbSQLiteConnection not found.");
            switch (sqlInstance)
            {
                case "SQLite":
                    builder.Services
                        .AddScoped<RedbContext, Core.SQLite.RedbContext>()
                        .AddScoped<IRedbService, Core.SQLite.RedbService>()
                        .AddDbContext<Core.SQLite.RedbContext>(options =>
                        {
                            options.UseLazyLoadingProxies().UseSqlite(RedbConnectionString);
                            options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
                        })
                        .AddDbContext<IdentityDbContext>(options => options.UseSqlite(IdentityConnectionString));
                    break;
                case "MSSql":
                    builder.Services
                        .AddScoped<RedbContext, Core.MSSql.RedbContext>()
                        .AddScoped<IRedbService, Core.MSSql.RedbService>()
                        .AddDbContext<Core.MSSql.RedbContext>(options =>
                        {
                            options.UseLazyLoadingProxies().UseSqlServer(RedbConnectionString);
                            options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
                        })
                        .AddDbContext<IdentityDbContext>(options => options.UseSqlServer(IdentityConnectionString));
                    break;
                case "Postgres":
                    builder.Services
                        .AddScoped<RedbContext, Core.Postgres.RedbContext>()
                        .AddScoped<IRedbService, Core.Postgres.RedbService>()
                        .AddDbContext<Core.Postgres.RedbContext>(options =>
                        {
                            options.UseLazyLoadingProxies().UseNpgsql(RedbConnectionString);
                            options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
                        })
                        .AddDbContext<IdentityDbContext>(options => options.UseNpgsql(IdentityConnectionString));
                    break;
            }

            builder.Services
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
            app.Environment.EnvironmentName = "Prodaction";
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
                app.UseHsts();
            }

            app.UseHttpsRedirection()
               .UseStaticFiles()
               .UseRouting()
               .UseAuthorization()
               .UseEndpoints(endpoints =>
               {
                   endpoints.MapGet("/Identity/Account/Register", context => Task.Factory.StartNew(() => context.Response.Redirect("/Identity/Account/Login", true, true)));
                   endpoints.MapPost("/Identity/Account/Register", context => Task.Factory.StartNew(() => context.Response.Redirect("/Identity/Account/Login", true, true)));
               });


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

