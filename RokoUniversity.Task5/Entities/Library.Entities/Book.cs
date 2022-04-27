using System;
using System.Collections.Generic;
using System.Linq;

namespace Library.Entities
{
    public class Book : Notes
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
        private string? _isbn;
        public string? ISBN 
        {
            get
            {
                return _isbn;
            }
            set
            {
                if (value == null)
                {
                    _isbn = null;
                    return;
                }
                if (!CheckISBN(value))
                {
                    throw new ArgumentException("Incorrectly entered ISBN");
                }
                _isbn = value;
            }
        }
        public List<Author> Authors { get; set; }
        public override NotesType GetNoteType() => NotesType.Book;
        public override string ToString()
        {
            return $"{ID} {Environment.NewLine}" +
                $"  {Title} {Environment.NewLine}" +
                $"  {Publisher} {Environment.NewLine}" +
                $"  {PlaceOfPublication} {Environment.NewLine}" +
                $"  {YearOfPublication} {Environment.NewLine}" +
                $"  {ISBN ?? "Noone"} {Environment.NewLine}" +
                $"  {Description} {Environment.NewLine}" 
                + Authors.First().ToString();
        }

        private bool CheckISBN(string isbn)
        {
            List<int> digits = new List<int>();
            for (int i = 0; i < isbn.Length; i++)
            {
                int dg;
                if (int.TryParse((isbn[i].ToString()), out dg))
                {
                    digits.Add(dg);
                }
            }
            if (digits.Count != 10)
            {
                return false;
            }
            int s = 0, t = 0;
            for (int i = 0; i < 10; i++)
            {
                t += digits[i];
                s += t;
            }
            return s % 11 == 0;
        }
    }
}
