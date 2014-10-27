@ECHO OFF
SETLOCAL

SET GNUDIR=C:\Software\PCUnixUtils

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


IF NOT EXIST "%OUT%" (
    ECHO output folder "%OUT%" created
    MKDIR "%OUT%"
)

SET CWD=%CD%
CD %1

FOR %%I IN (*.xsd) DO (
    REM fix newline at end of documentation text
    %GNUDIR%\sed.exe ":a;N;$!ba;s#\n</xs:documentation>#</xs:documentation>#g" "%%I" > "%OUT%\%%I_tmp1"
    REM pretty print
    %GNUDIR%\xmllint.exe --format "%OUT%\%%I_tmp1" > "%OUT%\%%I_tmp2"
    REM insert new line
    %GNUDIR%\sed.exe -f "%CWD%\prettyprint_xsd.script" "%OUT%\%%I_tmp2" > "%OUT%\%%I"
    REM remove tmp files
    DEL "%OUT%\%%I_tmp1"
    DEL "%OUT%\%%I_tmp2"
    ECHO file processed: "%OUT%\%%I"
)

EXIT /B
