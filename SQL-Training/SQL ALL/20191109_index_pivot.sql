-- ************************************** pivot **************************************

SELECT * FROM dbo.studUnPvt
SELECT * FROM dbo.studPvt


select sub,abc,pqr,xyz
from studUnPvt
pivot
(
	sum(mark)
	for name in (abc,pqr,xyz)
) as b


select name,math,sci,eng
from studUnPvt
pivot
(
	sum(mark)
	for sub in (math,sci,eng)
) as b



-- ************************************** unpivot **************************************

select fullname,sub,mark
from dbo.studPvt
unpivot
(
	mark
	for fullname in (abc,pqr,xyz)
) as unpvt



-- ************************************** index **************************************

SELECT * FROM emp

CREATE INDEX idx_id ON dbo.emp(e_id)

CREATE CLUSTERED INDEX idx_id2 ON dbo.emp(e_id)

CREATE CLUSTERED INDEX idx_id3 ON dbo.emp(e_name)

DROP INDEX idx_id3 ON dbo.emp

CREATE INDEX idx_id3 ON dbo.emp(e_name,e_gender)
