# COMPX575- Task Four
Due on **Friday the 21st March at midday**. 

# Task Goal
Gain experience using MySQL and MongoDB.

## Preamble
1. Fork this repository using the button at the top of the project page.
2. Make sure that the visibility of your project is private. (Settings > expand Permissions > Project visibility: Private; Save changes).  *Note: Class teachers and tutors will still have read access to your project for marking purposes.*
3. Clone the new repository to your computer using Git.  Store the repository in your COMPX575 directory.
4. Remember to commit and push regularly as you work on the project!  

## Useful Resources
Useful links for learning to use MySQL:
* https://www.tutorialspoint.com/mysql/index.htm
* https://dev.mysql.com/doc/en/

Useful links for using MongoDB:
* https://docs.mongodb.org/getting-started/shell
* https://docs.mongodb.org/manual/reference/operator


### Part One: MySQL
#### Connecting to the MySQL Server


1. For an initial MySQL password you need to know the uid. Once you know the uid the initial password will be my(uid)SQL. 

To find a uid you can log into a Linux Lab computer and then run the id command Using myself as an example

lab-rg06-01:[101]~>id
uid=12345(sapnaj) gid=12345(sapnaj)

This means my initial MySQL password is my12345sql

2. Open a terminal and run *mysql -h learn-mysql.cms.waikato.ac.nz -u $USER -p -D $USER*
```
-h specifies the host to connect to
-u $USER specifies the MySQL user to be the same as your computer username
-p will read a password from the terminal
-D specifies the name of the database (each student has a database with the same name as their username)
```
Lets say we have a user  cy154, this means that this user should use the initial password of my12345sql with the command 
mysql -h learn-mysql -u cy154 -p cy154

3. Change your password if you want to.
```
SET PASSWORD = PASSWORD('your new password')
```
**Make sure not to include your password in your task hand-in!**

4. Type *SELECT 1 + 1;*.  What happens?
5. Type *quit* or *Ctrl+D* to exit the MySQL server.
6. If you do not want to type your password each time then you can create a option file *.my.cnf* in your home directory containing
```
[client]
password="your new password"
```
**If you do this, make sure only you can access the option file using the command *chmod og-rwx ~/.my.cnf***

Having done step six, you can now remove the -p option from the mysql commands and you will be logged in without typing your password.  On the lab machines the command can be further shortened to *mysql -h mysql -D $USER*.

#### Working with the MySQL Server
7. Open *books.sql* in a text editor and take a look.
8. Execute the SQL script to populate your database:
```
mysql -h learn-mysql.cms.waikato.ac.nz -u $USER -p -D $USER < books.sql
```
9. Log into the MySQL server again:
```
mysql -h learn-mysql.cms.waikato.ac.nz -u $USER -p -D $USER
```
10. Run and try to understand the statements in books-queries.sql

For the following exercises, save your SQL statements in mysql-exercises.sql

#### Creating tables
11. Create a publisher table called *comp575_publishers* that has four columns: publisher\_id, publisher\_name, publisher\_country and publisher\_website
12. Insert three publishers:
    * Publisher: Alfred A. Knopf, Country: us, Website: knopf.knopfdoubleday.com
    * Publisher: Victor Gollancz, Country: uk, Website: www.gollancz.co.uk
    * Publisher: Henry Holt and Company, Country: us. Website: us.macmillian.com/henryholt.aspx

#### Updating table content
13. Add a new column to *comp575_books* called *publisher_id*.
14. Insert the publisher for each book:
    * The books written by Markus Zusak and Robert Gates were published by Alfred A. Knopf
    * Brandon Sanderson's books were published by Victor Gollancz
    * Catherine Chidgey's books were published by Henry Holt and Company
(you may use *UPDATE* statements with hard-coded IDs)
15. Add a new column into *comp575_books* called *publish_date* with an appropriate data type (*DATE, TIMESTAMP or DATETIME*)
16. Insert the publish date for each book:

| Book ID | Publish Date |
| ------ | ------ |
| 1 | Sep 11, 2007 |
| 2 | May 9, 2006 |
| 3 | Mar 4, 2014 |
| 4 | Jan 8, 2013 |
| 5 | Sep 24, 2013 |
| 6 | Jan 14, 2010 |
| 7 | Jan 9, 2007 |
| 8 | May 1, 1998 |
| 9 | Jun 13, 2006 |

17. Update book prices to give a 5% discount.

