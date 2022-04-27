using Library.Dto;
using Library.IRepositores;
using System.Collections.Generic;

namespace Library.FakeRepositories
{
    public class AuthorsRepository : IAuthorsRepository
    {
        List<AuthorDto> authors;
        List<KeyValuePair<int, int>> booksToAuthors;
        List<KeyValuePair<int, int>> patentsToAuthors;
        public AuthorsRepository()
        {
            authors = new List<AuthorDto>();
            booksToAuthors = new List<KeyValuePair<int, int>>();
            patentsToAuthors = new List<KeyValuePair<int, int>>();
        }

        public bool CheckUniqueAuthors(List<AuthorDto> currAuthors, List<int> otherBooks, bool isBook)
        {
            return false;
        }

        public int FindAuthorByName(AuthorDto author)
        {
            foreach (var item in authors)
            {
                if (item.FirstName.Equals(author.FirstName) && item.LastName.Equals(author.LastName))
                {
                    return item.AuthorId;
                }
            }
            return -1;
        }

        public List<AuthorDto> GetAuthors()
        {
            return authors;
        }

        public List<AuthorDto> GetAuthorsByBooksIds(IEnumerable<int> enumerable)
        {
            var ids = (List<int>)enumerable;
            var resList = new List<AuthorDto>();
            foreach (var bookID_AuthorId in booksToAuthors)
            {
                if (ids.Contains(bookID_AuthorId.Key))
                {
                    resList.Add(authors[bookID_AuthorId.Value]);
                }
            }
            return resList;
        }

        public List<AuthorDto> GetAuthorsByPatentIds(IEnumerable<int> enumerable)
        {
            var ids = (List<int>)enumerable;
            var resList = new List<AuthorDto>();
            foreach (var patentID_AuthorID in patentsToAuthors)
            {
                if (ids.Contains(patentID_AuthorID.Key))
                {
                    resList.Add(authors[patentID_AuthorID.Value]);
                }
            }
            return resList;
        }

        public int InsertAuthor(AuthorDto author)
        {
            foreach (var a in authors)
            {
                if (a.FirstName.Equals(author.FirstName) && a.LastName.Equals(author.LastName))
                {
                    return a.AuthorId;
                }
            }
            author.AuthorId = authors.Count;
            authors.Add(author);
            return authors.Count - 1;
        }

        public void InsertBookToAuthor(int bookID, List<int> authorsID) 
        {
            foreach (var authorID in authorsID)
            {
                booksToAuthors.Add(new KeyValuePair<int, int>(bookID, authorID));
            }
        }

        public void InsertPatentToAuthor(int patentID, List<int> authorsID)
        {
            foreach (var authorID in authorsID)
            {
                patentsToAuthors.Add(new KeyValuePair<int, int>(patentID, authorID));
            }
        }

        public void RemoveRelationshipBook(int iD, List<int> deletedAuthorId)
        {
            throw new System.NotImplementedException();
        }

        public void RemoveRelationshipPatent(int iD, List<int> deletedAuthorId)
        {
            throw new System.NotImplementedException();
        }
    }
}
