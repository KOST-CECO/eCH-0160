========================================================================================

Testbeispiel INTERLIS 2.3

Stand: März 2015

========================================================================================

1) Einleitung
-------------

Das Testbeispiel baut grundsaetzlich auf dem Testdatensatz der amtlichen
Vermessung auf (tdsav01_1d.itf). Allerdings handelt es sich *nicht* um
eine offizielle Umsetzung des Datenmodells DM01AVCH24D nach INTERLIS 2.3
sondern lediglich um ein INTERLIS 2.3 Beispiel, welches die Konzepte von
INTERLIS 2.3 an einem allgemein bekannten Beispiel verdeutlichen soll.

Das Testbeispiel INTERLIS 2.3 besteht aus folgenden Teilen:

+ Datenmodelle formuliert in INTERLIS 2.3.
+ Datensaetze in INTERILS 2.3 XML.
+ Graphische Abbildung formuliert in INTERLIS 2.3 (inkl 
  graphische Darstellung als .pdf Datei).

Die einzelnen Bestandteile des Testbeispiel sind in den folgenden Abschnitten 
beschrieben.

2) Datenmodelle
---------------

Die Datenmodelle stehen wie folgt zueinander in Beziehung:

  +----------------------+ +--------------------+
  !                      ! !                    !
  ! Erweiterung          ! !  Graphische Daten  !
  ! Test23_erweitert.ili ! !  Test23_gr.ili     !
  !                      ! !                    !
  +----------------------+ +---------+----------+
           |                         !
          / \                        v
  +---------------------------------------------+                        
  !                                             !
  ! Basismodell                                 !
  ! Test23.ili                                  !
  !                                             !
  +---------------------------------------------+
         ^                ^              ^
  +---------------------------------------------+
  !                                             !
  ! Standardmodelle aus dem Referenzhandbuch    !
  ! Units.ili, Time.ili                         !
  !                                             !
  +---------------------------------------------+

Erlaeuterungen:

+ Test23.ili ist das Basismodell. Es wurde aus dem Datenmodell
  DM01AVCH23D abgeleitet. Im Gegensatz zu DM01AVCH23D enthaelt
  Test23.ili keine graphischen Daten wie Text- oder Symbolpositionen
  (s.a. Test23_gr.ili) und keine Nachfuehrungstabellen (s.a. 
  Test23_erweitert.ili). Ausserdem wurde das Topic Gebaeudeadressen 
  vollstaendig weggelassen. 

+ Test23.ili benutzt (importiert) Definitionen aus den Standardmodellen 
  Units.ili und Time.ili (s.a. Unterverzeichnis RefHandbuch). 

+ Test23_erweitert.ili erweitert das Basismodell Test23.ili um
  Nachfuehrungstabellen.

+ Test23_gr.ili enthaelt alle graphischen Daten zum Basismodell. Die
  Objekte aus Test23.ili werden von Test23_gr.ili referenziert (mit
  Referenzen ueber Topic- bzw. Modellgrenzen). 

+ Test23.ili, Test23_erweitert.ili und Test23_gr.ili bilden zusammen alle
  Objekte des Datenmodells DM01AVCH23D ab (ausgenommen 
  Gebaeudeadressen).

+ Zu Test23.ili, Test23_erweitert.ili, Test23_gr.ili existieren zusaetzlich 
  franzoesische Uebersetzungen (TRANSLATION OF) im Unterverzeichnis fr. Die 
  Uebersetzungen haben jeweils den gleichen Namen wie die Orginalmodelle 
  jedoch noch zusaetzlich den Postfix "_fr" also z.B. (Test23_fr.ili).

3) Datensaetze
--------------

Der eigentliche Datensatz besteht aus folgenden Teilen:

+ Test23_erweitert.xml ist ein XML Datensatz gemaess Datenmodell
  Test23_erweitert.ili. Der Inhalt von Test23_erweitert.xml entspricht 
  dem Testdatensatz tdsav01_1d.itf jedoch ohne graphische Daten.
  Ausserdem haben alle Objekte in Test23_erweitert.xml OID's
  damit sie inkrementell nachgeliefert werden koennen.

+ Test23_gr.xml ist ein XML Datensatz gemaess Datenmodell Test23_gr.ili.
  In Test23_gr.xml sind nur graphische Daten zu Test23_erweitert.xml
  enthalten. Alle Objekte in Test23_gr.xml haben OID's damit sie
  inkrementell nachgeliefert werden koennen.

+ Ausserem sind die Testdatensaetze auch noch auf Franzoesisch
  vorhanden (Test23_etendu_fr.xml und Test23_gr_fr.xml)

4) Graphische Abbildung
-----------------------

Die Graphische Abbildung besteht aus folgenden Teilen:

  +------------------------+  +------------------+
  !                        !  !                  !
  ! Graphische Abbildung   !->! INTERLIS 2.3     !-> Test23.pdf
  ! Test23_Graphik.ili     !  ! Graphikprozessor !
  ! fuer Modell Test23.ili !  !                  !
  !                        !  !                  !
  +------------------------+  +---------+--------+
             !                          ^
             v                          !
  +-----------------------+  +----------------------+
  ! Signaturenbibliothek  !  ! Datensaetze          !
  ! StandardSymbology.xml !  ! Test23_erweitert.xml !
  +-----------------------+  ! Test23_gr.xml        !
                             +----------------------+

+ In Test23_Graphik.ili ist eine moegliche graphische Abbildung fuer
  das Datenmodell Test23.ili bzw. Test23_erweitert.ili definiert.

+ Ein INTERLIS 2.3 Graphikprozessor erzeugt aus den Definitionen in
  Test23_Graphik.ili und aus den Datensaetzen StandardSymbology.xml,
  Test23_erweitert.xml bzw. Test23_gr.xml die Graphikdatei Test23.pdf.

+ Die Signaturenbibliothek StandardSymbology.xml ist gemaess
  dem Standardmodell StandardSymbology.ili (basiert auf AbstractSymbology.ili)
  aufgebaut.
