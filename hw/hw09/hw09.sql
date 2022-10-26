CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT dogs.name, sizes.size
  FROM dogs, sizes 
  WHERE dogs.height > sizes.min AND dogs.height <= sizes.max
  ;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.name
  FROM dogs as a, dogs as b, parents
  WHERE a.name == parents.child AND b.name == parents.parent
  ORDER BY b.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.name as fir, b.name as sed
  FROM size_of_dogs as a, size_of_dogs as b, parents as p1, parents as p2
  WHERE a.size = b.size AND a.name < b.name AND p1.child = a.name AND p2.child = b.name AND p1.parent = p2.parent;

-- Sentences about siblings that are the same sizes
CREATE TABLE sentences AS
  SELECT "The two siblings, " || siblings.fir || " plus " || siblings.sed || " have the same size: " || size_of_dogs.size 
  FROM siblings, size_of_dogs 
  WHERE size_of_dogs.name = siblings.fir;

