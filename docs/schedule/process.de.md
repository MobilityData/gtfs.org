---
search:
  exclude: true
---

# Prozess zur Änderung der Spezifikation

Die GTFS ist nicht in Stein gemeißelt. Es handelt sich vielmehr um eine offene Spezifikation, die von der Gemeinschaft der Verkehrsunternehmen, Entwickler und anderen Beteiligten, die GTFS nutzen, entwickelt und gepflegt wird. Es wird erwartet, dass diese Gemeinschaft von Produzenten und Nutzern von GTFS Vorschläge zur Erweiterung der Spezifikation unterbreiten wird, um neue Funktionen zu ermöglichen. Um diesen Prozess zu unterstützen, wurden die folgenden Verfahren und Richtlinien festgelegt.

!!!note ""

    Die offizielle Spezifikation, Referenz und Dokumentation sind in englischer Sprache verfasst. Weicht eine Translation in eine andere Sprache vom englischen Original ab, hat letztere Vorrang. Die gesamte Kommunikation erfolgt in englischer Sprache.

1. Erstellen Sie einen Git-Zweig mit der Aktualisierung aller relevanten Teile der Protokolldefinition, der Spezifikation und der Dokumentationsdateien (mit Ausnahme der Übersetzungen).
1. Erstellen Sie einen Pull-Request auf [https://github.com/google/transit.](https://github.com/google/transit) Der Pull Request muss eine ausführliche Beschreibung des Patches enthalten. Der Ersteller des Pull Requests wird zum _Advocate_.
1. Sobald der Pull Request registriert ist, muss er von seinem Befürworter in der [GTFS Changes Mailingliste](https://groups.google.com/forum/#!forum/gtfs-changes) angekündigt werden, einschließlich eines Links zum Pull Request. Nach der Ankündigung wird der Pull Request als Vorschlag betrachtet. Die Pull-Anfrage sollte auch so bearbeitet werden, dass sie einen Link zu der Google Groups-Ankündigung enthält, so dass beide leicht miteinander verglichen werden können.
   * Da der Befürworter ein Mitwirkender ist, muss er die [Lizenzvereinbarung für Mitwirkende](https://github.com/google/transit/blob/master/CONTRIBUTING.md) unterzeichnen, bevor die Pull-Anfrage angenommen werden kann.
1. Die Diskussion des Vorschlags folgt. Als einziges Diskussionsforum sollten Pull-Request-Kommentare verwendet werden.
   * Die Diskussion dauert so lange, wie der Befürworter es für notwendig hält, mindestens jedoch 7 Kalendertage.
   * Der Befürworter ist für die rechtzeitige Aktualisierung des Vorschlags (d. h. des Pull Request) auf der Grundlage der Kommentare verantwortlich, denen er zustimmt.
   * Der Befürworter kann zu jedem time behaupten, dass der Vorschlag aufgegeben wurde.
1. Der Befürworter kann zu jedem time nach dem anfänglichen 7-Tage-Intervall, das für die Diskussion erforderlich ist, zur Abstimmung über eine Version des Vorschlags aufrufen.
   * Bevor er zur Abstimmung aufruft, sollten mindestens ein GTFS und ein GTFS die vorgeschlagene Änderung umsetzen. Es wird erwartet, dass der/die GTFS (en) die Änderung in einen öffentlich zugänglichen GTFS aufnimmt/aufnehmen und in den Kommentaren zum Pull Request einen Link zu diesen Daten bereitstellt/bereitstellen und dass der/die GTFS (en) in den Kommentaren zum Pull Request einen Link zu einer Anwendung bereitstellt/bereitstellen, die die Änderung in einer nicht-trivialen Weise nutzt (d.h. sie unterstützt neue oder verbesserte Funktionen).
1. Die Abstimmung dauert mindestens 7 FULL Kalendertage und 5 FULL Schweizer Arbeitstage. Die Abstimmung endet um 23:59:59 UTC.
   * Der Befürworter sollte die genaue time zu start der Abstimmung bekannt geben.
   * Während des Abstimmungszeitraums sind nur redaktionelle Änderungen am Vorschlag erlaubt (Tippfehler, Formulierungen dürfen geändert werden, solange sie den Sinn nicht verändern).
   * Jeder darf in Form eines Kommentars zum Pull-Request mit ja/nein stimmen, und Stimmen können bis zum end des Abstimmungszeitraums geändert werden.
   Wenn ein Wähler sein Votum ändert, wird empfohlen, den ursprünglichen Kommentar zu aktualisieren, indem man das Votum durchstreicht und das neue Votum schreibt.
   * Abstimmungen vor start des Abstimmungszeitraums werden nicht berücksichtigt.
   * Die Eröffnung und Schließung von Abstimmungen muss auf der [GTFS Changes Mailingliste](https://groups.google.com/forum/#!forum/gtfs-changes) bekannt gegeben werden.
1. Der Vorschlag ist angenommen, wenn ein einstimmiger Konsens mit mindestens 3 Stimmen vorliegt.
   * Die Stimme des Vorschlagsgebers zählt nicht für die Gesamtzahl von 3 Stimmen. Wenn z.B. Antragsteller X einen Pull Request erstellt und mit "Ja" stimmt, und Benutzer Y und Z mit "Ja" stimmen, wird dies als insgesamt 2 Ja-Stimmen gezählt.
   * Gegenstimmen müssen motiviert sein und idealerweise verwertbares Feedback liefern.
   * Wenn die Abstimmung gescheitert ist, kann der Befürworter entscheiden, ob er die Arbeit an dem Vorschlag fortsetzen oder den Vorschlag aufgeben möchte.
   Jede Entscheidung des Befürworters muss in der [GTFS Changes Mailingliste](https://groups.google.com/forum/#!forum/gtfs-changes) bekannt gegeben werden.
   * Wenn der Befürworter die Arbeit an dem Vorschlag fortsetzt, kann zu jedem time eine neue Abstimmung angesetzt werden.
1. Jeder Pull Request, der 30 Kalendertage lang inaktiv bleibt, wird geschlossen. Wenn ein Pull Request geschlossen wird, wird der entsprechende Vorschlag als aufgegeben betrachtet. Der Befürworter kann den Pull Request time wieder öffnen, wenn er die Konversation fortsetzen oder aufrechterhalten möchte.
1. Wenn der Vorschlag angenommen wird:
   * Google verpflichtet sich, die abgestimmte Version des Pull-Requests zusammenzuführen (vorausgesetzt, die Mitwirkenden haben den [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md) unterzeichnet) und den Pull-Request innerhalb von 5 Werktagen auszuführen.
   * Übersetzungen dürfen nicht in die ursprüngliche Pull-Anfrage aufgenommen werden.
   Google ist für die Aktualisierung der relevanten Übersetzungen in den unterstützten Sprachen verantwortlich, aber reine Translation aus der Community sind willkommen und werden akzeptiert, sobald alle redaktionellen Kommentare berücksichtigt wurden.
1. Das Endergebnis der Pull-Anfrage (angenommen oder aufgegeben) sollte in demselben Google Groups-Thread bekannt gegeben werden, in dem die Pull-Anfrage ursprünglich angekündigt wurde.

<hr/>

## Leitprinzipien

Um die ursprüngliche Vision von GTFS zu bewahren, wurde eine Reihe von Leitprinzipien aufgestellt, die bei der Erweiterung der Spezifikation zu berücksichtigen sind:

**Feeds sollten einfach zu erstellen und zu bearbeiten seinWir**<br/>haben uns für CSV als Basis für die Spezifikation entschieden, weil es mit Tabellenkalkulationsprogrammen und text einfach zu betrachten und zu bearbeiten ist, was für kleinere Agenturen hilfreich ist. Es lässt sich auch problemlos aus den meisten Programmiersprachen und Datenbanken generieren, was für die Herausgeber größerer Feeds von Vorteil ist.<br/>

**Feeds sollten einfach zu parsen**<br/>seinFeed-Leser sollten in der Lage sein, die gesuchten Informationen mit möglichst wenig Aufwand zu extrahieren. Änderungen und Ergänzungen des Feeds sollten so weit wie möglich nützlich sein, um die Anzahl der Codepfade zu minimieren, die die Leser des Feeds implementieren müssen. (Die Vereinfachung der Erstellung sollte jedoch Vorrang haben, da es letztlich mehr Feed-Herausgeber als Feed-Leser geben wird).<br/>

**In der Spezifikation geht es um FahrgastinformationenGTFS**<br/>befasst sich in erster Linie mit Fahrgastinformationen. Das heißt, die Spezifikation sollte in erster Linie Informationen enthalten, die den Fahrgästen bei der Nutzung von Hilfsmitteln helfen können. Es gibt potenziell eine große Menge an betriebsorientierten Informationen, die Verkehrsbetriebe intern zwischen Systemen übermitteln möchten. GTFS ist nicht für diesen Zweck gedacht und es gibt möglicherweise andere betriebsorientierte Datenstandards, die besser geeignet sind.<br/>

**Änderungen an der Spezifikation sollten rückwärtskompatibel seinWenn** wir<br/>der Spezifikation neue Funktionen hinzufügen, wollen wir Änderungen vermeiden, die bestehende Feeds ungültig machen. Wir wollen den Herausgebern von Feeds keine zusätzliche Arbeit machen, bis sie ihren Feeds neue Funktionen hinzufügen wollen. Außerdem möchten wir, wann immer möglich, dass bestehende Parser weiterhin in der Lage sind, die älteren Teile neuerer Feeds zu lesen.<br/>

**Von spekulativen Funktionen wird abgeratenJede**<br/>neue Funktion erhöht die Komplexität bei der Erstellung und dem Lesen von Feeds. Daher wollen wir darauf achten, nur Funktionen hinzuzufügen, von denen wir wissen, dass sie nützlich sind. Im Idealfall wurde jeder Vorschlag durch die Generierung von Daten für ein reales Verkehrssystem, das die neue Funktion nutzt, und durch das Schreiben von Software zum Lesen und Anzeigen der Daten getestet. Beachten Sie, dass das GTFS Erweiterungen durch Hinzufügen zusätzlicher Spalten und Dateien zulässt, die von den offiziellen Parsern und Validierern ignoriert werden, so dass Vorschläge leicht in Prototypen umgesetzt und an bestehenden Feeds getestet werden können.<br/>

<hr/>

## Historie der Revision

**März 14, 2023**<br/>

* Tarifmedien hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/355).

**26. Juli, 2022**<br/>

* Hinzufügen eines Transfers von Fahrt zu Fahrt mit der Option "In-Seat". Siehe [Diskussion](https://github.com/google/transit/pull/303)

**17. Mai 2022**<br/>

* GTFS-Fares V2 Basisimplementierung. Siehe [Diskussion](https://github.com/google/transit/pull/286)

**22. Oktober 2021**<br/>

* Primäre und fremde id hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/278)

**05. Oktober 2021**<br/>

* Übertragungen von Reise zu Reise und von Route zu Route wurden hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/284)

**15. September 2021**<br/>

* Erlaubt, dass fare gates (pathway_mode=6) bidirektional sind. Siehe [Diskussion](https://github.com/google/transit/pull/276).

**13. September 2021**<br/>

* Aktualisierte `stop_name` Best Practices. Siehe [Diskussion](https://github.com/google/transit/pull/282).

**27. August 2021**<br/>

* GTFS Schedule nach [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) aktualisiert. Siehe [Diskussion](https://github.com/google/transit/pull/277).

**4. Januar 2021**<br/>

* Klärung der Beschreibung von `stop_times.stop_id`. Siehe [Diskussion](https://github.com/google/transit/pull/258).
* Definierte positive und Nicht-Null-Feldvorzeichen. Siehe [Diskussion](https://github.com/google/transit/pull/251).

**Oktober 2, 2020**<br/>

* Der Feldtyp von `frequencies.headway_secs` wurde von einer nicht-negativen in eine positive Ganzzahl geändert. Siehe [Diskussion](https://github.com/google/transit/pull/249).

**25. Mai 2020**<br/>

* Definiert `pathways.txt`, `levels.txt` xt und `attributions.txt` als übersetzbare Tabellen. Es wurden Empfehlungen für die Übersetzung von mehrsprachigen `signposted_as` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/220).

**13. Mai 2020**<br/>

* `continuous_pickup` und `continuous_drop_off` zu `routes.txt` und `stop_times.txt` hinzugefügt. `shape_id` wurde von "Optional" auf "Conditionally required" geändert. Siehe [Diskussion](https://github.com/google/transit/pull/208).

**März 24, 2020**<br/>

* text Feld definiert und `tts_stop_name` zu `stops.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/49).

**5. Februar 2020**<br/>

* Oberleitungsbus und Einschienenbahn `route_types` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/174).

**9. Januar 2020**<br/>

* `translations.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/180).

**26. Dezember 2019**<br/>

* Aktualisierte Definitionen für Seilbahn und Luftseilbahn in `route_type`. Siehe [Diskussion](https://github.com/google/transit/pull/186).

**20. Dezember 2019**<br/>

* `attributions.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/192).

**26. August 2019**<br/>

* Es wurde festgelegt, dass `stop_lat` und `stop_lon` dort positioniert werden, wo Fahrgäste auf das Einsteigen warten. Siehe [Diskussion](https://github.com/google/transit/pull/179).

**9. Juli 2019**<br/>

* Best Practices für arrival und time hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/165).
* Bewährte Praktiken für Kopfschilder wurden hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/167).
* Best Practices für `stop_id` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/169).

**25. Juni 2019**<br/>

* Die Beziehung zwischen Shape und Haltestellen wurde geklärt. Siehe [Diskussion](https://github.com/google/transit/pull/39).

**4. April 2019**<br/>

* `platform_code` Feld in `stops.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/146).

**27. März 2019**<br/>

* `pathways.txt` und `levels.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/143).

**6. Februar 2019**<br/>

* Redaktionelle und Formatierungsänderungen für mehr Klarheit. Siehe [Diskussion](https://github.com/google/transit/pull/120).

**Oktober 2, 2018**<br/>

* Faktorisierte Feldtypen. Siehe [Diskussion](https://github.com/google/transit/pull/104).

**14. September 2018**<br/>

* Konzept "Conditionally required" hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/100).

**4. September 2018**<br/>

* Vereinheitlichung der Definitionen von `agency_lang` und `feed_lang`. Siehe [Diskussion](https://github.com/google/transit/pull/98).

**August 27, 2018**<br/>

* `CHANGES.md` und Datum der letzten Überarbeitung aktualisiert. Siehe [Diskussion](https://github.com/google/transit/pull/99).

**22. August 2018**<br/>

* Felder `feed_contact_email` und `feed_contact_url` in der Datei `feed_info.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/31).

**Dezember 11, 2017**<br/>

* `route_sort_order` zu `routes.txt` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/83).

**März 15, 2017**<br/>

* Es wurde klargestellt, dass die Stimme eines Vorschlagsgebers nicht zur Gesamtzahl zählt. Siehe [Diskussion](https://github.com/google/transit/pull/50).
* Es wurde festgelegt, dass vor dem Aufruf einer Abstimmung mindestens ein GTFS und ein GTFS die vorgeschlagene Änderung implementieren sollten. Siehe [Diskussion](https://github.com/google/transit/pull/46).

**7. Februar 2017**<br/>

* Klärung der Beziehung von `block_id` und `service_id`. Siehe [Diskussion](https://github.com/google/transit/pull/44).
* Es wurde klargestellt, dass der frequenzbasierte Dienst mit der departure vehicle beginnt. Siehe [Diskussion](https://github.com/google/transit/pull/42).
* Klärung der Beschreibungen von `stop_id` und `stop_code`. Siehe [Diskussion](https://github.com/google/transit/pull/40).

**11. Dezember 2017**<br/>

* Das Feld `route_sort_order` in der Datei `routes.txt` wurde hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/83).

**27. November 2016**<br/>

* Bahnhofseingang als `stops.location_type` hinzugefügt. Siehe [Diskussion](https://github.com/google/transit/pull/30).

**September 2, 2016**<br/>

* Die Dokumentation wurde aktualisiert, um `agency_id` unter `fare_attributes.txt` hinzuzufügen. Siehe [Diskussion](https://github.com/google/transit/pull/27).

**März 16, 2016**<br/>

* Umstellung der GTFS auf Github unter <https://github.com/google/transit>

**3. Februar 2016**<br/>

* `agency_email` zu `agency.txt` Vorschlag zu spec hinzugefügt: [Diskussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2. Februar 2015**<br/>

* stop_times.txt xt 'timepoint' Vorschlag zu spec hinzugefügt: [Diskussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**17. Februar 2014**<br/>

* trips.txt 'bikes_allowed' Vorschlag zur Spezifikation hinzugefügt: [Diskussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**Oktober 15, 2012**<br/>

* trips.txt wheelchair_accessible' Vorschlag zur Spezifikation hinzugefügt: [Diskussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**Juni 20, 2012**<br/>

* Vorschlag 'wheelchair_boarding' zur Spezifikation hinzugefügt: [Diskussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2. Februar 2012**<br/>

* Vorschlag 'stop_timezone' zu spec: [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4) hinzugefügt

**Januar 18, 2012**<br/>

* Die Dokumentation wurde von der alten Seite code.google.com auf die neue Seite developers.google.com verlagert.

**September 26, 2011**<br/>

* Vorschlag 'feed_info' zur Spezifikation hinzugefügt: [Diskussion](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**6. September 2011**<br/>

* Vorschlag 'agency_fare_url' zu spec: [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE) hinzugefügt
* Vorschlag 'exact_times' zur Spezifikation hinzugefügt: [Diskussion](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**März 30, 2009**<br/>

* Ein neuer Abschnitt darüber, wie man einen Transit-Feed öffentlich zugänglich macht. Dies wurde zuvor in der Gruppe nicht diskutiert, da es sich nicht um eine Änderung der Interpretation oder des Schreibens der Daten handelt. Einige Google-Mitarbeiter waren jedoch der Meinung, dass es informativ wäre, auch die Verwendung von GTFS außerhalb von Google zu diskutieren, da es immer mehr Anwendungen gibt, die GTFS Daten verwenden können.
* Klärung des CSV-Formats: [Diskussion](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk).
* Zusätzliche Hinweise zur Auswahl kontrastierender Farben in den Beschreibungen der Felder route_color und route_text_color.
* trip_short_name, wie in diesen Threads vorgeschlagen und getestet: a und b.
* Behebung eines kleinen Fehlers in den Beispieldaten am end des Dokuments (Angabe der Haltestelle S7 als übergeordnete Station S8).
* Hinzufügung von "agency_lang"-Informationen zu den Beispieldaten am end des Dokuments, wie von Marcy während der Kommentarphase vorgeschlagen: [Diskussion](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0).
* Aktualisierung des Links zu OCTAs GTFS in der Seitenleiste
* Siehe [ursprüngliche Zusammenfassung](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw).

**26. Februar 2009**<br/>

* Die meisten der Google-spezifischen Anweisungen zur Übermittlung des Feeds wurden entfernt, da es inzwischen viele andere Anwendungen gibt, die GTFS verwenden.
* In der Seitenleiste wurde ein fehlerhafter Link zum öffentlichen Feed der Orange County OCTA behoben.

**7. August 2008**<br/>

* Das Feld stop_url wurde wiederhergestellt, das in der Version vom 6. August versehentlich ausgelassen wurde.
* agency_phone zu Beispieldaten hinzugefügt
* Es wurde ein Hinweis auf die Datennutzungsvereinbarung hinzugefügt, wenn ein Feed an Google übermittelt wird.

**August 6, 2008**<br/>

* Hinzufügung der Datei transfers.txt, die es den Herausgebern von Feeds ermöglicht, Hinweise zum bevorzugten Übertragungsverhalten zu geben ([ursprünglicher Vorschlag](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw))
* Die Felder location_type und parent_station in stops.txt wurden hinzugefügt, so dass Haltestellen in Stationen gruppiert werden können ([ursprünglicher Vorschlag](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw))
* Das Feld agency_phone wurde hinzugefügt, um eine Telefonnummer für eine Agentur anzugeben ([ursprünglicher Vorschlag](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA))
* Abschnitt "Testing Your Feeds" mit Hinweisen auf Open-Source-Testwerkzeuge hinzugefügt
* Klarstellungen zum CSV-Format, agency_timezone, agency_lang, route_color, route_text_color, arrival_time, departure_time, calendar.txt vs. calendar_dates.txt, fare tables und frequencies.txt hinzugefügt
* Link zum Feed-Historiendokument hinzugefügt und einige öffentliche Feed-Links korrigiert
* Aktualisierte Beispielbilder, um die aktuelle Google Maps UI darzustellen
* Beispieldaten im Dokument aktualisiert/korrigiert

**29. Februar 2008**<br/>

* Feld stop_code in stops.txt hinzugefügt, um die Angabe von fahrerbezogenen Haltestellencodes zu ermöglichen ([ursprünglicher Vorschlag](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc))
* Klärung der Beschreibungen von route_short_name und route_long_name in routes.txt
* Klärung der Beschreibungen von arrival_time und departure_time in stop_times.txt
* Tippfehler im Abschnitt Beispieldaten korrigiert

**November 20, 2007**<br/>

* Klärung der Beschreibung von block_id
* Die Sprache wurde geändert, um Google Transit nicht mehr so stark zu betonen (da Anwendungen, die nicht von Google stammen, GTFS verwenden und Transit-Routing jetzt eine integrierte Funktion von Google Maps ist), und es wurden verschiedene Tippfehler korrigiert
* Aktualisierte Beispiel-Screenshots, um die Darstellung der GTFS in der aktuellen Google Maps-Benutzeroberfläche wiederzugeben
* Aktualisierung der Google-Kontakt-E-Mail-Adresse für Anbieter von Transitdaten
* Aktualisierte Formatierung

**Oktober 5, 2007**<br/>

* stop_sequence und shape_pt_sequence wurden so geändert, dass sie nun auch steigende nicht-negative Ganzzahlen zulassen
* Klarere Beschreibungen und Korrektur von Tippfehlern

**31. Mai 2007**<br/>

* Seitenstil aktualisiert, HTML sauberer und zugänglicher gemacht
* Links zu öffentlichen Feed-Beispielen und anderen nützlichen Seiten hinzugefügt
* Beispiele aus den Beschreibungen einzelner Felder entfernt

**9. April 2007**<br/>

* Abschnitt über das [Einreichen eines Feeds](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle) hinzugefügt.
* [Beispiel-Feed für eine Transitagentur](https://developers.google.com/transit/gtfs/examples/gtfs-feed) hinzugefügt.
* Hinweis hinzugefügt, dass calendar.txt weggelassen werden kann, wenn alle Dienstleistungsdaten in calendar_dates.txt definiert sind.
* Das Feld agency_id wurde in Feeds, die nur eine Agentur enthalten, optional gemacht. Dadurch können bestehende Feeds ohne agency_id gültig bleiben.
* Vollständigere Spezifikation von agency_url, stop_url und route_url sowie zusätzliche Beispielwerte für diese Felder hinzugefügt.
* 6 (Gondel) und 7 (Standseilbahn) wurden als gültige route_type hinzugefügt.

**8. März 2007**<br/>

* Geringfügige Änderung, um das Feld stop_url von stop_times.txt, wo es in der Aktualisierung vom 28. Februar falsch angegeben wurde, in stops.txt zu verschieben, wo es hingehört.

**5. März 2007**<br/>

* Kleine Änderung, um die Beschreibung des route_long_name Feldes zu verdeutlichen.

**28. Februar 2007**<br/>

* Hinzufügung von frequencies.txt für die Unterstützung von Fahrplänen auf Basis der Fahrzeit.
* Mehrere Agenturen sind jetzt im selben Feed erlaubt. Außerdem wurde das neue Feld agency_id sowohl in agencies.txt als auch in routes.txt hinzugefügt, mit dem man angeben kann, welche Route von welcher Agentur betrieben wird.
* Hinzufügen von URLs pro Strecke und pro Haltestelle.
* Hinzufügung des Feldes direction_id in trips.txt.
* Unterstützung für Änderungen von Haltestellenschildern während der Fahrt durch Hinzufügen des Feldes stop_headsign in stop_times.txt.
* Unterstützung für Routenfarben durch Hinzufügen von optionalen route_color und route_text_color in routes.txt.
* Die Möglichkeit, Haltestellen mit Straßenadressen anzugeben, wurde entfernt. In der vorherigen Version der Spezifikation war es möglich, die Lage einer Haltestelle über eine Straßenadresse in den Feldern stop_street, stop_city, stop_region, stop_postcode und stop_country anzugeben. Jetzt müssen die Haltestellenstandorte mit stop_lat für den latitude und stop_lon für den longitude angegeben werden, was für die meisten Anwendungen sinnvoller ist.
* Hinzufügen des vehicle der Seilbahn für das Feld route_type in routes.txt.
* Siehe die ursprüngliche Zusammenfassung der Änderungen im [Headway Blog Post](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/).

**November 29, 2006**<br/>

* Unterstützung für Shape über shapes.txt hinzugefügt
* Klärung der Definition von stop_sequence
* Markierung von pickup_type und drop_off_type als optional

**Oktober 31, 2006**<br/>

* Unterstützung für Fahrpreisinformationen hinzugefügt
* Datumsangaben aus einzelnen Dateinamen entfernt
* Die Definitionen der route_type wurden geändert
* Erlaubt die time Veröffentlichung mehrerer Feed-Dateien, solange sich deren Dienstzeiträume nicht überschneiden
* block_id in trips.txt wurde korrigiert, so dass sie korrekt als optional gekennzeichnet wurde
* Es wurde darauf hingewiesen, dass Spaltenüberschriften enthalten sein müssen.

**29. September 2006**<br/>

* Kleine Änderung, um einige Fehler in den Beispielen zu korrigieren.

**25. September 2006**<br/>

* Erste Version.
