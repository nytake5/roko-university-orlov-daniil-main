using System.Collections.Generic;
using Library.IRepositores;
using Library.Dto;
using Library.Entities;

namespace Library.FakeRepositories
{
    public class NewspapersRepository : INewspapersRepository
    {
        List<NotesDto> notes;
        public NewspapersRepository(List<NotesDto> notes)
        {
            this.notes = notes;
        }
        public bool CheckUniqueISSN(string ISSN)
        {
            foreach (var note in notes)
            {
                var newspaper = note as NewspaperDto;
                if (newspaper != null)
                {
                    if (newspaper.ISSN.Equals(ISSN))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public List<int> CheckUniqueNewspaper(string title, string publisher, int yearOfPublication)
        {
            var res = new List<int>();
            foreach (var note in notes)
            {
                var newspaper = note as NewspaperDto;
                if (newspaper != null)
                {
                    if (newspaper.Title.Equals(title) && newspaper.YearOfPublication == yearOfPublication && newspaper.Publisher.Equals(publisher))
                    {
                        res.Add(newspaper.ID);
                    }
                }
            }
            return res;
        }

        public NotesDto ConcretizeNewspaper(NotesDto note)
        {
            return note as NewspaperDto;
        }

        public List<NewspaperDto> FindNewspaperByTitle(string title)
        {
            var resList = new List<NewspaperDto>();
            foreach (var note in notes)
            {
                var newspaper = note as NewspaperDto;
                if (newspaper != null)
                {
                    if (newspaper.Title.Equals(title))
                    {
                        resList.Add(newspaper);
                    }
                }
            }
            return resList;
        }

        public List<Edition> GetExistingEditions()
        {
            throw new System.NotImplementedException();
        }

        public List<NewspaperDto> GetNewspaperByTitleAndPublisher(string title, string publisher)
        {
            throw new System.NotImplementedException();
        }

        public int InsertNewspaper(NewspaperDto notes)
        {
            notes.ID = this.notes.Count;
            this.notes.Add(notes);
            return this.notes.Count - 1;
        }

        public void UpdateNewspaper(NewspaperDto newspaperDto)
        {
            throw new System.NotImplementedException();
        }
    }
}
