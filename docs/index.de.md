---
search:
  exclude: true
---

# GTFS: Öffentliche Verkehrsdaten universell zugänglich machen

<div class="landing-page">
   <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">Ressourcen</a><a class="button" href="extensions">Erweiterungen</a>
</div>

Die General Transit Feed SpecificationGTFS) ist ein [offener Standard](https://www.interoperablemobility.org/definitions/#open_standard), der verwendet wird, um Fahrgästen relevante Informationen über Verkehrssysteme zur Verfügung zu stellen. Er ermöglicht es öffentlichen Verkehrsbetrieben, ihre Verkehrsdaten in einem Format zu veröffentlichen, das von einer Vielzahl von Softwareanwendungen genutzt werden kann. Heute wird das GTFS von Tausenden von öffentlichen Verkehrsbetrieben verwendet.

GTFS besteht aus zwei Hauptbestandteilen: GTFS Schedule und GTFS Realtime. GTFS Schedule enthält Informationen zu Routen, Fahrplänen, Tarifen und geografischen Transitdetails und wird in einfachen Textdateien dargestellt. Dieses unkomplizierte Format ermöglicht eine einfache Erstellung und MAINTENANCE, ohne auf komplexe oder proprietäre Software angewiesen zu sein.

GTFS Realtime enthält aktualisierte Fahrten, Fahrzeugpositionen und Servicewarnungen. Es basiert auf Protokollpuffern, die einen sprach- (und plattform-) neutralen Mechanismus zur Serialisierung strukturierter Daten darstellen.

GTFS wird weltweit unterstützt, und seine Verwendung, Bedeutung und sein Umfang haben zugenommen. Es ist wahrscheinlich, dass ein Unternehmen, das Sie kennen, GTFS bereits verwendet, um Routen, Fahrpläne, Haltestellenstandorte und andere Informationen darzustellen, und dass die Fahrgäste diese Daten bereits über verschiedene Anwendungen nutzen.

[Erfahren Sie mehr über die Geschichte von GTFS](background.md)

## Warum GTFS verwenden?

GTFS wird von über 10.000 Verkehrsbetrieben in über 100 Ländern verwendet. Die meisten Verkehrsbetriebe haben bereits von GTFS gehört, und es hat sich schnell zu einem Branchenstandard entwickelt. Einige Verkehrsunternehmen erstellen diese Daten selbst, während andere einen Anbieter damit beauftragen, die Daten für sie zu erstellen und zu pflegen. Da es sich um einen einfachen, textbasierten offenen Standard handelt, können viele Anbieter von Verkehrstechnologie GTFS bereits lesen und beschreiben. Durch ein besseres Verständnis von GTFS können die Verkehrsunternehmen bessere Entscheidungen in Bezug auf ihre Daten treffen. Die Entscheidungen, die Agenturen bei der Pflege und Verteilung von GTFS treffen, können einen großen Einfluss auf die Servicequalität haben.

### Offene Daten bedeuten mehr Möglichkeiten und Wahlmöglichkeiten

GTFS ist ein offener Standard. Das bedeutet, dass Agenturen Informationen mit einem der vielen Tools zur Verfügung stellen können, die GTFS bereits unterstützen (einschließlich einfacher Textbearbeitung mit einem Texteditor oder einer Tabellenkalkulation). Offene Standards führen zur Erstellung von Daten, die leicht weitergegeben werden können. Ein Feed ist einfach eine Sammlung von Textdateien, die einen Dienst beschreiben und online unter einem öffentlich zugänglichen Permalink gehostet werden. Derselbe Feed kann von Google, Apple, Transit App, Open Trip Planner und sogar von Fahrgästen erstellten Apps verwendet werden. Jeder, der genaue und aktuelle Verkehrsinformationen bereitstellen möchte, kann dazu einen GTFS verwenden.

Manche Fahrgäste verwenden je nach ihren Bedürfnissen verschiedene Apps - mit GTFS können sie wählen, welche Reiseplanungs-App ihnen am besten gefällt. Einige Apps sind vielleicht zugänglicher oder bieten bessere Informationen für Fahrgäste mit Behinderungen, andere sind einfacher und leichter zu bedienen, und manchmal wollen Fahrgäste einfach nur die neueste App.

### GTFS kann wahrscheinlich mehr, als Sie denken

GTFS ist vor allem für die Fahrplanauskunft bekannt, insbesondere in Ballungsräumen mit festem Streckennetz. Es gibt jedoch eine Reihe optionaler Funktionen, die über die grundlegende GTFS Schedule hinausgehen und GTFS breiter einsetzbar machen, darunter Fares zur Anzeige von Fahrpreisen und -strukturen, Flex (in Entwicklung) für bedarfsgesteuerte Beförderungsoptionen wie Dial-a-Ride- und Paratransit-Dienste und Pathways zur Anzeige von Informationen zur Barrierefreiheit, die für Fahrgäste, die Mobilitätshilfen nutzen oder zusätzliche Hilfsmittel benötigen, wichtig sind. GTFS Realtime baut auf dem GTFS Schedule und den fahrzeugeigenen GPS-Systemen auf, um Echtzeit-Updates zu Fahrzeugstandorten zu liefern.

### GTFS ist mehr als nur Fahrtenplanung

GTFS werden heute von einer Vielzahl von Softwareanwendungen für viele verschiedene Zwecke genutzt, einschließlich Datenvisualisierung und Analysetools für die Planung. Aktuelle und qualitativ hochwertige Daten bieten nicht nur den Fahrgästen, sondern auch Planern und politischen Entscheidungsträgern genaue Informationen über die Nutzung des öffentlichen Nahverkehrs in ihren Gemeinden. Ab 2023 wird die US-amerikanische Verkehrsbehörde Federal Transit Administration von den Verkehrsbetrieben verlangen, dass sie zusammen mit ihrem jährlichen Bericht über die [National Transit Database gültige GTFS übermitteln](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications).

## Was ist GTFS in hoher Qualität?

Hochwertige GTFS sind vollständig, genau und aktuell. Das bedeutet, dass sie den aktuellen Betrieb der Dienste widerspiegeln und so viele Informationen wie möglich enthalten.

### Vollständige Daten

Qualitativ hochwertige GTFS enthalten wichtige Service-Details, wie z. B. Urlaub und Sommerfahrplanänderungen, genaue Haltestellenstandorte sowie Namen für Linien und Kopfschilder, die mit anderen für die Fahrgäste bestimmten Materialien übereinstimmen. Auch wenn ein Verkehrsunternehmen GTFS von einem Anbieter erstellen lässt, liegt es letztendlich in der Verantwortung des Unternehmens sicherzustellen, dass die Informationen in gedruckter Form, an Bord und online konsistent sind.

Informationen zur Erstellung qualitativ hochwertiger Daten finden Sie in den [Richtlinien für Transitdaten in Kalifornien](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) und den [GTFS Bewährte Praktiken](schedule/best-practices).

### Auf dem neuesten Stand

Veraltete Daten sind fast noch schlimmer als gar kein Feed. Es reicht nicht aus, einfach nur Informationen zu veröffentlichen - sie müssen mit dem übereinstimmen, was der Fahrgast sieht und erlebt. Einige der größten Verkehrsunternehmen aktualisieren ihre GTFS wöchentlich oder sogar täglich, aber die meisten Unternehmen müssen ihre GTFS alle paar Monate oder einige Male im Jahr aktualisieren, wenn sich das Angebot ändert. Dazu gehören z. B. neue Strecken oder Haltestellen, Fahrplanänderungen oder Aktualisierungen der Tarifstruktur.

Viele Verkehrsunternehmen beauftragen einen Anbieter mit der Erstellung und Verwaltung ihrer GTFS. Einige Anbieter erkundigen sich proaktiv nach Serviceänderungen, aber es ist wichtig, dass die Agenturen mit den Anbietern über bevorstehende Serviceänderungen kommunizieren. Es ist möglich, GTFS mit Serviceänderungen im Voraus zu veröffentlichen, um sicherzustellen, dass die Umstellung für alle reibungslos verläuft - für Agenturen, Anbieter, Reiseplaner und Fahrgäste!

