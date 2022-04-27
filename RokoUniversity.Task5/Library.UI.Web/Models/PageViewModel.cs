using System;

namespace Library.UI.Web.Models
{
    public class PageViewModel
    {
        public int TotalItems { get; private set; }
        public int TotalPages { get; private set; }
        public int CurrentPage { get; private set; }
        public int PageSize { get; private set; }
        public int StartPage { get; private set; }
        public int EndPage { get; private set; }

        public PageViewModel() { }

        public PageViewModel(int totalItems, int currentPage, int pageSize = 20)
        {
            TotalPages = (int)Math.Ceiling((double)totalItems / pageSize);
            CurrentPage = currentPage;

            StartPage = currentPage - 3;
            EndPage = currentPage + 3;

            if (StartPage <= 0)
            {
                EndPage = EndPage - StartPage + 1;
                StartPage = 1;
            }

            if (EndPage > TotalPages)
            {
                EndPage = TotalPages;
                if (EndPage > 6)    
                {
                    StartPage = EndPage - 6;
                }
            }

            TotalItems = totalItems;
            PageSize = pageSize;
        }
    }
}
