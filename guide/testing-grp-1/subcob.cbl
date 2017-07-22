       IDENTIFICATION DIVISION.
       PROGRAM-ID. subcob.
       DATA DIVISION.
       LINKAGE SECTION.
       01  Arg1      PIC X(7).
       01  Arg2      PIC X(7).
       01  Arg3      USAGE BINARY-LONG.
       PROCEDURE DIVISION USING
           BY VALUE     Arg1,
           BY REFERENCE Arg2,
           BY REFERENCE Arg3.
       000-Main.
           DISPLAY 'Starting cobsub.cbl'
           DISPLAY 'Arg1=' Arg1
           DISPLAY 'Arg2=' Arg2
           DISPLAY 'Arg3=' Arg3
           MOVE 'X' TO Arg1 (1:1)
           MOVE 'Y' TO Arg2 (1:1)
           MOVE 987654321 TO Arg3
           MOVE 2 TO RETURN-CODE
           GOBACK
           .
