using Library.Dto;
using System.Collections.Generic;

namespace Library.IRepositores
{
    public interface IPatentsRepository
    {
        List<PatentDto> FindPatentByTitle(string title);
        List<int> CheckUniquePatent(int number, string country);
        int InsertPatent(PatentDto patent);
        List<PatentDto> FindPatentsByInnovator(int authorID);
        NotesDto ConcretizePatent(NotesDto note);
        void UpdatePatent(PatentDto patentDto);
    }
}
