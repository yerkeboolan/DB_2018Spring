-- 1. Find the names of all reviewers who have contributed three or more ratings.

SELECT name
FROM Reviewer
WHERE (SELECT COUNT(*) FROM Rating WHERE Rating.rId = Reviewer.rId) >= 3;

-- 2. For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 

SELECT title, MAX(stars)
FROM Movie
INNER JOIN Rating USING(mId)
GROUP BY mId
ORDER BY title;

-- 3. Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. 

SELECT name
FROM Reviewer
INNER JOIN Rating USING(rId)
WHERE ratingDate IS NULL;

-- 4. Create view for the next statement. Find the titles of all movies directed by Steven Spielberg.
CREATE VIEW steven AS SELECT title
FROM Movie
WHERE director = 'Steven Spielberg';

-- 5. Create role with any name and give select and insert privileges on the previous view.
CREATE ROLE admin WITH CREATEDB CREATEROLE
GRANT SELECT, INSERT ON steven TO admin;
