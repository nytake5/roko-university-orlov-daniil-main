using Library.Dto;
using Library.Entities;
using System.Collections.Generic;

namespace Library.IRepositores
{
    public interface INotesRepository
    {
        int InsertNotes(NotesDto notes);
        bool RemoveNotes(int notesID);
        List<NotesDto> SortByDate(bool descending = false);
        List<NotesDto> GroupByYearOfPublication();
        NotesDto GetNote(int id);
        List<NotesDto> GetNotes();
        void UpdateNote(NotesDto note);
        List<NotesDto> GetNotesSkipTake(int recSkip, int pageSize);
        int GetNotesCount();
        List<NotesDto> FindByTitleSkipTake(string title, int recSkip, int pageSize);
    }
}
