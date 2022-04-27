using Library.Entities;
using System.Collections.Generic;

namespace Library.IServices
{
    public interface IAuthorsService
    {
        int InsertAuthor(Author  author);
        List<Author> GetAuthors();
    }
}
