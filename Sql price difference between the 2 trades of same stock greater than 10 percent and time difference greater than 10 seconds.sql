/* Write sql to find all couples of trade for same stock that happened in the range of 10 seconds an dhaving a price diffrence more than 10 %
Output should be also list the percentage of price difference between the 2 trades */

Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)

Select t1.TRADE_ID, t2.TRADE_ID, t1.Trade_Timestamp, t2.Trade_Timestamp, 
t1.price, t2.price, abs(t1.Price-t2.price)*1.0 /t1.price*100  from Trade_tbl t1
inner join 
Trade_tbl t2 on 1=1
where t1.Trade_Timestamp<t2.Trade_Timestamp
and DATEDIFF(second, t1.trade_timestamp, t2.trade_timestamp) < 10
and abs(t1.Price-t2.price)*1.0 /t1.price*100 > 10