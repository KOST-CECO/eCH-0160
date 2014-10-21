@ECHO OFF
SETLOCAL

IF [%1]==[] (
    ECHO "usage: <input folder> <new output folder>"
    EXIT /B
)

IF [%2]==[] (
    ECHO "usage: <input folder> <new output folder>"
    EXIT /B
)

IF NOT EXIST %1 (
    ECHO folder "%1" not found
    ECHO "usage: <input folder> <new output folder>"
    EXIT /B
)

IF EXIST %2 (
    ECHO output folder "%2" should not exist
    EXIT /B
)

SET OUT=%CD%\%2
IF NOT EXIST %OUT% (
    ECHO output folder "%OUT%" created
    MKDIR %OUT%
)

SET CWD=%CD%
CD %1

FOR %%I IN (*.xsd) DO (
    REM pretty print
    xmllint.exe --format %%I >%OUT%\%%I_pp
    REM insert new line
    sed.exe -f %CWD%\prettyprint_xsd.script %OUT%\%%I_pp > %OUT%\%%I
    DEL %OUT%\%%I_pp
    ECHO file processed: "%OUT%\%%I"
)

EXIT /B
