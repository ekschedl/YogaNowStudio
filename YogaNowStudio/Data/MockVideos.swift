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
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
        title: "Deep Backend Flow",
        subtitle: "Öffne dein Herz und stärke deine Flexibilität.",
        level: "Profi",
        duration: "60 Min",
        imageName: "Video1"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!,
        title: "Advanced Pranayama",
        subtitle: "Fortgeschrittene Atemtechniken und Bandhas.",
        level: "Profi",
        duration: "55 Min",
        imageName: "Video3"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000003")!,
        title: "Full Body Ashtanga",
        subtitle: "Komplette Ashtanga-Primärsequenz.",
        level: "Profi",
        duration: "75 Min",
        imageName: "Video2"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000004")!,
        title: "Power Yoga Cardio Intensity",
        subtitle: "Sweat and Reset",
        level: "Profi",
        duration: "65 Min",
        imageName: "Video1",
        youtubeID: "WHvNfa5aNb8",
        highlights: [
            "Intensive Cardio-Sequenzen für maximalen Kalorienverbrauch",
            "Kraftaufbau durch dynamische Vinyasa-Abfolgen",
            "Cool-Down & Reset für Körper und Geist"
        ]
    ),

    // Fortgeschritten
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000005")!,
        title: "Arm Balance Workshop",
        subtitle: "Stärke deinen Fokus und deine Kraft.",
        level: "Fortgeschritten",
        duration: "45 Min",
        imageName: "Video2"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000006")!,
        title: "Power Vinyasa",
        subtitle: "Dynamische Abfolgen für mehr Ausdauer.",
        level: "Fortgeschritten",
        duration: "50 Min",
        imageName: "Video1"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000007")!,
        title: "Hip Opener Deep",
        subtitle: "Intensive Hüftöffnung und Flexibilität.",
        level: "Fortgeschritten",
        duration: "40 Min",
        imageName: "Video3"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000008")!,
        title: "Yoga Detox Flow",
        subtitle: "Stoffwechsel & Verdauung anregen, Entgiften und Stress abbauen.",
        level: "Fortgeschritten",
        duration: "35 Min",
        imageName: "Video2",
        youtubeID: "hpCXz7taG2s",
        highlights: [
            "Twists zur Anregung von Stoffwechsel & Verdauung",
            "Gezielte Atemübungen zum Entgiften",
            "Stressabbau durch bewusste Entspannung"
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
