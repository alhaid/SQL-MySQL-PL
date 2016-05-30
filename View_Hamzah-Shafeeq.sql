SQL> 
CREATE OR REPLACE VIEW customerView AS
SELECT c.cname, caddress, ccity, cstate, czip, servinv, serdate, totalcost
FROM customer c, servinv s
WHERE c.cname = s.cname;

SQL> 
SELECT * FROM customerView 
WHERE cname IN ('KENNY', 'AMANDEEP', 'ALI'); 

CNAME                CADDRESS             CCITY                CSTATE               CZIP       SERVI SERDATE    TOTALCOST                                                                                                                                 
-------------------- -------------------- -------------------- -------------------- ---------- ----- --------- ----------                                                                                                                                 
AMANDEEP             123 AVENUE           BRAMPTON             ONT                  L6Y3H5     W0027 04-MAY-13      124.3                                                                                                                                                                                                                                                                                                                                                                                          
ALI                  123 Missionhill Dr   mississauga          ON                   L5M5J2     W0033 14-DEC-13          0                                                                                                                                 
KENNY                123 JACKLACK ST      SANANDREAS           ON                   L5T2S9     W0103 31-JUL-15     288.41                                                                                                                                 
KENNY                123 JACKLACK ST      SANANDREAS           ON                   L5T2S9     W0105 21-AUG-15        565                                                                                                                                 
KENNY                123 JACKLACK ST      SANANDREAS           ON                   L5T2S9     W0107 18-SEP-15       1130                                                                                                                                 
ALI                  123 Missionhill Dr   mississauga          ON                   L5M5J2     W0112 01-JAN-90    1033.95                                                                                                                                 

6 rows selected.

