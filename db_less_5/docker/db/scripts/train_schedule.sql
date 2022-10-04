CREATE TABLE "city" (
  "name" varchar UNIQUE NOT NULL,
  "region" varchar UNIQUE NOT NULL,
  PRIMARY KEY (name, region)
);

CREATE TABLE "hospital_station" (
  "name" varchar PRIMARY KEY,
  "tracks" varchar
);

CREATE TABLE "train" (
  "number" int PRIMARY KEY,
  "length" int,
  "startStation" varchar,
  "endStation" varchar
);

CREATE TABLE "connected" (
  "id" int,
  "arrivalStation" varchar,
  "departureStation" varchar,
  "arrival" int,
  "departure" int
);

ALTER TABLE "hospital_station" ADD FOREIGN KEY ("name") REFERENCES "city" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("startStation") REFERENCES "hospital_station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("endStation") REFERENCES "hospital_station" ("name");

ALTER TABLE "connected" ADD FOREIGN KEY ("id") REFERENCES "train" ("number");

ALTER TABLE "connected" ADD FOREIGN KEY ("arrivalStation") REFERENCES "hospital_station" ("name");

ALTER TABLE "connected" ADD FOREIGN KEY ("departureStation") REFERENCES "hospital_station" ("name");
