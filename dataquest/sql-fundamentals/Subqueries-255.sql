## 2. Subqueries ##

select Major, Unemployment_rate FROM recent_grads WHERE Unemployment_rate < (Select AVG(Unemployment_rate) from recent_grads) order by Unemployment_rate

## 3. Subquery In SELECT ##

select CAST(count (*) as float)/(select count (*) from recent_grads) proportion_abv_avg from recent_grads where ShareWomen > (SELECT avg(ShareWomen) from recent_grads)

## 4. Returning Multiple Results In Subqueries ##

SELECT Major, Major_category FROM recent_grads
WHERE Major_category IN (select Major_category from recent_grads
group by Major_category
order by SUM(Total) DESC
limit 5)

## 5. Building Complex Subqueries ##

select avg(cast(Sample_size as float)/total) avg_ratio from recent_grads

## 6. Practice Integrating A Subquery With The Outer Query ##

select Major, Major_category, cast(Sample_size as float)/total ratio from recent_grads where ratio > (select avg(cast(Sample_size as float)/total) from recent_grads) 