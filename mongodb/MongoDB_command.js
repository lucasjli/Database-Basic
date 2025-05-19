// 17. Display the book title and names of the author(s) for the book with ID 4
db.books.find(
    {"book_id": 4},
    {
      "title": 1,
      "authors.first_name": 1,
      "authors.last_name": 1,
      "_id": 0
    }
);

// 18. Display all Fiction books
db.books.find(
    {"category": "Fiction"},
    {"_id": 0}
);

// 19. Display all Fiction and History books
db.books.find(
    {
      "category":
          {$in: ["Fiction", "History"]}
    }
);

// 20.Sort books by price (high to low)
db.books.find().sort({ "price": -1 });

// 21.Display all book titles written by Robert Gates
db.books.find(
  { 
    authors: { 
      $elemMatch: { first_name: "Robert", last_name: "Gates" } 
    }
  },
  { title: 1, _id: 0 }
);

// 22. Display all book titles written by Robert Gates or Markus Zusak
db.books.find(
  { 
    $or: [
      { authors: { $elemMatch: { first_name: "Robert", last_name: "Gates" } } },
      { authors: { $elemMatch: { first_name: "Markus", last_name: "Zusak" } } }
    ]
  },
  { title: 1, _id: 0 }
);

// 23.Find the names of all authors who have written more than one book
db.books.aggregate([
  { $unwind: "$authors" },
  { 
    $group: { 
      _id: { first_name: "$authors.first_name", last_name: "$authors.last_name" },
      book_count: { $sum: 1 }
    } 
  },
  { $match: { book_count: { $gt: 1 } } },
  { 
    $project: { 
      _id: 0, 
      first_name: "$_id.first_name", 
      last_name: "$_id.last_name" 
    } 
  }
]);

// 24. Find all books published in or after the year 2010
db.books.aggregate([
  { $unwind: "$publishers" },
  { 
    $match: { 
      "publishers.publish_date": { $gte: ISODate("2010-01-01T00:00:00.000Z") }
    } 
  },
  { 
    $project: { 
      _id: 0, 
      title: 1,
      publish_date: "$publishers.publish_date" 
    } 
  }
]);

// 25.Find all books with a price less than $10, sorted by price in ascending order.
db.books.aggregate([
  { 
    $match: { 
      "price": { $lt: 10 }
    } 
  },
  { 
    $project: { 
      _id: 0, 
      title: 1,
      price: 1
    } 
  },
  { 
    $sort: { price: 1 }
  }
]);




