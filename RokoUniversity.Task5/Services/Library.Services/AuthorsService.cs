using AutoMapper;
using Library.Entities;
using Library.Dto;
using Library.IRepositores;
using Library.IServices;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;

namespace Library.Services
{
    public class AuthorsService : IAuthorsService
    {
        private readonly ILogger<AuthorsService> _logger;
        private readonly IAuthorsRepository _authorsRepository;
        private readonly IMapper _mapper;
        public AuthorsService(ILogger<AuthorsService> logger, IMapper mapper, IAuthorsRepository authorsRepository)
        {
            _logger = logger;
            _authorsRepository = authorsRepository;
            _mapper = mapper;
        }
        public List<Author> GetAuthors()
        {
            return _mapper.Map<List<Author>>(_authorsRepository.GetAuthors());
        }

        public int InsertAuthor(Author author)
        {
            return _authorsRepository.InsertAuthor(_mapper.Map<AuthorDto>(author));
        }
    }
}
