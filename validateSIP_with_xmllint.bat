@ECHO OFF
SETLOCAL

IF [%1]==[] (
        ECHO usage: %0 path\SIP...
        EXIT /B
)

IF NOT EXIST %1 (
        ECHO SIP path %1 not found
        ECHO usage: %0 path\SIP...
        EXIT /B
)

IF NOT EXIST %1\header\metadata.xml (
        ECHO %1\header\metadata.xml not found
        ECHO usage: %0 path\SIP...
        EXIT /B
)

for /F "tokens=*" %%G in ('DIR /B %1\header\xsd\arelda*.xsd') DO (
SET arelda=%%G
)
ECHO .
ECHO Version: %arelda%
ECHO .
xmllint.exe -noout -schema %1\header\xsd\%arelda% %1\header\metadata.xml
ECHO .

PAUSE
