//
//  MockVideos.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//

import Foundation

let mockVideos = [

    // Profi
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!,
        title: "Deep Faszien Stretch",
        subtitle: "Tief loslassen – Faszienarbeit für den ganzen Körper",
        level: "Profi",
        duration: "55 Min",
        imageName: "Video3",
        localVideoName: "signal-2026-06-23-19-50-27-897_003",
        localVideoOverlay: "Faszien\nStretch",
        localVideoOverlayBottom: true,
        highlights: [
            "Intensive Faszienarbeit zur Lösung von Spannungen und Verklebungen",
            "Tiefes Dehnen für nachhaltig mehr Beweglichkeit und Körperwahrnehmung",
            "Verbindung von Atemführung und Faszienrelease für Körper und Geist"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000003")!,
        title: "Energizing Flow",
        subtitle: "Kraft, Schwung & Lebensenergie – ein Flow für Körper und Geist",
        level: "Profi",
        duration: "75 Min",
        imageName: "Video2",
        localVideoName: "signal-2026-06-23-19-50-27-897_002",
        localVideoOverlay: "Wake-Up Flow",
        localVideoOverlayBottom: true,
        highlights: [
            "Kraftvolle Sequenzen zur Aktivierung deiner Lebensenergie",
            "Dynamische Übergänge für Ausdauer, Fokus und innere Stärke",
            "Intensiver Flow für ein tiefes Gefühl von Vitalität und Freiheit"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000004")!,
        title: "Intense Warm Up",
        subtitle: "Feuer entfachen – intensive Aktivierung für Körper und Geist",
        level: "Profi",
        duration: "65 Min",
        imageName: "Video1",
        localVideoName: "signal-2026-06-23-19-50-27-897",
        localVideoOverlay: "Intense\nWarm Up",
        highlights: [
            "Intensive Aufwärmsequenzen zur gezielten Aktivierung aller Muskelgruppen",
            "Mentale Fokussierung für eine konzentrierte und bewusste Praxis",
            "Optimale Vorbereitung für eine kraftvolle Yoga-Praxis"
        ]
    ),

    // Fortgeschritten
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000006")!,
        title: "Frühlingspraxis",
        subtitle: "Erwachen & Aufblühen – eine Yoga-Praxis für den Frühling",
        level: "Fortgeschritten",
        duration: "50 Min",
        imageName: "Video1",
        localVideoName: "signal-2026-06-21-17-12-09-916",
        localVideoOverlay: "Frühlingspraxis",
        highlights: [
            "Öffnende Posen zur Aktivierung der Frühlingsenergie",
            "Dynamische Sequenzen für mehr Leichtigkeit und Kraft",
            "Verbindung mit der Natur durch bewusste Atemlenkung"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000007")!,
        title: "Strong Flow",
        subtitle: "Kraft trifft Fluss – intensive Praxis für Körper und Geist",
        level: "Fortgeschritten",
        duration: "40 Min",
        imageName: "Video3",
        localVideoName: "signal-2026-06-21-17-29-23-628",
        localVideoOverlay: "Strong Flow",
        highlights: [
            "Kraftvolle Standposen und Armbalancen für mehr Stärke",
            "Fließende Übergänge zur Steigerung von Ausdauer und Fokus",
            "Intensive Praxis für ein starkes Körpergefühl"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000008")!,
        title: "Feel the Flow",
        subtitle: "In Bewegung kommen & den eigenen Rhythmus spüren",
        level: "Fortgeschritten",
        duration: "35 Min",
        imageName: "Video2",
        localVideoName: "signal-2026-06-21-17-01-27-358",
        localVideoOverlay: "Flow, Baby!",
        highlights: [
            "Dynamische Vinyasa-Sequenzen zum Eintauchen in den Flow-Zustand",
            "Verbindung von Atem und Bewegung für mehr Leichtigkeit",
            "Stärke, Ausdauer und innere Freiheit in einer Praxis"
        ]
    ),

    // Anfänger
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000009")!,
        title: "Sanfte Dehnung",
        subtitle: "Weich und bewusst – Dehnen für Körper, Geist und Atemraum",
        level: "Anfänger",
        duration: "30 Min",
        imageName: "Video3",
        localVideoName: "signal-2026-06-21-12-54-10-551",
        localVideoOverlay: "WARM UP",
        highlights: [
            "Sanfte Dehnübungen für den gesamten Körper",
            "Bewusste Atemführung zur Vertiefung jeder Dehnung",
            "Ideal für Einsteiger und zur Entspannung nach einem langen Tag"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000010")!,
        title: "Atem-Erdung",
        subtitle: "Ankommen im Moment – Atemübungen zur tiefen Verwurzelung",
        level: "Anfänger",
        duration: "20 Min",
        imageName: "Video1",
        localVideoName: "signal-2026-06-21-12-08-54-893",
        localVideoOverlay: "Breathe in\nBreathe out",
        highlights: [
            "Bewusste Atemführung zur sofortigen Beruhigung des Nervensystems",
            "Erdende Techniken für mehr Stabilität und Präsenz im Alltag",
            "Sanfte Übungen zum Loslassen von Anspannung und Stress"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000011")!,
        title: "Sonnengruß Flow",
        subtitle: "Energie & Lebensfreude – der klassische Sonnengruß für jeden Tag",
        level: "Anfänger",
        duration: "15 Min",
        imageName: "Video2",
        localVideoName: "signal-2026-06-21-16-33-43-397",
        localVideoOverlay: "Grüß die Sonne",
        localVideoOverlayBottom: true,
        highlights: [
            "Schritt-für-Schritt Anleitung zum klassischen Sonnengruß",
            "Aktivierung des gesamten Körpers durch fließende Bewegung",
            "Ideal als tägliches Morgenritual für mehr Energie & Klarheit"
        ]
    ),
]
