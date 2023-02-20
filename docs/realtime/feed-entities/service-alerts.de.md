# Service Alerts

Mit Service Alerts können Sie Aktualisierungen bereitstellen, wenn es zu Störungen im Netz kommt. Verspätungen und Stornierungen einzelner Fahrten sollten in der Regel über [Trip Updates](trip-updates.md) mitgeteilt werden.

Sie haben die Möglichkeit, Folgendes anzugeben:

*   URL - Link zu Ihrer Website, auf der Sie mehr über die Warnung erfahren
*   Kopfzeilentext - eine Zusammenfassung der Meldung
*   Beschreibung - eine ausführliche Beschreibung der Warnung, die immer neben der Kopfzeile angezeigt wird (diese Informationen sollten also nicht wiederholt werden).

## TimeRange

Die Meldung wird gegebenenfalls innerhalb des angegebenen Zeitraums angezeigt. Diese Zeitspanne sollte den gesamten Zeitraum abdecken, in dem die Meldung für den Fahrgast von Nutzen ist.

Wird keine Zeit angegeben, wird die Meldung so lange angezeigt, wie sie im Feed enthalten ist. Wenn mehrere Zeiträume angegeben werden, wird die Meldung während aller Zeiträume angezeigt.

## EntitySelector

Mit dem Entitätsselektor können Sie genau angeben, welche Teile des Netzes von dieser Warnung betroffen sind, so dass wir dem Benutzer nur die am besten geeigneten Warnungen anzeigen können. Sie können mehrere Entitätsselektoren für Warnungen einfügen, die mehrere Entitäten betreffen.

Die Entitäten werden anhand ihrer GTFS-Kennungen ausgewählt, und Sie können eine der folgenden Optionen wählen:

*   Agency - betrifft das gesamte Netz
*   Route - betrifft die gesamte Strecke
*   Route type - betrifft jede Strecke dieses Typs, z. B. alle U-Bahnen.
*   Trip - betrifft eine bestimmte Fahrt
*   Stop - betrifft eine bestimmte Haltestelle

Sie können mehr als eines der oben aufgeführten Felder in eine `informed_entity` aufnehmen. Wenn mehrere Felder in einer `informed_entity` enthalten sind, sollten sie so interpretiert werden, als seien sie durch den logischen Operator `AND` verbunden. Mit anderen Worten, die Ausschreibung sollte nur in einem Kontext angewandt werden, der alle in einer `informed_entity` angegebenen Felder erfüllt. Zum Beispiel, wenn `route_id: "1"` und `stop_id: "5"` beide in einer `informed_entity` enthalten sind, sollte die Warnmeldung nur für die Linie 1 an der Haltestelle 5 gelten. Sie sollte NICHT für eine andere Haltestelle der Linie 1 und NICHT für eine andere Linie an der Haltestelle 5 gelten.

Wenn Sie eine Ausschreibung darstellen möchten, die mehr als eine Einheit betrifft (z. B. eine Ausschreibung für die Linie 1 und die Haltestelle 5), sollten Sie Ihrer `alert` mehrere `informed_entity` hinzufügen, wobei sich jede von ihnen auf die betroffene Einheit bezieht (z. B. eine `informed_entity`, die die Linie 1 umfasst, und eine weitere `informed_entity`, die die Haltestelle 5 umfasst).

## Cause

Was ist die Ursache für diese Meldung? Sie können eine der folgenden Angaben machen:

*   Unknown cause
*   Other cause (nicht durch eine dieser Optionen repräsentiert)
*   Technical problem
*   Strike
*   Demonstration
*   Accident
*   Holiday
*   Weather
*   Maintenance
*   Construction
*   Police activity
*   Medical emergency

## Effect

Welche Auswirkungen hat dieses Problem auf die angegebene Einrichtung? Sie können eine der folgenden Angaben machen:

*   No service
*   Reduced service
*   Significant delays (unbedeutende Verspätungen sollten nur durch [Trip updates](trip-updates.md) gemeldet werden).
*   Detour
*   Additional service
*   Modified service: Der Betrieb weicht von dem ab, was der Fahrgast normalerweise erwarten würde. Ein Beispiel dafür ist eine Warnung, die die Fahrgäste an einen bevorstehenden Feiertag erinnert, der an diesem Wochentag anders ist als der normale Betrieb.
*   Stop moved
*   Other effect (nicht durch eine dieser Optionen repräsentiert)
*   Unknown effect
*   No effect: Die Warnung dient der Information der Fahrgäste, hat aber keine Auswirkungen auf den Betrieb. Beispiele hierfür sind die Ankündigung öffentlicher Versammlungen und die Einholung von Feedback über Umfragen.
*   Accessibility issue: Die Warnung informiert über Zugänglichkeitsprobleme, die den stufenlosen Zugang beeinträchtigen. Beispiele hierfür sind ein außer Betrieb befindlicher Aufzug oder bewegliche Rampen.
