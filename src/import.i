
DEFINE VARIABLE c1 AS CHARACTER   NO-UNDO.
DEFINE VARIABLE c2 AS CHARACTER   NO-UNDO.
DEFINE VARIABLE c3 AS CHARACTER   NO-UNDO.

DEFINE VARIABLE srcdir AS CHARACTER   NO-UNDO.
DEFINE VARIABLE cc  AS CHARACTER   NO-UNDO.
DEFINE VARIABLE dt  AS DATETIME    NO-UNDO.

DEFINE STREAM s1.

ASSIGN srcDir = SESSION:PARAMETER.

INPUT FROM OS-DIR (srcdir).
REPEAT:
    IMPORT c1 c2 c3.
    IF (c3 EQ 'F') AND (c1 MATCHES 'DbStatDump.*.TableStat.txt') THEN DO TRANSACTION:
        EMPTY TEMP-TABLE ttTableStat.
        ASSIGN dt = DATETIME(INTEGER(SUBSTRING(c1, 16, 2)),
                             INTEGER(SUBSTRING(c1, 18, 2)),
                             INTEGER(SUBSTRING(c1, 12, 4)),
                             INTEGER(SUBSTRING(c1, 21, 2)),
                             INTEGER(SUBSTRING(c1, 23, 2)),
                             INTEGER(SUBSTRING(c1, 25, 2))).
        INPUT STREAM s1 FROM VALUE(c2).
        IMPORT STREAM s1 UNFORMATTED cc.
        REPEAT:
            CREATE ttTableStat.
            IMPORT STREAM s1 DELIMITER "~t" ttTableStat.
        END.
        INPUT STREAM s1 CLOSE.
        FOR EACH ttTableStat WHERE ttTableStat.dbNam NE '':
          CREATE tableStat.
          BUFFER-COPY ttTableStat TO tableStat
                ASSIGN tableStat.id = NEXT-VALUE(seqTableStat)
                       tableStat.pollDT = dt
                       tablestat.pollD  = DATE(dt)
                       tableStat.pollT  = MTIME(dt) / 1000.
        END.
    END.

    IF (c3 EQ 'F') AND (c1 MATCHES 'DbStatDump.*.DbStat.txt') THEN DO TRANSACTION:
        EMPTY TEMP-TABLE ttDbStat.
        ASSIGN dt = DATETIME(INTEGER(SUBSTRING(c1, 16, 2)),
                             INTEGER(SUBSTRING(c1, 18, 2)),
                             INTEGER(SUBSTRING(c1, 12, 4)),
                             INTEGER(SUBSTRING(c1, 21, 2)),
                             INTEGER(SUBSTRING(c1, 23, 2)),
                             INTEGER(SUBSTRING(c1, 25, 2))).
        INPUT STREAM s1 FROM VALUE(c2).
        IMPORT STREAM s1 UNFORMATTED cc.
        REPEAT:
            CREATE ttDbStat.
            IMPORT STREAM s1 DELIMITER "~t" ttDbStat.
        END.
        INPUT STREAM s1 CLOSE.
        FOR EACH ttDbStat WHERE ttDbStat.dbNam NE '':
            CREATE dbStat.
            BUFFER-COPY ttDbStat TO dbStat
                ASSIGN dbStat.id = NEXT-VALUE(seqDbStat)
                       dbStat.pollDT = dt
                       dbStat.pollD  = DATE(dt)
                       dbStat.pollT  = MTIME(dt) / 1000.
        END.
    END.

    IF (c3 EQ 'F') AND (c1 MATCHES 'DbStatDump.*.AreaStat.txt') THEN DO TRANSACTION:
        EMPTY TEMP-TABLE ttAreaStat.
        ASSIGN dt = DATETIME(INTEGER(SUBSTRING(c1, 16, 2)),
                             INTEGER(SUBSTRING(c1, 18, 2)),
                             INTEGER(SUBSTRING(c1, 12, 4)),
                             INTEGER(SUBSTRING(c1, 21, 2)),
                             INTEGER(SUBSTRING(c1, 23, 2)),
                             INTEGER(SUBSTRING(c1, 25, 2))).
        INPUT STREAM s1 FROM VALUE(c2).
        IMPORT STREAM s1 UNFORMATTED cc.
        REPEAT:
            CREATE ttAreaStat.
            IMPORT STREAM s1 DELIMITER "~t" ttAreaStat.
        END.
        INPUT STREAM s1 CLOSE.
        FOR EACH ttAreaStat WHERE ttAreaStat.dbNam NE '':
            CREATE areaStat.
            BUFFER-COPY ttAreaStat TO areaStat
                ASSIGN areaStat.id = NEXT-VALUE(seqAreaStat)
                       areaStat.pollDT = dt
                       areaStat.pollD  = DATE(dt)
                       areaStat.pollT  = MTIME(dt) / 1000.
        END.
    END.

    IF (c3 EQ 'F') AND (c1 MATCHES 'DbStatDump.*.IndexStat.txt') THEN DO TRANSACTION:
        EMPTY TEMP-TABLE ttIndexStat.
        ASSIGN dt = DATETIME(INTEGER(SUBSTRING(c1, 16, 2)),
                             INTEGER(SUBSTRING(c1, 18, 2)),
                             INTEGER(SUBSTRING(c1, 12, 4)),
                             INTEGER(SUBSTRING(c1, 21, 2)),
                             INTEGER(SUBSTRING(c1, 23, 2)),
                             INTEGER(SUBSTRING(c1, 25, 2))).
        INPUT STREAM s1 FROM VALUE(c2).
        IMPORT STREAM s1 UNFORMATTED cc.
        REPEAT:
            CREATE ttIndexStat.
            IMPORT STREAM s1 DELIMITER "~t" ttIndexStat.
        END.
        INPUT STREAM s1 CLOSE.
        FOR EACH ttIndexStat WHERE ttIndexStat.dbNam NE '':
            CREATE indexStat.
            BUFFER-COPY ttIndexStat TO indexStat
                ASSIGN indexStat.id = NEXT-VALUE(seqIndexStat)
                       indexStat.pollDT = dt
                       indexStat.pollD  = DATE(dt)
                       indexStat.pollT  = MTIME(dt) / 1000.
        END.
    END.

    IF (c3 EQ 'F') AND (c1 MATCHES 'DbStatDump.*.ResrcStat.txt') THEN DO TRANSACTION:
        EMPTY TEMP-TABLE ttResrcStat.
        ASSIGN dt = DATETIME(INTEGER(SUBSTRING(c1, 16, 2)),
                             INTEGER(SUBSTRING(c1, 18, 2)),
                             INTEGER(SUBSTRING(c1, 12, 4)),
                             INTEGER(SUBSTRING(c1, 21, 2)),
                             INTEGER(SUBSTRING(c1, 23, 2)),
                             INTEGER(SUBSTRING(c1, 25, 2))).
        INPUT STREAM s1 FROM VALUE(c2).
        IMPORT STREAM s1 UNFORMATTED cc.
        REPEAT:
            CREATE ttResrcStat.
            IMPORT STREAM s1 DELIMITER "~t" ttResrcStat.
        END.
        INPUT STREAM s1 CLOSE.
        FOR EACH ttResrcStat WHERE ttResrcStat.dbNam NE '':
            CREATE resrcStat.
            BUFFER-COPY ttResrcStat TO resrcStat
                ASSIGN resrcStat.id = NEXT-VALUE(seqResrcStat)
                       resrcStat.pollDT = dt
                       resrcStat.pollD  = DATE(dt)
                       resrcStat.pollT  = MTIME(dt) / 1000.
        END.
    END.

END.
INPUT CLOSE.
