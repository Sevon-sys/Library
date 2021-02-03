USE LibraryDB

--SELECT * FROM Book WHERE published >= '2000-01-01' AND published <= '2000-12-31' ORDER BY Book.title
--SELECT Book.published FROM Book INNER JOIN Author ON Book.author = Author.id AND Author.name = 'Adam Adamsson'
--SELECT COUNT(book) FROM LibraryCard
--SELECT Book.title, LibraryCard.[name] FROM LibraryCard INNER JOIN Book ON LibraryCard.book = Book.id