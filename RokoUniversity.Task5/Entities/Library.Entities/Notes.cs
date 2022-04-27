using System;

namespace Library.Entities
{
    public abstract class Notes
    {
        public int ID { get; set; }

        private string _title;
        public string Title 
        {
            get 
            {
                return _title;
            }
            set
            {
                _title = value;
            }
        }
        private string _description;
        public string Description 
        {
            get
            {
                return _description;
            }
            set
            {
                if (value.Length > 2000)
                {
                    throw new ArgumentException("You have entered a description that is too long!");
                }
                _description = value;
            }
        }

        private int _pageCount;
        public int PageCount {
            get
            {
                return _pageCount;            
            }
            set
            {
                if (value < 1)
                {
                    throw new ArgumentException("Something strange is entered instead of the Page count");
                }
                _pageCount = value;
            }
        }

        private  string _placeOfPublication;
        public string PlaceOfPublication 
        {
            get 
            {
                return _placeOfPublication;
            } 
            set
            {
                if (!ValiidationPlaceOfPublication(value))
                {
                    throw new ArgumentException("Something strange is entered instead of the Place of publication");
                }
                _placeOfPublication = value;
            }
        }
        public abstract NotesType GetNoteType();

        private static bool ValiidationPlaceOfPublication(string value)
        {
            if (value.Length == 0)
            {
                return false;
            }
            if (!value.ConsistOnly()) 
            {
                return false;
            }
            return !(value.Length > 200 || char.IsLower(value[0]) || value[0].Equals("-") || value[^1].Equals("-")
                || (value[0].Equals("-") && char.IsLower(value[1])));
        }
    }
}
