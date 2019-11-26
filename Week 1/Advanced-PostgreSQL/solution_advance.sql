-- Os valores do campo advance são strings e contém dois valores null. Trocamos abaixo o valores Nulls para 0.
/*update titles
	set advance = 0
	where advance is Null;*/
-- Step 1:
select titleauthor.au_id, titleauthor.title_id, 
cast(titles.advance as float) * titleauthor.royaltyper / 100 as advance,
cast(titles.price as float) * cast(sales.qty as float) * cast(titles.royalty as float) / 100 * cast(titleauthor.royaltyper as float) / 100 as royalty
from titleauthor
join titles ON titles.title_id = titleauthor.title_id
join sales ON sales.title_id = titleauthor.title_id;

-- Step 2:
select royal.au_id as author, royal.title_id as title, sum(royalty)
from 

(select titleauthor.au_id, titleauthor.title_id, 
cast(titles.advance as float) * titleauthor.royaltyper / 100 as advance,
cast(titles.price as float) * cast(sales.qty as float) * cast(titles.royalty as float) / 100 * cast(titleauthor.royaltyper as float) / 100 as royalty
from titleauthor
join titles ON titles.title_id = titleauthor.title_id
join sales ON sales.title_id = titleauthor.title_id) as royal

group by author, title
order by author;

-- Step 3:
select royal.au_id as author, sum(royalty), sum(advance)
from 

(select titleauthor.au_id, titleauthor.title_id, 
cast(titles.advance as float) * titleauthor.royaltyper / 100 as advance,
cast(titles.price as float) * cast(sales.qty as float) * cast(titles.royalty as float) / 100 * cast(titleauthor.royaltyper as float) / 100 as royalty
from titleauthor
join titles ON titles.title_id = titleauthor.title_id
join sales ON sales.title_id = titleauthor.title_id) as royal

group by author
order by sum(royalty) DESC
LIMIT 3;

--Challenge 2:
--first part:
select titleauthor.au_id as author, titleauthor.title_id as title,
cast(titles.advance as float) * titleauthor.royaltyper / 100 as advance,
cast(titles.price as float) * cast(sales.qty as float) * cast(titles.royalty as float) / 100 * cast(titleauthor.royaltyper as float) / 100 as royalty
--creating a temp table:
INTO TEMP TABLE rob_royal
from titleauthor
join titles ON titles.title_id = titleauthor.title_id
join sales ON sales.title_id = titleauthor.title_id;

--second part with rob_royal temp table.
select author, sum(royalty), sum(advance)
from rob_royal
group by author
order by sum(royalty) DESC
LIMIT 3;

--Challenge 3:
DROP MATERIALIZED VIEW IF EXISTS most_profiting_authors;
CREATE MATERIALIZED VIEW most_profiting_authors as
select royal.au_id as author, (sum(royalty)+sum(advance)) as aggreg
from 

(select titleauthor.au_id, titleauthor.title_id, 
cast(titles.advance as float) * titleauthor.royaltyper / 100 as advance,
cast(titles.price as float) * cast(sales.qty as float) * cast(titles.royalty as float) / 100 * cast(titleauthor.royaltyper as float) / 100 as royalty
from titleauthor
 
join titles ON titles.title_id = titleauthor.title_id
join sales ON sales.title_id = titleauthor.title_id) as royal

group by author
order by sum(royalty) DESC
LIMIT 3;





