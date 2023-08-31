/*
Query 1 What are the top 5 brands by receipts scanned for most recent month?

Answer:
As per the data the most recent  month is march 2021 but the following query return nothing as the brand associated to the barcodes of these reciept are null values.

*/

select name,count(*) as freq from brands where barcode in (select barcode from barcodescan where receiptid in
(select r.receiptid from receipts as r where extract(month from to_timestamp(r.datescanned/1000))=
(select extract(month from max(to_timestamp(datescanned/1000))) as date from receipts)))group by brandcode,name order by freq desc limit 5;

/*
Query 2-
How does the ranking of the top 5 brands by receipts scanned for the recent month compare to the ranking for the previous month?

Answer:
For these problem I compare the result of query 1 with query 2 but subsequently the data is still incomplete or has missing values for the month of february 2021 as well.

*/

select name,count(*) as freq from brands where barcode in (select barcode from barcodescan where receiptid in
(select r.receiptid from receipts as r where extract(month from to_timestamp(r.datescanned/1000))=
(select extract(month from max(to_timestamp(datescanned/1000)))-1 as date from receipts)))group by brandcode, name order by freq desc limit 5;

/*
Query 3 - 
When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

Answer:
If we consider rewardsReceiptStatus finished as accepted once then the average spent for Accepted is greater than Rejected once.

*/

select rewardsReceiptStatus,avg(totalspent) as averageSpent from receipts where rewardsReceiptStatus in ('REJECTED','FINISHED') group by rewardsReceiptStatus;

/*
Query 4-

When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?

Answer:
Considering rewardsReceiptStatus finished as accepted once then the item count for Accepted rewardsReceiptStatus is greater than Rejected once.

*/

select rewardsReceiptStatus,sum(purchasedItemCount) as itemCounts from receipts where rewardsReceiptStatus in ('REJECTED','FINISHED') group by rewardsReceiptStatus ;

/*
Query 5 -
Which brand has the most spend among users who were created within the past 6 months?

Answer:
Note - Assumption current date to be most recent date the user has created the account and the result shown are from the past 6 months of the recent user created.

Cracker Barrel Cheese has the most spent amongs the user which were created in last 6 months.

*/

select name,sum(finalprice) as totalspent,count(name) as totalcount from brands as b inner join 
(select distinct(br.barcode) as barcode, br.finalprice from barcodescan as br where br.receiptid in 
(select receiptid from receipts where userid in 
(select userid from users WHERE to_timestamp(createddate/1000) >= (select max(to_timestamp(createddate/1000)) from users) - interval '6 months')))
as c on b.barcode=c.barcode group by brandcode,name order by totalspent desc;

/*
Query 6 -
Which brand has the most transactions among users who were created within the past 6 months?

Answer:
Assuming the most transaction means having purchase quantity higher. Therefor brands like Tostitos, Cracker Barrel Cheese, Jell-O, V8 has the most transcation amongst the other.

*/

select name,sum(finalprice) as totalspent,count(name) as totalcount from brands as b inner join 
(select distinct(br.barcode) as barcode, br.finalprice from barcodescan as br where br.receiptid in 
(select receiptid from receipts where userid in 
(select userid from users WHERE to_timestamp(createddate/1000) >= (select max(to_timestamp(createddate/1000)) from users) - interval '6 months')))
as c on b.barcode=c.barcode group by brandcode,name order by totalcount desc;



