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
        title: "Frühling Gallenblasenmeridian",
        subtitle: "Energie fließen lassen & den Frühling willkommen heißen",
        level: "Anfänger",
        duration: "30 Min",
        imageName: "Video3",
        youtubeID: "YBvo6dnc2Xo",
        highlights: [
            "Aktivierung des Gallenblasenmeridians für Entscheidungskraft & Leichtigkeit",
            "Seitliche Dehnungen zur Förderung des Energieflusses",
            "Frühlingserwachen für Körper, Geist und Meridiane"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000010")!,
        title: "Sanfte Dehnung",
        subtitle: "Sanfte Bewegungen für Einsteiger.",
        level: "Anfänger",
        duration: "20 Min",
        imageName: "Video1",
        youtubeID: "g_tea8ZNk5A"
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000011")!,
        title: "Erdelement zum Übergang Winter",
        subtitle: "Verwurzelung & innere Wärme für den Jahreszeitenwechsel",
        level: "Anfänger",
        duration: "15 Min",
        imageName: "Video2",
        youtubeID: "yxtXSkvjEUA",
        youtubeEnd: 285,
        highlights: [
            "Erdende Posen für Stabilität und Verwurzelung",
            "Atemübungen zur Aktivierung der inneren Wärme",
            "Sanfte Sequenz für den Übergang in die Winterzeit"
        ]
    ),
    Video(
        id: UUID(uuidString: "00000000-0000-0000-0000-000000000012")!,
        title: "Grundlagen Flow",
        subtitle: "Die wichtigsten Posen für den Start.",
        level: "Anfänger",
        duration: "25 Min",
        imageName: "Video3",
        youtubeID: "34My7cLtg6Y"
    )
]
