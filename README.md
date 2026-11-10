# YogaNow Studio

YogaNow Studio ist eine native iOS-App, die eine frei zugängliche Yoga-Bibliothek mit einer Buchungsplattform für Studiokurse verbindet. Die App entstand als Gruppenprojekt im Modul Mobile Solutions an der FH CAMPUS 02.

## Funktionen

- **Yoga Library:** Yoga-Übungen und Videos für verschiedene Schwierigkeitsstufen entdecken.
- **Kursbuchung:** Kursdetails und verfügbare Plätze ansehen, eine Buchung bestätigen und eigene Buchungen einsehen.
- **Kursverwaltung:** Eigener Bereich für Trainerinnen und Trainer.

## Mein Beitrag

Ich war im Team für das Design der App, die Datenbankanbindung mit Supabase und die Umsetzung der Kursbuchungsplattform zuständig.

## Technologien

**Swift · SwiftUI · Supabase · Swift Package Manager**

SwiftUI bildet die Benutzeroberfläche. Die Kursplattform nutzt Supabase für Anmeldung und Datenzugriff. Xcode lädt das Supabase-SDK über den Swift Package Manager.

## Lokal starten

1. Klone das Repository oder lade es über **Code → Download ZIP** herunter und entpacke es.
2. Öffne `YogaNowStudio.xcodeproj` in Xcode. Verwende eine Xcode-Version mit iOS-26-SDK und installierter iOS-26-Simulatorlaufzeit.
3. Wähle das Schema **YogaNowStudio** und einen iPhone-Simulator mit iOS 26 oder neuer.
4. Warte, bis Xcode die Swift-Pakete aufgelöst hat, und starte die App mit **⌘R**.

Die **Yoga Library** ist ohne Anmeldung zugänglich. Für die **YogaNow Plattform** brauchst du eine erreichbare Supabase-Instanz mit dem passenden Projektschema und einem Testkonto. 
