CREATE TABLE UGYFEL
(
LOGIN nvarchar(255)	MASKED WITH (Function = 'default()'),
EMAIL nvarchar(255) MASKED WITH (function = 'email()'),
NEV nvarchar(255) MASKED WITH (Function = 'partial(1,"XXX",1)'),
SZULEV int MASKED WITH (FUNCTION = 'random(1,5)'),
NEM nvarchar(1),
CIM nvarchar(255)
)

INSERT INTO UGYFEL
(
LOGIN, EMAIL, NEV, SZULEV, NEM, CIM
)
SELECT login, email, nev, szulev, nem, cim
FROM gyfel

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON UGYFEL TO MaskUser


EXECUTE AS User= 'MaskUser';
SELECT * FROM UGYFEL
REVERT

