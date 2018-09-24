## 2. Joining Three Tables ##

select il.track_id, t.name track_name, m.name track_type, il.unit_price, il.quantity from invoice_line il
inner join track t on t.track_id = il.track_id
inner join media_type m on m.media_type_id = t.media_type_id
where il.invoice_id =4;

## 3. Joining More Than Three Tables ##

select 
    il.track_id,
    t.name track_name,
    a.name artist_name,
    mt.name track_type,
    il.unit_price,
    il.quantity
from invoice_line il
inner join track t on t.track_id = il.track_id
inner join media_type mt on mt.media_type_id = t.media_type_id
inner join album on album.album_id = t.album_id
inner join artist a on a.artist_id = album.artist_id
where il.invoice_id =4

## 4. Combining Multiple Joins with Subqueries ##

select ta.album_title album, ta.artist_name artist, COUNT(*) tracks_purchased
from invoice_line il
inner join(
           select t.track_id, al.title album_title, ar.name artist_name from track t
            inner join album al on al.album_id = t.album_id
            inner join artist ar on ar.artist_id = al.artist_id
           ) ta
           on ta.track_id = il.track_id
group by 1, 2
order by 3 desc limit 5;

## 5. Recursive Joins ##

select e1.first_name || " " || e1.last_name employee_name,
    e1.title employee_title,
    e2.first_name || " " || e2.last_name supervisor_name,
    e2.title supervisor_title
from employee e1 
left join employee e2 on e1.reports_to = e2.employee_id
order by 1

## 6. Pattern Matching Using Like ##

select first_name, last_name, phone from customer where first_name  like "%Belle%"

## 7. Generating Columns With The Case Statement ##

select c.first_name || " " || c.last_name customer_name, COUNT(i.invoice_id) number_of_purchases, SUM(i.total) total_spent, 
    CASE
        WHEN SUM(i.total) < 40 Then "small spender"
        WHEN SUM(i.total) > 100 THEN "big spender"
        else "regular"
        END
        AS customer_category
from invoice i
inner join customer c on c.customer_id = i.customer_id
group by 1 order by 1;