#### Using *SELECT* statements
18. Display the book id, title and author name where the *book_id* is *2*
19. Display the number of books by each author (use _COUNT(*)_ and *GROUP BY*)
20. Display all book titles written by Robert Gates or Markus Zusak (you may hard code their author IDs)
21. Display all book titles NOT written by a New Zealand writer
22. Display the author who has written more than two books
23. Display all book titles and publish dates, ordered by publish date (newest first)
24. Display book titles and publish dates of books published in 2006 and 2007
25. Display all book titles that contain the string "Memo"
26. Display all book titles that comprise at least three words
27. Use *UNION* to display authors' and publishers' websites as a single result set
28. Display books whose author and publisher are from the same country


### Part Two: MongoDB
#### Using MongoDB
1. Sign up on Mongodb Atlas at https://www.mongodb.com/cloud/atlas/register. You can sign up using your Google account or you can also register using your email address.
2. After signup process, you login using the credentials. 
3. Create a new project "COMPX575-TASK4".
4. Create a clustor "TASK4-MONGODB" and make sure you use a FREE configuration option.
5. Add a connection IP address and then create a database user. Copy and save the password as you will need that everytime.
6. Now you need to choose a connection method. You can use compass (that you will need to download and run).
7. Open the MongoDB Compass and enter the connection string that you have copied from the MongoDB Atlas. You have you to replace the password with your password. 
8. After successfully connecting the clustor, you should now create a database (database name should be your username eg. sj222) and provide a collection name "books".
9. After creating a database, you will be imprting data (books.json as provided on gitlab under MongoDB folder). You should see *imported 7 documents* in the resulting output.
10. Open MongoDB Shell and type *use \<username\>*, substituting your username, into the mongo shell.  This changes your currently selected database.
11. Have a look at the content of your *books* collection with the following command: *db.books.find()*
12. Let's make that more readable: *db.books.find().pretty()*
13. Display the book with ID 1: *db.books.find({"book_id": 1});*
10. Display the book nicely: *db.books.find({"book_id": 1}).pretty();*
11. Display all the books: *db.books.find().pretty();*
12. Query the title of the book with ID 5: *db.books.find({"book_id": 5}, {"title": 1});* The second argument is called a projection, and controls which fields are returned.  Setting a field to *1* in the projection selects it in the results.
13. Query the title and author's country of books not written by a New Zealand writer: *db.books.find({"authors.country": {$ne: "nz"}}, {"title": 1, "authors.country": 1});*
*$ne* is called an operator in MongoDB, and means "not equal to".  You can find other operators in the useful resources above.
14. Insert a new book:
```
db.books.insert({
    "book_id": 8,
    "title": "In a Fishbone Church",
    "category": "Literary",
    "price": 9.17,
    "authors": [
        {
            "first_name": "Catherine",
            "last_name": "Chidgey",
            "country": "nz",
            "website": "http://www.bookcouncil.org.nz/writers/chidgey.html"
        }
    ],
    "publishers": [
        {
            "publish_date": ISODate("1998-05-01T00:00:00Z"),
            "name": "Henry Holt and Company, LLC",
            "country": "us",
    "website": "us.macmillan.com/henryholt.aspx"
        }
    ]
});
```

15. Update a book:
```
db.books.update({"book_id": 8}, {$set: { "price": 1000.00 }});
db.books.find({"book_id": 8});
```

16. Delete a book:
```
db.books.remove({"book_id": 8}, {justOne: true});
db.books.find({"book_id": 8});
```

Write the following queries:
17. Display the book title and names of the author(s) for the book with ID 4
18. Display all Fiction books
19. Display all Fiction and History books
// Hint: Use the $in operator
// (https://docs.mongodb.com/manual/reference/operator/query/in/)

20. Sort books by price (high to low)
// See https://docs.mongodb.com/manual/reference/method/cursor.sort/#examples

21. Display all book titles written by Robert Gates
// Hint: What if there are multiple authors?
// See https://docs.mongodb.com/manual/tutorial/query-array-of-documents/

22. Display all book titles written by Robert Gates or Markus Zusak
23. Find the names of all authors who have written more than one book.
24. Find all books published in or after the year 2010.
25. Find all books with a price less than $10, sorted by price in ascending order.



## Grading
This task is worth as much as 5% of your final grade and is marked out of 5.
* Part One is worth 2.5 mark.
* Part Two is worth 2.5 mark.


## Submission
On top of the commits to your Git repository, please upload your source files to moodle.
