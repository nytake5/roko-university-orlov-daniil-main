using Library.Dto;
using Library.Entities;
using Library.IRepositores;
using System.Collections.Generic;

namespace Library.FakeRepositories
{
    public class NotesRepository : INotesRepository
    {
        public List<NotesDto> notes;
        public NotesRepository(List<NotesDto> notes)
        {
            this.notes = notes;
        }

        public NotesDto GetNote(int id)
        {
            return notes[id];
        }

        public List<NotesDto> GetNotes()
        {
            return notes;
        }

        public int GetNotesCount()
        {
            throw new System.NotImplementedException();
        }

        public List<NotesDto> GetNotesSkipTake(int recSkip, int pageSize)
        {
            throw new System.NotImplementedException();
        }

        public List<NotesDto> GroupByYearOfPublication()
        {
            return notes;
        }

        public int InsertNotes(NotesDto notes)
        {
            return 0;
        }

        public bool RemoveNotes(int notesID)
        {
            NotesDto note = null;
            foreach (var item in notes)
            {
                if (item.ID == notesID)
                {
                    note = item;
                }
            }
            return notes.Remove(note);
        }

        public List<NotesDto> SortByDate(bool descending = false)
        {
            notes.Sort();
            if (descending)
            {
                notes.Reverse();
            }
            return notes;
        }

        public void UpdateNote(NotesDto note)
        {
            throw new System.NotImplementedException();
        }
    }
}
