

1. Write the SQL command to change the movie year for movie number 1245 to 2008.
sol)
update movie
set movie_year = 2008
where movie_num = 1245;

select * from movie;

2. Write a query to display the movie title, movie year, and movie genre for all movies sorted by 
movie genre in ascending order, then sorted by movie year in descending order within genre 
(result shown in Figure F2);
sol)
select movie_title,movie_year,movie_genre
from movie
order by movie_genre asc,movie_year desc;


3. Write a query to display the movie title, movie year, and movie cost for all movies that contain 
the word “hope” anywhere in the title. Sort the results in ascending order by title (result shown 
in Figure F3).;
sol)
select movie_title,movie_year,movie_cost
from movie
where movie_title like '%hope%' 
or movie_title like '%Hope%';

4. Write a query to display the movie number, movie title, movie cost, and movie genre for all 
movies that are either action or comedy movies or that have a cost that is less than $50. Sort 
the results in ascending order by genre. (Result shown in Figure F4.);
sol)
select movie_num,movie_title,
movie_cost,movie_genre
from movie
where movie_genre in ('ACTION' , 'COMEDY')
OR movie_cost< 50
order by movie_genre asc;

5. Write a query to display the movie number, and movie description for all movies where the movie 
description is a combination of the movie title, movie year and movie genre with the movie year 
enclosed in parentheses (result shown in Figure F5).;
sol)
select movie_num,
movie_title||' '||'('||movie_year||')'|| ' '||movie_genre
as "Movie_Description"
from movie;

6. Write a query to display the movie genre and the number of movies in each genre (result shown 
in Figure F6);
sol)
select movie_genre,
count(movie_genre) as "Number of Movies"
from movie
group by movie_genre 
order by movie_genre ;


7. Write a query to display the movie genre and average cost of movies in each genre (result shown 
in Figure F7).;
sol)
select movie_genre,
round(avg(movie_cost),2) as "Average Cost"
from movie
GROUP BY movie_genre
ORDER BY movie_genre;

8. Write a query to display the movie title, movie genre, price description, and price rental fee for 
all movies with a price code (result shown in Figure F8).;
sol)
select m.movie_title,m.movie_genre,
p.price_description,p.price_rentfee
from movie m
join price p
on p.price_code = m.price_code
ORDER BY price_description desc;

9. Write a query to display the movie genre and average price rental fee for movies in each genre 
that have a price (result shown in Figure F9). ;
sol)
select m.movie_genre,
avg(p.price_rentfee) as "Average Rental Fee"
from movie m
inner join price p
on m.price_code = p.price_code
group by movie_genre
order by movie_genre;

10. Write a query to display the minimum balance, maximum balance, and average balance for 
memberships that have a rental (result shown in Figure F10).;
sol)
select min(mem_balance) as "Minimum Balance",
max(mem_balance) as "Maximum Balance",
round(avg(mem_balance),2) as "Average Balance"
from membership;

11. Write a query to display the movie title and movie year for all movies that have a price code 
(result shown in Figure F11).;
sol)
select movie_title,movie_year
from movie
where price_code is not null;


12. Write a query to display the movie title, movie year, and movie cost for all movies that have a 
cost between $44.99 and $49.99 (result shown in Figure F12);
sol)
select movie_title,movie_year,movie_cost
from movie
where movie_cost >44.99 and movie_cost<49.99;

13. Write a query to display the movie title, movie year, price description, and price rental fee for all 
movies that are in the genres Family, Comedy, or Drama (result shown in Figure F13).
Figure F13 Movies with specific genres;
sol)
select m.movie_title,m.movie_year,
p.price_description,p.price_rentfee,m.movie_genre
from movie m
inner join price p
on m.price_code  = p.price_code
where m.movie_genre in ('FAMILY','DRAMA','COMEDY');

14. Write a query to display the movie number, movie title, and movie year for all movies that do 
not have a video (result shown in Figure F14).;
sol)
select movie_num,movie_title,
movie_year
from movie
where movie_num not in (select movie_num
                         from video);

15. Write a query to display the membership number, first name, last name, and balance of the 
memberships that have a rental (result shown in Figure F15).
Figure F15 Balances of memberships with rentals;
sol)
select distinct(m.mem_num),m.mem_fname,
m.mem_lname,m.mem_balance
from membership m
inner join rental r
on m.mem_num = r.mem_num
order by mem_num;


16. Write a query to display the rental number, rental date, video number, movie title, due date, and 
return date for all videos that were returned after the due date. Sort the results by rental number 
and movie title (result shown in Figure F16).;
sol)
select r.rent_num,r.rent_date,v.vid_num,
m.movie_title,
d.detail_duedate,d.detail_returndate
from rental r
inner join detailrental d
on r.rent_num=d.rent_num
inner join video v
on d.vid_num=v.vid_num
inner join movie m
on m.movie_num = v.movie_num
where d.DETAIL_RETURNDATE>d.DETAIL_DUEDATE
order by rent_num asc , movie_title;

17. Write a query to display the membership name (concatenate the first name and last name with 
a space between them into a single column), membership address (concatenate the street, city, 
state, and zip codes into a single column with spaces (result shown in Figure F17)
sol)
select concat(mem_fname,concat(' ',mem_lname))
as "Membership name",
mem_street||','||mem_city||','||mem_state
||' '||Mem_Zip as "Membership address"
from membership;

18. Write a query to display the rental number, rental date, video number, movie title, due date, 
return date, detail fee, and number of days past the due date that the video was returned for 
each video that was returned after the due date. Sort the results by rental number and movie 
title. (Result shown in Figure F18.);
sol)
select r.rent_num,r.rent_date,v.vid_num,
m.movie_title,
d.detail_duedate,d.detail_returndate,
d.detail_fee,(d.detail_returndate-d.detail_duedate) 
as "days past due date"
from rental r
inner join detailrental d
on r.rent_num=d.rent_num
inner join video v
on d.vid_num=v.vid_num
inner join movie m
on m.movie_num = v.movie_num
where (d.DETAIL_RETURNDATE>d.DETAIL_DUEDATE) 
order by rent_num asc , movie_title;


19. Write a query to display the rental number, rental date, movie title, and detail fee for each movie 
that was returned on or before the due date (result shown in Figure F19).;
sol)
select r.rent_num,r.rent_date,
m.movie_title,d.detail_fee
from rental r
inner join detailrental d
on r.rent_num=d.rent_num
inner join video v
on d.vid_num=v.vid_num
inner join movie m
on m.movie_num = v.movie_num
where d.DETAIL_RETURNDATE<=d.DETAIL_DUEDATE ;

20. Write a query to display the membership number, last name, and total rental fees earned from 
that membership (result shown in Figure F20). The total rental fee is the sum of all of the detail 
fees (without the late fees) from all movies that the membership has rented. ;
sol)
select m.mem_num,m.mem_lname,m.mem_fname,
sum(d.detail_fee) as "rental fee revenue"
from membership m
inner join rental r
on r.mem_num=m.mem_num
inner join detailrental d
on d.rent_num=r.rent_num
group by m.mem_num, m.mem_lname, m.mem_fname
order by mem_num;
