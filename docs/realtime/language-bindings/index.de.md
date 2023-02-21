# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

Aus der [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protokollpuffer spezifikation generierte Sprachbindungen für gängige Sprachen.

## Einführung

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ist ein Datenformat für die Übermittlung von Echtzeitinformationen über öffentliche Verkehrssysteme.GTFS Realtime-Daten werden mit [ProtocolBuffers](https://developers.google.com/protocol-buffers/) kodiert und dekodiert, einer kompakten binären Darstellung, die für eine schnelle und effiziente Verarbeitung konzipiert ist. Das Datenschema selbst ist in [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) definiert.

Um mit GTFS Realtime Daten zu arbeiten, verwendet ein Entwickler normalerweise das `gtfs-realtime.proto` Schema, um Klassen in der Programmiersprache seiner Wahl zu erzeugen. Diese Klassen können dann dazu verwendet werden, GTFS-Realtime-Datenmodellobjekte zu konstruieren und sie als Binärdaten zu serialisieren oder, in umgekehrter Richtung, Binärdaten in Datenmodellobjekte zu parsen.

Da die Generierung von GTFS-Realtime-Datenmodellklassen aus dem `gtfs-realtime.proto` Schema eine weit verbreitete Aufgabe ist, aber auch eine, die bei Erstentwicklern manchmal Verwirrung stiftet, zielt dieses Projekt darauf ab, vorgenerierte GTFS-Realtime-Sprachbindungen für eine Reihe der beliebtesten Programmiersprachen bereitzustellen. Wenn möglich, werden diese Sprachbindungen als Pakete veröffentlicht, um ihre Verwendung in anderen Projekten zu erleichtern.

## Unterstützte Sprachen

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *(Veraltet seit Anfang 2019)*
* ~~[PHP](php.md)~~ *(Veraltet seit Anfang 2019)*

## Andere Sprachen

Wir stellen keinen generierten Code für C++ zur Verfügung, verwenden Sie dafür den offiziellen Protoc-Compiler (von [hier](https://developers.google.com/protocol-buffers/docs/downloads) oder [hier](https://github.com/google/protobuf))

Vermissen wir Ihre Lieblingssprache? Erwägen Sie einen Beitrag zu leisten:

1. Lesen Sie [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md).
2. Eröffnen Sie einen Pull-Request mit der Sprache Ihrer Wahl. Bitte fügen Sie Anweisungen zur Aktualisierung bei (idealerweise Skripte). Stellen Sie außerdem ein für das Ökosystem der Sprache geeignetes Paket bereit.

## Projekt-Geschichte

Dieses Projekt wurde ursprünglich von Google erstellt - MobilityData hat Anfang 2019 begonnen, das Projekt zu pflegen.

Ältere Versionen der Bindungsbibliotheken werden noch unter dem Namen von Google veröffentlicht. Sehen Sie sich die Dokumentation für jede Sprache [hier](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) an, um die letzte von Google veröffentlichte Version zu finden.
