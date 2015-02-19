import sqlite3
import sys

if len(sys.argv) < 2:
    raise Exception("not pair args")
args = sys.argv
args.pop(0)
conn = sqlite3.connect('../../../db.sqlite3')
for x in args:
    splitted = x.split(',')
    if len(splitted) < 3:
        raise Exception("wrong splitted")
    type = splitted.pop(0)
    
    c = conn.cursor()
    if type != "1":
        
        for l in splitted:
            for p in splitted:
                #print l
                #print p
                if l == p:
                    continue
                par = (type,)
                c.execute("SELECT id FROM learning_type WHERE type = ?",par)
                lab = [e for e in c][0][0]
                p = (l,p,lab,l,p,lab,)
                c.execute("INSERT INTO learning_params(param1,param2,type_id) SELECT ?, ?, ? WHERE NOT EXISTS(SELECT 1 FROM learning_params WHERE param1 = ? AND param2 = ? AND type_id = ?)",p)
                conn.commit()
        
    else:
        type = splitted.pop(0)
        fr = splitted.pop(0)
        for i in splitted:
            par = (type,)
            c.execute("SELECT id FROM learning_type WHERE type = ?",par)
            lab = [e for e in c][0][0]
            p = (fr,i,lab,fr,i,lab,)
            c.execute("INSERT INTO learning_params(param1,param2,type_id) SELECT ?, ?, ? WHERE NOT EXISTS(SELECT 1 FROM learning_params WHERE param1 = ? AND param2 = ? AND type_id = ?)",p) 
            conn.commit()
conn.close()
print("success")
