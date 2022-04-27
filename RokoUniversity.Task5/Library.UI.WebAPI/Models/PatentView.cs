using Library.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace Library.UI.WebAPI.Models
{
    public class PatentView : NoteView
    {
        [DisplayName("Date of application submission")]
        public DateTime DateOfApplicationSubmission { get; set; }
        
        [DisplayName("Date of publication")]
        public DateTime DateOfPublication { get; set; }

        public int Number { get; set; }

        public List<AuthorView> Authors { get; set; }

        [DisplayName("Number")]
        public override string Identity() => Number.ToString();

        public override string GetInfo { 
            get
            {
                return $"{Title} от {DateOfPublication.ToShortDateString()}";
            }
        } 

        public string AuthorsToString()
        {
            string res = ""; //I proceeded from the logic that with small operations string does not lose Stringbuilder
            foreach (var author in Authors)
            {

                if (author.Equals(Authors.Last()))
                {
                    res += author.Name;
                }
                else
                {
                    res += author.Name + ", "; 
                }
            }
            return res;
        }

        public override string NotesType => "Patent";
    }
}
