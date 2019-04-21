DROP table MYFIRSTTEMP;

SELECT * FROM DICT_TBL;  

CREATE TABLE DICT_TBL (ID NUMBER(3) PRIMARY KEY, VAL VARCHAR2(50)) ;

INSERT INTO DICT_TBL VALUES (1, 'A');

COMMIT;

DELETE FROM  DICT_TBL;

create or replace function idfindfunc(id_p in number) return number as
cnt number(2);
begin
  select count(1) into cnt from DICT_TBL where id = id_p;

  return cnt;
end;

select idfindfunc(121) from dual;

create or replace procedure updatevalueproc(id_p in number, value_p in varchar, res_p out varchar) as
cnt number(2);
begin
    select count(1) into cnt from DICT_TBL where id = id_p;
    if cnt > 0
    then
        update DICT_TBL set VAL = value_p where id = id_p;
        res_p := 'Update succesful';  
        --commit;
    else
        res_p := 'Update failed';
    end if;
end;

create or replace procedure getvalueproc(res_p out SYS_REFCURSOR) as

begin
    OPEN res_p FOR
    select * from DICT_TBL;
end;