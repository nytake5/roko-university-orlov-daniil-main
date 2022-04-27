using System;
using System.Collections.Generic;
using System.Linq;

namespace Library.Entities
{
    public class Patent : Notes
    {
        public DateTime DateOfApplicationSubmission { get; set; } 
        public DateTime DateOfPublication { get; set; }
        public int Number { get; set; }
        public List<Author> Authors { get; set; }

        public override NotesType GetNoteType() => NotesType.Patent;

        public override string ToString()
        {
            return $"{ID} {Environment.NewLine}" +
                $"  {Title} {Environment.NewLine}" +
                $"  {DateOfPublication} {Environment.NewLine}" +
                $"  {DateOfApplicationSubmission} {Environment.NewLine}" +
                $"  {Number} {Environment.NewLine}" +
                $"  {Description} {Environment.NewLine}" 
                + Authors.First().ToString();
        }
    }
}
