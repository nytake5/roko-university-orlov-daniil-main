using AutoMapper;
using Library.Entities;
using Library.Dto;

namespace Tests.LogicTest
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
        }
    }
}
