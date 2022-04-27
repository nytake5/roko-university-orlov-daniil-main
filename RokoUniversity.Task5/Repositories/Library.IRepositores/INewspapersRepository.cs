using Library.Dto;
using Library.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.IRepositores
{
    public interface INewspapersRepository
    {
        List<NewspaperDto> FindNewspaperByTitle(string title);
        List<int> CheckUniqueNewspaper(string title, string publisher, int yearOfPublication);
        bool CheckUniqueISSN(string ISSN);
        int InsertNewspaper(NewspaperDto newspaper);
        NotesDto ConcretizeNewspaper(NotesDto note);
        List<NewspaperDto> GetNewspaperByTitleAndPublisher(string title, string publisher);
        List<Edition> GetExistingEditions();
        void UpdateNewspaper(NewspaperDto newspaperDto);
    }
}
