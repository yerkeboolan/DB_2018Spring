create table countries(
 country_id serial primary key,
 country_name varchar,
 region_id integer,
 population integer
)

insert into countries(country_name, region_id, population)
values('USA', 111, 10);

insert into countries(country_id, country_name)
values(default, 'France');

insert into countries(country_name, region_id, population)
values('Norway', 333, 15),('Italy', 444, 20),('Lithunia', 555, 25);

alter table countries alter country_name set default 'Kazakhstan';

insert into countries(country_name)
values(default);

create table countries_new(like countries);

insert into countries_new(country_id, country_name, region_id , population)
select country_id, country_name, region_id , population 
from countries;

update countries_new set region_id = 1 where region_id is null;

update countries_new set  population = population*1.10
returning country_name, population as new_population;

delete from countries where population < 100000;

delete from countries_new
where exists(select country_id
   from countries)
returning countries_new;

delete from countries
returning countries;

_______________________________________________________________

update countries set population = population/1.10
	where population < 200000 or region_id is not null;