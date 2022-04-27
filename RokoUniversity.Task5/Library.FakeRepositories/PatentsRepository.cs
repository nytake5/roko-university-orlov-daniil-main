using Library.Dto;
using Library.IRepositores;
using System.Collections.Generic;

namespace Library.FakeRepositories
{
    public class PatentsRepository : IPatentsRepository
    {
        List<NotesDto> notes;
        public PatentsRepository(List<NotesDto> notes)
        {
            this.notes = notes;
        }
        public List<int> CheckUniquePatent(int number, string country)
        {
            var res = new List<int>();
            foreach (var note in notes)
            {
                var patent = note as PatentDto;
                if (patent != null)
                {
                    if (patent.Number == number && patent.PlaceOfPublication.Equals(country))
                    {
                        res.Add(patent.ID);
                    }
                }
            }
            return res;
        }

        public NotesDto ConcretizePatent(NotesDto note)
        {
            return note as PatentDto;
        }
        public List<PatentDto> FindPatentByTitle(string title)
        {
            var resList = new List<PatentDto>();
            foreach (var note in notes)
            {
                var patent = note as PatentDto;
                if (patent != null)
                {
                    if (patent.Title.Equals(title))
                    {
                        resList.Add(patent);
                    }
                }
            }
            return resList;
        }

        public List<PatentDto> FindPatentsByInnovator(int authorID)
        {
            var resList = new List<PatentDto>();
            foreach (var note in notes)
            {
                var patent = note as PatentDto;
                if (patent != null)
                {
                    if (patent.PatentID == authorID)
                    {
                        resList.Add(patent);
                    }
                }
            }
            return resList;
        }

        public int InsertPatent(PatentDto notes)
        {
            notes.ID = this.notes.Count;
            this.notes.Add(notes);
            return this.notes.Count - 1;
        }

        public void UpdatePatent(PatentDto patentDto)
        {
            throw new System.NotImplementedException();
        }
    }
}
