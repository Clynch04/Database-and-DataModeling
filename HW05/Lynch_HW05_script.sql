-- Lynch, Connor
-- ISTE230, Fall 2024
-- HW05

-- #1
SELECT NOW();

-- #2
SELECT companyname, division, listing FROM interview
WHERE listing = 'n'
UNION
SELECT companyname, division, listing FROM interview
WHERE listing = 'y';

-- #3
SELECT employer.companyname, employer.division, statecode 
FROM employer INNER JOIN interview
USING (companyname, division);

-- #4
SELECT * FROM state
WHERE NOT EXISTS
(
SELECT * FROM employer WHERE state.statecode = employer.statecode
);

-- #5
SELECT location, qtrcode FROM quarter;

-- #6
SELECT * FROM quarter WHERE qtrcode IN ('20201', '20204');

-- #7
SELECT companyname, employer.statecode, description 
FROM employer INNER JOIN state
USING (statecode);

-- #8
SELECT description, companyname
FROM state LEFT OUTER JOIN employer USING (statecode);

-- #9
UPDATE employer SET companyname = 'Rochester Software Design'
WHERE companyname = 'Rochester Application Software';

SELECT companyname AS 'Company Name', division AS 'Division Name', CONCAT (address, ', ', zipcode) AS 'Address & Zip'
FROM employer
WHERE companyname = 'Rochester Software Design'
OR companyname LIKE 's%';
