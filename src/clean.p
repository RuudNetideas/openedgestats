DEFINE VARIABLE trx AS INTEGER     NO-UNDO.
DEFINE VARIABLE i   AS INTEGER     NO-UNDO.

DEFINE QUERY qry1 FOR DbStat.
OPEN QUERY qry1 FOR EACH DbStat EXCLUSIVE-LOCK.
outerBlock:
DO TRANSACTION WHILE TRUE:
 ASSIGN trx = trx + 1.
 innerBlock:
 DO WHILE TRUE:
   ASSIGN i = i + 1.
   GET NEXT qry1.
   IF (NOT AVAILABLE DbStat) THEN LEAVE outerBlock.
   DELETE DbStat.
   IF (i MODULO 500) EQ 0 THEN NEXT outerBlock.
 END.
END.

DEFINE QUERY qry2 FOR AreaStat.
OPEN QUERY qry2 FOR EACH AreaStat EXCLUSIVE-LOCK.
outerBlock:
DO TRANSACTION WHILE TRUE:
 ASSIGN trx = trx + 1.
 innerBlock:
 DO WHILE TRUE:
   ASSIGN i = i + 1.
   GET NEXT qry2.
   IF (NOT AVAILABLE AreaStat) THEN LEAVE outerBlock.
   DELETE AreaStat.
   IF (i MODULO 500) EQ 0 THEN NEXT outerBlock.
 END.
END.

DEFINE QUERY qry3 FOR TableStat.
OPEN QUERY qry3 FOR EACH TableStat EXCLUSIVE-LOCK.
outerBlock:
DO TRANSACTION WHILE TRUE:
 ASSIGN trx = trx + 1.
 innerBlock:
 DO WHILE TRUE:
   ASSIGN i = i + 1.
   GET NEXT qry3.
   IF (NOT AVAILABLE TableStat) THEN LEAVE outerBlock.
   DELETE TableStat.
   IF (i MODULO 500) EQ 0 THEN NEXT outerBlock.
 END.
END.

DEFINE QUERY qry4 FOR IndexStat.
OPEN QUERY qry4 FOR EACH IndexStat EXCLUSIVE-LOCK.
outerBlock:
DO TRANSACTION WHILE TRUE:
 ASSIGN trx = trx + 1.
 innerBlock:
 DO WHILE TRUE:
   ASSIGN i = i + 1.
   GET NEXT qry4.
   IF (NOT AVAILABLE IndexStat) THEN LEAVE outerBlock.
   DELETE IndexStat.
   IF (i MODULO 500) EQ 0 THEN NEXT outerBlock.
 END.
END.

DEFINE QUERY qry5 FOR ResrcStat.
OPEN QUERY qry5 FOR EACH ResrcStat EXCLUSIVE-LOCK.
outerBlock:
DO TRANSACTION WHILE TRUE:
 ASSIGN trx = trx + 1.
 innerBlock:
 DO WHILE TRUE:
   ASSIGN i = i + 1.
   GET NEXT qry5.
   IF (NOT AVAILABLE ResrcStat) THEN LEAVE outerBlock.
   DELETE ResrcStat.
   IF (i MODULO 500) EQ 0 THEN NEXT outerBlock.
 END.
END.
