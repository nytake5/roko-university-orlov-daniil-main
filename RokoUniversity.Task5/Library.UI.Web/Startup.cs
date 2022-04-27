using AutoMapper;
using Library.IRepositores;
using Library.IServices;
using Library.Repositories;
using Library.Services;
using Library.UI.Web.Infrastructure;
using LibraryServices;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Library.UI.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var connectionString = Configuration.GetConnectionString("DefaultConnection");

            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(options => 
                {
                    options.LoginPath = "/Account/Login";
                    options.AccessDeniedPath = "/Account/Login";
                });
            services.AddAuthorization();

            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MappingProfile());
            });
            IMapper mapper = mappingConfig.CreateMapper();
            services.AddSingleton(mapper);

            services.AddSingleton(new DBOptions() { ConnectionString = connectionString });
            services.AddTransient<IAuthorsService, AuthorsService>();
            services.AddTransient<INotesService, NotesService>();
            services.AddTransient<IUserService, UserService>();

            services.AddTransient<IAuthorsRepository, AuthorsRepository>();
            services.AddTransient<INotesRepository, NotesRepository>();
            services.AddTransient<IBooksRepository, BooksRepository>();
            services.AddTransient<INewspapersRepository, NewspapersRepository>();
            services.AddTransient<IPatentsRepository, PatentsRepository>();
            services.AddTransient<IUserRepository, UserRepository>();
            
            services.AddScoped<AuditLogActionFilter>();
            services.AddControllersWithViews(options =>
            {
                options.Filters.Add<ExceptionFilter>();
            });

            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseDurationLogger();
            app.UseRequestBodyLogger();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Notes}/{action=Index}/{id?}");
            });
        }
    }
}
