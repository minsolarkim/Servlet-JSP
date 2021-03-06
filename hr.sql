SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID ;

SELECT *
    FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '%'|| INITCAP('donald') ||'%'
        OR LAST_NAME LIKE '%'|| INITCAP('KI') ||'%'
;
--정확하게 찾으려면 = 사용
SELECT *
    FROM EMPLOYEES
    WHERE FIRST_NAME =  INITCAP('donald') 
        OR LAST_NAME = INITCAP('KING')
    ORDER BY EMPLOYEE_ID
;