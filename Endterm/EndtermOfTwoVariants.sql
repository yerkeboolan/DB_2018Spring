-- Q1 Find the names of all students who are friends with someone named Gabriel.
select distinct name from Highschooler where ID in (select ID1 from Friend where ID2 in (select ID from Highschooler where name="Gabriel"));

-- Q2 For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like. 
select distinct sName, sGrade, lName, lGrade
from (select h1.name as sName, h1.grade sGrade, h2.name as lName, h2.grade as lGrade, h1.grade-h2.grade as gradeDiff 
     from Highschooler h1, Likes, Highschooler h2
     where h1.ID=ID1 and h2.ID=ID2)
where gradeDiff>1;

-- Q3 Find the name and grade of all students who are liked by more than one other student. 
select name, grade 
from (select ID2, count(ID2) as numLiked from Likes group by ID2), Highschooler
where numLiked>1 and ID2=ID;

-- Q4 Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade. 
select name, grade from Highschooler
where ID not in (
  select ID1 from Highschooler H1, Friend, Highschooler H2
  where H1.ID = Friend.ID1 and Friend.ID2 = H2.ID and H1.grade <> H2.grade)
order by grade, name;

-- Q5 For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order.
select h1.name, h1.grade, h2.name, h2.grade  from Likes l1, Likes l2, Highschooler h1, Highschooler h2
where l1.ID1=l2.ID2 and l2.ID1=l1.ID2 and l1.ID1=h1.ID and l1.ID2=h2.ID and h1.name<h2.name;