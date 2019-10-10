Library Management System

Deployed Link: https://afternoon-refuge-71497.herokuapp.com/

Pre-Configured Admin Credentials:

email: admin@ncsu.edu

password: admin123

Admin Roles, Functionalities and Priviliges:

Log in with an email and password

Edit profile

Create/Modify Librarian or Student accounts

Create/Modify/Delete Libraries and Books.

View the list of users (students and librarians) and their profile details (except password)

View the list of books, along with detailed information.

View the list of book hold requests.

View the list of Checked out books.

View the list of students with books overdue (along with overdue fines).

View the borrowing history of each book.

Delete Student/Book/Librarian from the system


Librarian Functionalities and Priviliges:


Log in with email and password.

Edit their own profile to choose an existing library. Each librarian can only work for one library.

Edit library attributes.

Add/Remove books to/from a library.

View & Edit book information.

View all books.

View hold requests for any book in the library he/she works in.

For books in the special collection, accept or deny book hold request.

View list of all the books that are checked out from their library.

View the borrowing history of the books from their library.

View the list of students with overdue books from their library along with overdue fine.


Student Roles and Functionalities:


View the list of all the libraries

Edit profile to modify email, name and password only.

View all books

Check out/Request/Return a book from any library associated with their University.

Delete a reservation request, which has not been approved yet (pending).

View/Edit their account attributes (including changing their password).

Search through the books

Search by title

Search by author

Search by publication date

Search by subject

Bookmark a book they are interested in.

View their bookmarked books.

At any given time, a student can borrow a max of 'N' number of books based on their educational level.

View the overdue fines for his/her account.

Receive an email when any of their book request is sucessful.

USE CASES:

If the book is available, proceed to check out:

If the book is in Special Collection list, Librarian's approval list is required and student has to wait.
Otherwise, add the book to student's checked out list
If the book is unavailable or the student has checked out N books already, student is informed that the book is unavailable or max limit reached.
A book hold request is created if the student wants to continue requesting.
Number of hold requests is visible to every user

If there is no hold request for a book, the book is returned and the available count of the book is increased
If there is a pending hold request, the hold request is approved and the book is added to the checked out list of the requested student
and a mail is sent  to the student that the book is checked out.
