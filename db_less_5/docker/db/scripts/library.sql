CREATE TABLE "reader" (
  "id" int PRIMARY KEY,
  "firstName" varchar,
  "lastName" varchar,
  "address" varchar,
  "birthday" int
);

CREATE TABLE "book" (
  "isbn" varchar PRIMARY KEY,
  "year" int,
  "name" varchar,
  "author" varchar,
  "pagesNumber" int
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "copy" (
  "isbn" varchar UNIQUE NOT NULL,
  "number" varchar UNIQUE NOT NULL,
  "shelfPlace" int,
  PRIMARY KEY (isbn, number)
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY,
  "parent" varchar
);

CREATE TABLE "rental" (
  "id" int PRIMARY KEY,
  "readerId" int,
  "copyIsbn" varchar,
  "copyNumber" varchar,
  "returnDate" int
);

CREATE TABLE "category_book" (
  "category_name" varchar NOT NULL,
  "book_isbn" varchar NOT NULL,
  PRIMARY KEY ("category_name", "book_isbn")
);

ALTER TABLE "category_book" ADD FOREIGN KEY ("category_name") REFERENCES "category" ("name");

ALTER TABLE "category_book" ADD FOREIGN KEY ("book_isbn") REFERENCES "book" ("isbn");


ALTER TABLE "copy" ADD FOREIGN KEY ("number") REFERENCES "book" ("isbn");

ALTER TABLE "book" ADD FOREIGN KEY ("isbn") REFERENCES "publisher" ("name");

ALTER TABLE "category" ADD FOREIGN KEY ("parent") REFERENCES "category" ("name");

ALTER TABLE "rental" ADD FOREIGN KEY ("readerId") REFERENCES "reader" ("id");

ALTER TABLE "rental" ADD FOREIGN KEY ("copyIsbn") REFERENCES "copy" ("isbn");

ALTER TABLE "rental" ADD FOREIGN KEY ("copyNumber") REFERENCES "copy" ("number");
