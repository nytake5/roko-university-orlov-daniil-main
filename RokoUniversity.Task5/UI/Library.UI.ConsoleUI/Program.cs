using AutoMapper;
using Library.IRepositores;
using Library.IServices;
using Library.Repositories;
using Library.Services;
using LibraryServices;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Library.UI.ConsoleUI
{
    class Program
    {
        static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        private static IHostBuilder CreateHostBuilder(string[] args)
        {
            return Host.CreateDefaultBuilder(args)
                .ConfigureServices((hostingContext, services) =>
                {
                    IConfiguration configuration = hostingContext.Configuration;
                    var connectionString = configuration.GetConnectionString("DefaultConnection");

                    var mappingConfig = new MapperConfiguration(mc =>
                    {
                        mc.AddProfile(new MappingProfile());
                    });
                    IMapper mapper = mappingConfig.CreateMapper();
                    services.AddSingleton(mapper);

                    services.AddSingleton(new DBOptions() { ConnectionString = connectionString });
                    services.AddTransient<IAuthorsService, AuthorsService>();
                    services.AddTransient<INotesService, NotesService>();

                    services.AddTransient<IAuthorsRepository, AuthorsRepository>();
                    services.AddTransient<INotesRepository, NotesRepository>();
                    services.AddTransient<IBooksRepository, BooksRepository>();
                    services.AddTransient<INewspapersRepository, NewspapersRepository>();
                    services.AddTransient<IPatentsRepository, PatentsRepository>();

                    services.AddHostedService<Worker>();
                });
        }
    }
}
