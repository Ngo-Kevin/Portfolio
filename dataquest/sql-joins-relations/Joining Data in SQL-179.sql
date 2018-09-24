## 1. Introducing Joins ##


SELECT * FROM facts
INNER JOIN cities ON cities.facts_id = facts.id
LIMIT 10;

## 2. Understanding Inner Joins ##

SELECT c.*, f.name country_name from facts f inner join cities c on c.facts_id = f.id limit 5;

## 3. Practicing Inner Joins ##

SELECT f.name country, c.name capital_city from cities c inner join facts f on f.id = c.facts_id where c.capital = 1;

## 4. Left Joins ##

select f.name country, f.population from facts f 
left join cities c on c.facts_id = f.id
where c.name is NULL;

## 6. Finding the Most Populous Capital Cities ##

select c.name capital_city, f.name country, c.population from facts f inner join cities c on c.facts_id =f.id where c.capital = 1 order by 3 desc limit 10

## 7. Combining Joins with Subqueries ##

SELECT c.name capital_city, f.name country, c.population from facts f 
inner join (SELECT * from cities where capital = 1 and population > 10000000)c on c.facts_id=f.id 
order by 3 desc;

## 8. Challenge: Complex Query with Joins and Subqueries ##

SELECT f.name country, c.urban_pop, f.population total_pop, (cast(c.urban_pop as float)/f.population) urban_pct from facts f inner join (select facts_id, sum(population) urban_pop from cities group by 1) c on c.facts_id = f.id where urban_pct > 0.5 order by 4;