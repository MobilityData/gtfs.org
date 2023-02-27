# Hinzufügen neuer Felder zu GTFS Realtime

Wenn ein Produzent oder Konsument daran interessiert ist, ein neues Feld zur GTFS Realtime Spezifikation hinzuzufügen, sollte er einen neuen Eintrag im [GTFS Realtime GitHub Repository](https://github.com/google/transit) öffnen, der das vorgeschlagene Feld beschreibt und dieses neue Feld (einschließlich eines Links zum Eintrag) auf der [GTFS Realtime Mailingliste](https://groups.google.com/forum/#!forum/gtfs-realtime) ankündigen.

## Prozess zur Änderung der Spezifikation

1. Erstellen Sie einen Git-Zweig mit der Aktualisierung aller relevanten Teile der Protokolldefinition, der Spezifikation und der Dokumentationsdateien (mit Ausnahme der Übersetzungen).
2. Erstellen Sie einen Pull-Request auf [https://github.com/google/transit.](https://github.com/google/transit) Der Pull Request muss eine ausführliche Beschreibung des Patches enthalten. Der Ersteller des Pull Requests wird zum *Advocate*.
3. Sobald der Pull Request registriert ist, muss er von seinem Befürworter in der [GTFS Realtime Mailingliste](https://groups.google.com/forum/#!forum/gtfs-realtime) angekündigt werden. Nach der Ankündigung wird der Pull Request als Vorschlag betrachtet.
     - Da der Befürworter ein Mitwirkender ist, muss er die [Lizenzvereinbarung für Mitwirkende](https://github.com/google/transit/blob/master/CONTRIBUTING.md) unterzeichnen, bevor der Pull Request angenommen werden kann.
4. Die Diskussion des Vorschlags folgt. Als einziges Diskussionsforum sollten Pull-Request-Kommentare verwendet werden.
     - Die Diskussion dauert so lange, wie der Befürworter es für notwendig hält, mindestens jedoch 7 Kalendertage.
     - Der Befürworter ist für die rechtzeitige Aktualisierung des Vorschlags (d. h. des Pull Request) auf der Grundlage der Kommentare verantwortlich, denen er zustimmt.
     - Der Befürworter kann zu jedem time behaupten, dass der Vorschlag aufgegeben wurde.
5. Der Befürworter kann zu jedem beliebigen Zeitpunkt nach dem anfänglichen 7-Tage-Intervall, das für die Diskussion erforderlich ist, zur Abstimmung über eine Version des Vorschlags aufrufen.
     - Bevor er zur Abstimmung aufruft, sollten mindestens ein GTFS-Realtime produzent und ein GTFS-Realtime konsument die vorgeschlagene Änderung umsetzen. Es wird erwartet, dass der/die GTFS-Realtime produzent(en) die Änderung in einen öffentlich zugänglichen GTFS-Realtime-Feed einbindet/einbinden und einen Link zu diesen Daten in den Pull-Request-Kommentaren bereitstellt/bereitstellen, und dass der/die GTFS-Realtimekonsument(en) einen Link in den Pull-Request-Kommentaren zu einer Anwendung bereitstellt/bereitstellen, die die Änderung in einer nicht-trivialen Weise nutzt (d.h. sie unterstützt neue oder verbesserte Funktionalität).
     - Wenn der Befürworter zu einer Abstimmung aufruft, sollte er klar angeben, ob die Abstimmung für die offizielle Aufnahme des Feldes in die Spezifikation oder für ein experimentelles Feld ist.
6. Die Abstimmung dauert mindestens 7 volle Kalendertage und 5 volle Schweizer Arbeitstage. Die Abstimmung endet um 23:59:59 UTC.
     - Der Befürworter sollte die genaue Endzeit zu Beginn der Abstimmung bekannt geben.
     - Während des Abstimmungszeitraums sind nur redaktionelle Änderungen am Vorschlag erlaubt (Tippfehler, Formulierungen dürfen geändert werden, solange sie den Sinn nicht verändern).
     - Jeder darf in Form eines Kommentars zum Pull-Request mit ja/nein stimmen, und Stimmen können bis zum Ende des Abstimmungszeitraums geändert werden.
   Wenn ein Wähler sein Votum ändert, wird empfohlen, den ursprünglichen Kommentar zu aktualisieren, indem man das Votum durchstreicht und das neue Votum schreibt.
     - Abstimmungen vor Beginn des Abstimmungszeitraums werden nicht berücksichtigt.
7. Der Vorschlag ist angenommen, wenn ein einstimmiger Konsens mit mindestens 3 Stimmen vorliegt.
     - Die Stimme des Vorschlagsgebers zählt nicht für die Gesamtzahl von 3 Stimmen. Wenn z.B. Antragsteller X einen Pull Request erstellt und mit "Ja" stimmt, und Benutzer Y und Z mit "Ja" stimmen, wird dies als 2 Ja-Stimmen gezählt.
     - Gegenstimmen müssen motiviert sein und idealerweise verwertbares Feedback liefern.
     - Wenn die Abstimmung gescheitert ist, kann der Befürworter entscheiden, ob er die Arbeit an dem Vorschlag fortsetzen oder den Vorschlag aufgeben möchte.
   Beide Entscheidungen des Befürworters müssen in der Mailingliste bekannt gegeben werden.
     - Wenn der Befürworter die Arbeit an dem Vorschlag fortsetzt, kann jederzeit eine neue Abstimmung angesetzt werden.
8. Jede Pull-Anfrage, die 30 Kalendertage lang inaktiv bleibt, wird geschlossen. Wenn eine Pull-Anfrage geschlossen wird, gilt der entsprechende Vorschlag als aufgegeben. Der Befürworter kann den Pull Request jederzeit wieder öffnen, wenn er die Konversation fortsetzen oder aufrechterhalten möchte.
     - Beachten Sie, dass der Befürworter sich dafür entscheiden kann, die Funktion als [benutzerdefinierte Erweiterung](#extensions) zu implementieren, anstatt sie in die offizielle Spezifikation aufzunehmen.
9. Wenn der Vorschlag angenommen wird:
     - Google verpflichtet sich, die abgestimmte Version des Pull-Requests zusammenzuführen (vorausgesetzt, die Mitwirkenden haben den [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md) unterzeichnet) und den Pull-Request innerhalb von 5 Werktagen auszuführen.
     - Google verpflichtet sich, das Repository <https://github.com/google/gtfs-realtime-bindings> zeitnah zu aktualisieren. Commits zu gtfs-realtime-bindigs, die auf einen Vorschlag zurückgehen, sollten auf den Pull Request des Vorschlags verweisen.
     - Übersetzungen dürfen nicht in die ursprüngliche Pull-Anfrage aufgenommen werden.
   Google ist dafür verantwortlich, relevante Übersetzungen in unterstützte Sprachen zu aktualisieren, aber reine Übersetzungs-Pull-Requests aus der Community sind willkommen und werden akzeptiert, sobald alle redaktionellen Kommentare berücksichtigt wurden.

## *Experimentelle* Felder

1. Wenn sich die Community darauf einigen kann, dass (a) das vorgeschlagene Feld nützlich erscheint und (b) der Typ des Feldes`(optional` vs. `repeated`, `string` vs. `int` vs. `bool`), dann wird eine Feldnummer in der GTFS Realtime-Nachricht vergeben und ein Hinweis in der [.proto-Datei](../proto) und der Dokumentation aufgenommen, dass es sich um ein *experimentelles* Feld handelt, das sich in Zukunft ändern kann.
     - Der Konsens wird durch ein Diskussions- und Abstimmungsverfahren erreicht, das dem unten beschriebenen [Verfahren zur Änderung der Spezifikation](#specification-amendment-process) entspricht, wobei jedoch anstelle einer einstimmigen Zustimmung nur 80 % Ja-Stimmen für die Genehmigung erforderlich sind.
     - GTFS-Realtime produzenten und -konsumenten, die das neue *experimentelle* Feld verwenden möchten, werden ihre Bibliothek unter Verwendung der .proto-Datei mit dem neuen Feld neu generieren (z. B. wird Google die [gtfs-realtime-bindings Bibliothek](https://github.com/google/gtfs-realtime-bindings) aktualisieren) und damit beginnen, das Feld mit Live-Daten zu füllen und zu analysieren.
     - Sobald wir uns davon überzeugt haben, dass das *experimentelle* Feld sinnvoll ist und sowohl Produzenten als auch Konsumenten das Feld nutzen, werden wir den unten beschriebenen [Prozess zur Änderung der Spezifikation](#specification-amendment-process) befolgen, um das Feld offiziell in die Spezifikation aufzunehmen.
     - Wenn das *experimentelle* Feld nicht innerhalb von zwei Jahren nach seiner Genehmigung als *experimentelles* Feld über den [Prozess zur Änderung der Spezifikation](#specification-amendment-process) angenommen wird, wird es durch Hinzufügen von `[deprecated=true]` neben dem Feldwert in der [.proto-Datei](../proto) als veraltet eingestuft. Durch die Verwendung von `[deprecated=true]` (anstelle von `RESERVED`) müssen Hersteller und Verbraucher, die das Feld bereits übernommen haben, es nicht aus dem Gebrauch nehmen. Darüber hinaus kann das Feld in der Zukunft "nicht mehr veraltet" sein, wenn es in einer nachfolgenden Abstimmung nach dem [Spezifikationsänderungsprozess](#specification-amendment-process) genehmigt wird (z. B. wenn zusätzliche Hersteller und/oder Verbraucher das Feld verwenden).
2. Wenn das neue Feld als spezifisch für einen einzelnen Produzenten angesehen wird oder es Streit über den Datentyp gibt, dann werden wir dem Produzenten eine [benutzerdefinierte Erweiterung](../extensions) zuweisen, damit er das Feld in seinem eigenen Feed verwenden kann. Wenn möglich, sollten wir Erweiterungen vermeiden und Felder, die für viele Agenturen nützlich sind, in die Hauptspezifikation aufnehmen, um eine Fragmentierung und zusätzliche Arbeit für die Verbraucher zur Unterstützung verschiedener Erweiterungen der Spezifikation zu vermeiden.

## Leitprinzipien

Um die ursprüngliche Vision von GTFS Realtime zu bewahren, wurde eine Reihe von Leitprinzipien aufgestellt, die bei der Erweiterung der Spezifikation zu berücksichtigen sind:

<br/>**Feeds sollten effizient in Echtzeit produziert und konsumiert werden können.**

Echtzeitinformationen sind ein kontinuierlicher, dynamischer Datenstrom, der zwangsläufig eine effiziente Verarbeitung erfordert. Wir haben uns für Protokollpuffer als Grundlage für die Spezifikation entschieden, weil sie einen guten Kompromiss zwischen der Benutzerfreundlichkeit für Entwickler und der Effizienz bei der Datenübertragung bieten. Im Gegensatz zu GTFS gehen wir nicht davon aus, dass viele Agenturen GTFS Realtime Feeds von Hand bearbeiten werden. Die Wahl von Protokollpuffern spiegelt die Schlussfolgerung wider, dass die meisten GTFS-Realtime-Feeds programmatisch erzeugt und konsumiert werden.

<br/>**In der Spezifikation geht es um Fahrgastinformationen.**

Wie GTFS zuvor geht es auch bei GTFS Realtime in erster Linie um Fahrgastinformationen. Das heißt, die Spezifikation sollte in erster Linie Informationen enthalten, die den Fahrgästen als Hilfsmittel dienen können. Es gibt potenziell eine große Menge an betriebsorientierten Informationen, die Verkehrsunternehmen intern zwischen Systemen übermitteln möchten. GTFS Realtime ist nicht für diesen Zweck gedacht, und es gibt möglicherweise andere betriebsorientierte Datenstandards, die besser geeignet sind.

<br/>**Änderungen an der Spezifikation sollten rückwärtskompatibel sein.**

Wenn wir der Spezifikation neue Funktionen hinzufügen, wollen wir Änderungen vermeiden, die bestehende Feeds ungültig machen. Wir wollen den Herausgebern von Feeds nicht noch mehr Arbeit machen, bis sie ihren Feeds neue Funktionen hinzufügen wollen. Außerdem möchten wir, wann immer möglich, dass bestehende Parser weiterhin in der Lage sind, die älteren Teile neuerer Feeds zu lesen. Die Konventionen für die Erweiterung von Protocol Buffers werden die Rückwärtskompatibilität bis zu einem gewissen Grad erzwingen. Wir möchten jedoch semantische Änderungen an bestehenden Feldern vermeiden, die die Rückwärtskompatibilität ebenfalls beeinträchtigen könnten.

<br/>**Von spekulativen Funktionen wird abgeraten.**

Jede neue Funktion erhöht die Komplexität beim Erstellen und Lesen von Feeds. Daher möchten wir darauf achten, nur Funktionen hinzuzufügen, von denen wir wissen, dass sie nützlich sind. Im Idealfall wurde jeder Vorschlag getestet, indem Daten für ein reales Verkehrssystem erzeugt wurden, das die neue Funktion verwendet, und eine Software geschrieben wurde, um diese zu lesen und anzuzeigen.

## Historie der Revision

**12. März 2020**

- Aktualisierung der `TripDescriptor` Beschreibung auf der GTFS Realtime-Referenzseite.

**Februar 26, 2015**

- Experimentelles Feld `direction_id` zu `TripDescriptor` hinzugefügt[(Diskussion](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J)).

**30. Januar 2015**

- Protokollpuffer-Erweiterungsnamensraum zu allen verbleibenden GTFS-Realtime nachrichten hinzugefügt, die noch keinen hatten (wie `FeedMessage` und `FeedEntity`).

**28. Januar 2015**

- Experimentelles Feld `delay` zu `TripUpdate` hinzugefügt[(](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8)Diskussion).

**16. Januar 2015**

- Aktualisierung der Beschreibung von `TripDescriptor.start_time`.

**Januar 8, 2015**

- Experimentelles enum `OccupancyStatus` definiert.
- Das experimentelle Feld `occupancy_status` wurde zu `VehiclePosition` hinzugefügt[(](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM)Diskussion).

**Mai 22, 2014**

- Aktualisierte Beschreibung von `ScheduleRelationship` enum in `StopTimeUpdate` Nachricht[(](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)Diskussion).
- REPLACEMENT aus den `ScheduleRelationship` enum Werten in der `TripDescriptor` Nachricht entfernt[(](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)Diskussion).

**Okt 12, 2012**

- Zeitstempel-Feld zu `TripUpdate` Nachricht hinzugefügt.

**May 30, 2012**

- Spezifische Details zu Extensions zur Spezifikation hinzugefügt.

**November 30, 2011**

- Protokollpuffer-Erweiterungsnamensraum zu den wichtigsten GTFS-Realtime nachrichten hinzugefügt, um das Schreiben von Erweiterungen in die Spezifikation zu erleichtern.

**Oktober 25, 2011**

- Die Dokumentation wurde aktualisiert, um klarzustellen, dass `alert`, `header_text` und `description_text` beides Klartextwerte sind.

**August 20, 2011**

- Die Dokumentation wurde aktualisiert, um die Semantik der `TimeRange` Meldung zu klären.

**August 22, 2011**

- Erste Version.
