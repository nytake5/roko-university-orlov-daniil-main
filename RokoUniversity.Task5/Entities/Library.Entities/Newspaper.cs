using System;
using System.Text.RegularExpressions;

namespace Library.Entities
{
    public class Newspaper : Notes
    {
        private string _publisher;
        public string Publisher
        {
            get
            {
                return _publisher;
            }
            set
            {   
                _publisher = value;
            }
        }

        private int _yearOfPublication;
        public int YearOfPublication
        {
            get
            {
                return _yearOfPublication;
            }
            set
            {
                if (value > DateTime.Now.Year)
                {
                    throw new ArgumentException("The book can't be released in the future!");
                }
                _yearOfPublication = value;
            }
        }
        public int? IssueNumber { get; set; }

        private string? _issn;  
        public string? ISSN 
        {
            get
            {
                return _issn;
            }
            set
            {
                if (value == null)
                {
                    _issn = null;
                    return;
                }
                if (!CheckISSN(value))
                {
                    throw new ArgumentException("Incorrectly entered ISBN");
                }
                _issn = value;
            }
        }

        private bool CheckISSN(string value)
        {
            return Regex.IsMatch(value, @"^[0-9]{4}-[0-9]{3}[0-9xX]$");
        }

        public override NotesType GetNoteType() => NotesType.Newspaper;

        public override string ToString()
        {
            return $"{ID} {Environment.NewLine}" +
                $"  {Title} {Environment.NewLine}" +
                $"  {Publisher} {Environment.NewLine}" +
                $"  {YearOfPublication} {Environment.NewLine}" +
                $"  {ISSN ?? "Noone"} {Environment.NewLine}" +
                $"  {Description}";
        }
    }
}
