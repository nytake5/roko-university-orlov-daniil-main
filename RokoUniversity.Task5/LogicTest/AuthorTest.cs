using Library.Entities;
using NUnit.Framework;
using System;

namespace LogicTest
{
    class AuthorTest
    {

        [Test]
        [TestCase("Lev", "Tolstoi")]
        [TestCase("Aleksand", "Pushkin")]
        [TestCase("Mihail", "Bulgakov")]
        [TestCase("Abas", "Mahmud al-Assad")]
        public void CreateAuthorTestTrue(string firstname, string lasname)
        {
            Assert.DoesNotThrow(() => MethodThatDoesntThrows());

            void MethodThatDoesntThrows()
            {
                var author = new Author()
                {
                    FirstName = firstname,
                    LastName = lasname,
                };
            }
        }

        [Test]
        [TestCase("LevЛев", "Tolstoi")]
        [TestCase("Lev", "TolstoiТолстой")]
        [TestCase("ABu", "Mihnaф")]
        public void CreateAuthorTestFalse(string firstname, string lasname)
        {

            Assert.Throws<ArgumentException>(() => MethodThatThrows());

            void MethodThatThrows()
            {
                new Author()
                {
                    FirstName = firstname,
                    LastName = lasname,
                };
            }
        }
    }
}
