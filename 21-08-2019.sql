CREATE TABLE sailor(
sid number(2),
sname varchar(20),
rating number(1),
age number(2) 
)
desc sailor
CREATE TABLE boat(
bid number(3),
bname varchar(20),
color varchar(10)
)
DROP TABLE boat
desc boat
CREATE TABLE res(
sid number(2),
bid number(3)
)
DROP TABLE RES
desc res

INSERT INTO sailor(sid,sname,rating,age) VALUES (74,'Hebb',9,40)
INSERT INTO boat(bid,bname,color) VALUES (104,'Marine','Red')
INSERT INTO res(sid,bid) VALUES (74,103)
SELECT * FROM boat


SELECT SUM(rating) FROM sailor

SUM(RATING)
58


SELECT AVG(rating) FROM sailor

AVG(RATING)
7.25


SELECT MAX(rating) FROM sailor

MAX(RATING)
9


SELECT MIN(rating) FROM sailor

MIN(RATING)
1


SELECT DISTINCT sname FROM sailor

SNAME
Rusty
Brutus
Andy
Hebb
Zora
Dustin
Luber



SELECT COUNT(DISTINCT sname) FROM sailor


COUNT(DISTINCTSNAME)
7


SELECT COUNT(sname) FROM sailor

COUNT(SNAME)
8



SELECT sname FROM sailor s, res r WHERE s.sid=r.sid AND r.bid=103


SNAME
Dustin
Luber
Hebb


SELECT sname FROM sailor s,boat b, res r WHERE s.sid=r.sid AND b.bid=r.bid AND b.color='Red'


SNAME
Dustin
Dustin
Luber
Luber
Hebb


SELECT sname FROM sailor s,boat b, res r WHERE s.sid=r.sid AND b.bid=r.bid AND b.color='Red' OR b.color='Green'




SELECT sname FROM sailor s,boat b, res r WHERE s.sid=r.sid AND b.bid=r.bid AND b.color='Red' AND b.color='Green'

SELECT sname FROM sailor s,boat b, res r WHERE s.sid=r.sid AND b.bid=r.bid AND r.bid=101 AND r.bid=102 AND r.bid=103 AND r.bid=104 

SELECT AVG(age) FROM sailor GROUP BY rating HAVING rating<3

AVG(AGE)
33

SELECT rating, AVG(age) FROM sailor GROUP BY rating HAVING rating>10

SELECT sname FROM sailor

SNAME
Dustin
Brutus
Luber
Andy
Rusty
Hebb
Zora
Hebb


