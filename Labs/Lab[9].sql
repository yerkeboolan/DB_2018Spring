create table reviewer(
rID serial primary key,
name varchar(255)
);

create table rating(
rID serial references reviewer,
mID serial references movie
stars integer,
ratingDate date
);

create table movie(
mID serial primary key,
title varchar(255),
year numeric,
director varchar(255)
);

create view mmoviess as select distinct year from movie, rating 
	where rating.mID = movie.mID and stars >= 4
	order by year;

create index ind_year on movie(year);

create index ind_ids2 on rating(stars);

create role uuserr createrole login;

grant all on root to uuserr;

reassign owned by root to uuserr;