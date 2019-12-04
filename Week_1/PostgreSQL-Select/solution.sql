--Challenge 1:
select authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName, titles.title, publishers.pub_name as publisher
from titleauthor

join authors ON authors.au_id = titleauthor.au_id
join titles ON titles.title_id = titleauthor.title_id
join publishers ON publishers.pub_id = titles.pub_id;

--Challenge 2:
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", 
publishers.pub_name as "PUBLISHER", count(titles.title) as "TITLE COUNT"
from titleauthor

join authors ON authors.au_id = titleauthor.au_id
join titles ON titles.title_id = titleauthor.title_id
join publishers ON publishers.pub_id = titles.pub_id

group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name

ORDER BY count(titles.title) DESC;

----Challenge 3:
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", 
count(sales.title_id) as "TOTAL"
from titleauthor

join authors ON authors.au_id = titleauthor.au_id
join titles ON titles.title_id = titleauthor.title_id
join sales ON sales.title_id = titleauthor.title_id

group by authors.au_id, authors.au_lname, authors.au_fname
order by "TOTAL" DESC
LIMIT 3;

----Challenge 4:
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", 
count(sales.title_id) as "TOTAL"
from titleauthor

full join authors ON authors.au_id = titleauthor.au_id
full join titles ON titles.title_id = titleauthor.title_id
full join sales ON sales.title_id = titleauthor.title_id

group by authors.au_id, authors.au_lname, authors.au_fname

order by "TOTAL" DESC;





