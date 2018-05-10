-- 1. List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. 

SELECT title, AVG(stars) AS average
FROM Movie
INNER JOIN Rating USING(mId)
GROUP BY mId
ORDER BY average DESC, title;

-- 2. For each movie that has at least one rating, find the lowest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 

SELECT title, MIN(stars)
FROM Movie
INNER JOIN Rating USING(mId)
GROUP BY mId
ORDER BY title;


-- 3. Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. 

SELECT name
FROM Reviewer
INNER JOIN Rating USING(rId)
WHERE ratingDate IS NULL;

-- 4. Create materialized view for the next statement. Find the titles of all movies that have no ratings.
CREATE MATERIALIZED VIEW moviee AS SELECT title
FROM Movie
WHERE mId NOT IN (SELECT mID FROM Rating);

-- 5. Create role with any name and give select and update privileges on the previous view.
CREATE ROLE movierole WITH CREATEDB CREATEROLE
GRANT SELECT, INSERT ON moviee TO movierole;