## 1. Introduction ##

SELECT * from recent_grads limit 5

## 2. Calculating Group-Level Summary Statistics ##

select Major_category, AVG(ShareWomen) FROM recent_grads GROUP BY Major_category;

## 3. Practice: Using GROUP BY ##

SELECT Major_category, AVG(Employed)/AVG(Total) "share_employed" from recent_grads group by Major_category;

## 4. Querying Virtual Columns With the HAVING Statement ##

select Major_category, AVG(Low_wage_jobs)/AVg(Total) "share_low_wage" from recent_grads GRoup by Major_category HAVING share_low_wage > .1

## 5. Rounding Results With the ROUND() Function ##

select ROUND(ShareWomen, 4), Major_category from recent_grads limit 10

## 6. Nesting functions ##

SELECT Major_category, ROUND(AVG(College_jobs)/AVG(Total), 3) share_degree_jobs from recent_grads group by Major_category having share_degree_jobs < .3

## 7. Casting ##

select Major_category, Cast(SUM(Women) as Float)/ SUM(Total) SW from recent_grads group by Major_category order by SW