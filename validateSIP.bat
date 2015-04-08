@ECHO OFF
SETLOCAL

CALL validateSIP_with_xmllint.bat SIP_20070923_v1.0_Vorgang-als-Text
CALL validateSIP_with_xmllint.bat SIP_20070923_v1.1_Vorgang+Aktivitaet
CALL validateSIP_with_xmllint.bat SIP_20070923_v1.1_Vorgang+Zusatzdaten
CALL validateSIP_with_xmllint.bat SIP_20070923_v1.1_einfache-Vorgaenge
