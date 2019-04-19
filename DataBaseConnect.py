import cx_Oracle
import sys
try:
    con = cx_Oracle.connect('nkm/Passw0rd@myfirsttestdb.cy4rjsglrxjt.us-east-2.rds.amazonaws.com:1551/NKMDB')
    print (con.version)
    cur = con.cursor()
    cur.prepare('select * from DICT_TBL where ID = :id')
    cur.execute(None, {'id': 1})
    #cur.execute('select * from MYFIRSTTEMP order by ID')
    for result in cur:
        print(result)
    #cur.execute(None, {'id': 1})

    rows = [ (11, "First" ),
            (12, "Second" ),
            (13, "Third" ),
            (4, "Fourth" ),
            (5, "Fifth" ),
            (6, "Sixth" ),
            (7, "Seventh" ) ]
    #cur = con.cursor()
    cur.bindarraysize = 7
    cur.setinputsizes(int, 20)
    cur.executemany("insert into DICT_TBL(id, VAL) values (:1, :2)", rows)
    #con.commit()
    # Now query the results back
    #cur2 = con.cursor()
    cur.execute('select * from DICT_TBL')
    res = cur.fetchall()
    print("Fetch after inserting")
    print(res)

    res = cur.callfunc('idfindfunc', cx_Oracle.NUMBER, [2])
    print ('idfindfunc result: ',res)

    myvar = cur.var(cx_Oracle.STRING)
    cur.callproc('updatevalueproc', [1, 'AA', myvar])
    print ('updatevalueproc result: ', myvar.getvalue())

    myvar = cur.var(cx_Oracle.CURSOR)
    res = cur.callproc('getvalueproc', [myvar])
    print ('getvalueproc result: ', list(res))

except:
    print ('There is an error: ', sys.exc_info())
finally:
    try:
        cur.close()
        #cur2.close()
        print ('Cursor closed')
    finally:
        con.close()
        print ('Connection closed')