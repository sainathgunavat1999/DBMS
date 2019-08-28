CREATE TABLE sailor(
sid number(2),
sname varchar(20),
rating number(2),
age number(2) 
)
INSERT INTO sailor(sid,sname,rating,age) VALUES (22,'Dustin',7,45)
INSERT INTO sailor(sid,sname,rating,age) VALUES (29,'Brutus',1,33)
INSERT INTO sailor(sid,sname,rating,age) VALUES (31,'Lubber',8,55)
INSERT INTO sailor(sid,sname,rating,age) VALUES (32,'Andy',8,25)
INSERT INTO sailor(sid,sname,rating,age) VALUES (58,'Rusty',10,35)
INSERT INTO sailor(sid,sname,rating,age) VALUES (64,'Hebb',7,35)
INSERT INTO sailor(sid,sname,rating,age) VALUES (71,'Zora',10,16)
INSERT INTO sailor(sid,sname,rating,age) VALUES (74,'Hebb',9,40)

DROP TABLE boat
CREATE TABLE boat(
bid number(3),
bname varchar(20),
color varchar(10)
)

INSERT INTO boat(bid,bname,color) VALUES (101,'Interlake','Blue')
INSERT INTO boat(bid,bname,color) VALUES (102,'Interlake','Red')
INSERT INTO boat(bid,bname,color) VALUES (103,'Clipper','Green')
INSERT INTO boat(bid,bname,color) VALUES (104,'Marine','Red')

CREATE TABLE res(
sid number(2),
bid number(3)
)

INSERT INTO res(sid,bid) VALUES (22,101)
INSERT INTO res(sid,bid) VALUES (22,102)
INSERT INTO res(sid,bid) VALUES (22,103)
INSERT INTO res(sid,bid) VALUES (22,104)
INSERT INTO res(sid,bid) VALUES (31,102)
INSERT INTO res(sid,bid) VALUES (31,103)
INSERT INTO res(sid,bid) VALUES (31,104)
INSERT INTO res(sid,bid) VALUES (64,101)
INSERT INTO res(sid,bid) VALUES (64,102)
INSERT INTO res(sid,bid) VALUES (74,103)


SELECT S.sname FROM sailors S WHERE 

SELECT S.sname FROM sailor S WHERE age= (SELECT min(age) FROM sailor) 

SELECT S.sname FROM sailor S 
WHERE S.sid IN (SELECT R.sid FROM res R WHERE R.bid=103)

SELECT S.sname FROM sailor S 
WHERE S.sid IN ( SELECT R.sid FROM res R WHERE R.bid IN (SELECT B.bid FROM boat B WHERE color='Red'))

SELECT S.sname FROM sailor S WHERE S.rating > ANY (SELECT S1.rating FROM sailor S1 WHERE S1.sname='Hebb')

SELECT * FROM sailor S WHERE S.sid IN ( SELECT R.sid FROM res R WHERE R.bid IN (SELECT B.bid FROM boat B WHERE color='Red')) UNION SELECT * FROM sailor S 
WHERE S.sid IN ( SELECT R.sid FROM res R WHERE R.bid IN (SELECT B.bid FROM boat B WHERE color='Green'))


SELECT * FROM sailor S WHERE S.sid IN ( SELECT R.sid FROM res R WHERE R.bid IN (SELECT B.bid FROM boat B WHERE color='Red')) INTERSECT SELECT * FROM sailor S 
WHERE S.sid IN ( SELECT R.sid FROM res R WHERE R.bid IN (SELECT B.bid FROM boat B WHERE color='Green'))
