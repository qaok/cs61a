create table lift as
	select 101 as chair, 2 as single, 2 as couple union
	select 102         , 0 			, 3 		  union
	select 103         , 4          , 1;

select chair, single + 2 * couple as value from lift;

create table dogs as 
	select "abraham" as name, "long" as fur union
	select "barack"			, "short"       union
	select "clinton"		, "long"        union
	select "delano"			, "long"		union
	select "eisenhower"     , "short"		union
	select "fillmore"		, "curly"       union
	select "grover"         , "short"       union
	select "herbert"		, "curly";

create table parents as 
	select "abraham" as parent, "barack" as child union 
	select "abraham"          , "clinton"         union 
	select "delano"           , "herbert"         union 
	select "fillmore"         , "abraham"         union 
	select "fillmore"		  , "delano"          union 
	select "fillmore"		  , "grover"          union 
	select "eisenhower"       , "fillmore";

select * from dogs;
select * from parents, dogs;
select * from parents, dogs where child = name;
select * from parents, dogs where child = name and fur = "curly";
select parent from parents, dogs where child = name and fur = "curly";
select a.child as first, b.child as second from parents as a, parents as b 
       where a.parent = b.parent and a.child < b.child;

create table grandparents as
	select a.parent as grandog, b.child as grandpup
			from parents as a, parents as b
			where a.child = b.parent;

select * from grandparents;
select grandpup from grandparents where grandog = "eisenhower";
select grandog from grandparents, dogs as c, dogs as d
		where c.fur = d.fur and 
			  c.name = grandog and 
			  d.name = grandpup;


create table cities as
	select 38 as latitude, 122 as longtitude, "Berkeley" as name union
	select 42,			   71,				  "Cambrige" 		 union
	select 45,             93, 			      "Minneapolis"		 union
	select 33,             117,               "San Diego"        union
	select 26,             80,                "Miami"            union
	select 90,             0,                 "North Pole";

create table cold as
	select name from cities where latitude >= 43;

create table distances as
	select a.name as first, b.name as second, 60 * (b.latitude - a.latitude) as distance
	       from cities as a, cities as b;

select * from distances;
select * from cold;
select second from distances where first = "Minneapolis" order by distance;

select "hello," || " word";

create table nouns as
	select "dog" as phrase union
	select "cat"           union
	select "bird";

create table ands as
	select first.phrase || " and " || second.phrase as phrase
		   from nouns as first, nouns as second
		   where first.phrase <> second.phrase;

select * from ands;
select subject.phrase || " and " || object.phrase
	from ands as subject, ands as object
	where subject.phrase <> object.phrase;
