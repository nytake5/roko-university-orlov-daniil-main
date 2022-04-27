using Library.Dto;
using Library.Entities;
using System.Collections.Generic;

namespace Library.IRepositores
{
    public interface IAuthorsRepository
    {
        int InsertAuthor(AuthorDto author);
        List<AuthorDto> GetAuthors();
        List<AuthorDto> GetAuthorsByBooksIds(IEnumerable<int> enumerable);
        List<AuthorDto> GetAuthorsByPatentIds(IEnumerable<int> enumerable);
        void InsertBookToAuthor(int bookID, List<int> authorsID);
        void InsertPatentToAuthor(int patentID, List<int> authorsID);
        int FindAuthorByName(AuthorDto author);
        bool CheckUniqueAuthors(List<AuthorDto> currAuthors, List<int> otherBooks, bool isBook);
        void RemoveRelationshipBook(int BookID, List<int> deletedAuthorId);
        void RemoveRelationshipPatent(int PatentID, List<int> deletedAuthorId);
    }
}
