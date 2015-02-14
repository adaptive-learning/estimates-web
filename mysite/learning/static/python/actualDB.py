import sqlite3
import sys

if len(sys.argv) < 2:
    raise Exception("not pair args")
args = sys.argv
args.pop(0)    
conn = sqlite3.connect('../../../db.sqlite3')
for x in args:
    print x
    splitted = x.split(',')
    print splitted
    if len(splitted) < 2:
        raise Exception("wrong splitted")
    fr = splitted.pop(0)
    for i in splitted:
        p = (fr,i,fr,i,)
        c = conn.cursor()
        c.execute("INSERT INTO learning_params(param1,param2) SELECT ?, ? WHERE NOT EXISTS(SELECT 1 FROM learning_params WHERE param1 = ? AND param2 = ?)",p) 
        conn.commit()
conn.close()
print("success")
