using AutoMapper;
using Library.Entities;
using Library.Dto;
using Library.UI.WebAPI.Models;

namespace Library.UI.WebAPI
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Author, AuthorDto>();
            CreateMap<AuthorDto, Author>();
            CreateMap<Book, BookDto>()
                .ForMember(b => b.Type, o => o.MapFrom(x => x.GetNoteType()));
            CreateMap<BookDto, Book>()
                .ForMember(b => b.ID, o => o.MapFrom(x => x.ID));
            CreateMap<Patent, PatentDto>()
                .ForMember(p => p.Type, o => o.MapFrom(x => x.GetNoteType()))
                .ForMember(p => p.YearOfPublication, o => o.MapFrom(x => x.DateOfPublication.Year));
            CreateMap<PatentDto, Patent>()
                .ForMember(p => p.ID, o => o.MapFrom(x => x.ID));
            CreateMap<Newspaper, NewspaperDto>()
                .ForMember(n => n.Type, o => o.MapFrom(x => x.GetNoteType()));
            CreateMap<NewspaperDto, Newspaper>()  
                .ForMember(p => p.ID, o => o.MapFrom(x => x.ID));

            CreateMap<Author, AuthorView>();
            CreateMap<AuthorView, Author>();
            CreateMap<Book, BookView>()
                .ForMember(b => b.Authors, o => o.Ignore())
                .ForMember(b => b.ID, o => o.MapFrom(x => x.ID));
            CreateMap<BookView, Book>()
                .ForMember(b => b.Authors, o => o.Ignore());
            CreateMap<Newspaper, NewspaperView>()
                .ForMember(b => b.ID, o => o.MapFrom(x => x.ID)); 
            CreateMap<NewspaperView, Newspaper>();
            CreateMap<Patent, PatentView>()
                .ForMember(b => b.Authors, o => o.Ignore())
                .ForMember(b => b.ID, o => o.MapFrom(x => x.ID));  
            CreateMap<PatentView, Patent>()
                .ForMember(b => b.Authors, o => o.Ignore());
        }
    }
}
