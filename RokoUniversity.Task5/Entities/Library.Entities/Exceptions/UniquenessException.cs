using System;

namespace Library.Entities.Exceptions
{
    public class UniquenessException : Exception
    {
        public UniquenessException() : base() {}
        public UniquenessException(string message) : base(message) { }
        public UniquenessException(string message, Exception inner) : base(message, inner) { }
    }
}
