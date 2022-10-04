CREATE TABLE "station" (
  "number" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "room" (
  "number" int PRIMARY KEY,
  "beds" int
);

CREATE TABLE "stationPersonell" (
  "number" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "doctor" (
  "id" int PRIMARY KEY,
  "area" varchar,
  "doctorRank" varchar
);

CREATE TABLE "caregiver" (
  "id" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "patient" (
  "number" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar
);

CREATE TABLE "admission" (
  "id" int PRIMARY KEY,
  "from" int,
  "to" int
);

ALTER TABLE "stationPersonell" ADD FOREIGN KEY ("number") REFERENCES "station" ("number");

ALTER TABLE "room" ADD FOREIGN KEY ("number") REFERENCES "station" ("number");

ALTER TABLE "doctor" ADD FOREIGN KEY ("id") REFERENCES "stationPersonell" ("number");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("id") REFERENCES "stationPersonell" ("number");

ALTER TABLE "patient" ADD FOREIGN KEY ("number") REFERENCES "doctor" ("id");

ALTER TABLE "admission" ADD FOREIGN KEY ("id") REFERENCES "room" ("number");

ALTER TABLE "admission" ADD FOREIGN KEY ("id") REFERENCES "patient" ("number");
