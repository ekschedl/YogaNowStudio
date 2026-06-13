//
//  MockAsanas.swift
//  YogaNowStudio
//
import Foundation

let mockAsanas: [Asana] = [
    Asana(
        id: UUID(uuidString: "A0000000-0000-0000-0000-000000000001")!,
        name: "Herabschauender Hund",
        sanskrit: "Adho Mukha Svanasana",
        description: "Eine der bekanntesten Yoga-Posen überhaupt. Sie dehnt den gesamten Körper, stärkt Arme und Beine und beruhigt gleichzeitig den Geist.",
        steps: [
            "Beginne im Vierfüßlerstand",
            "Hebe die Hüften nach oben und hinten",
            "Strecke die Beine, Fersen in Richtung Boden",
            "Lass den Kopf locker zwischen den Armen hängen",
            "Halte 5–10 Atemzüge"
        ],
        benefits: ["Dehnt Rücken und Oberschenkel", "Stärkt Arme und Schultern", "Fördert die Durchblutung"],
        imageName: "BackgroundYoga2"
    ),
    Asana(
        id: UUID(uuidString: "A0000000-0000-0000-0000-000000000002")!,
        name: "Krieger",
        sanskrit: "Virabhadrasana",
        description: "Die Krieger-Pose verleiht Stärke und Entschlossenheit. Sie öffnet Hüfte und Brust und kräftigt die gesamte Beinmuskulatur.",
        steps: [
            "Tritt einen großen Schritt nach vorne",
            "Beuge das vordere Knie auf 90°",
            "Strecke die Arme kraftvoll nach oben",
            "Drehe die Hüften nach vorne",
            "Halte 5 Atemzüge pro Seite"
        ],
        benefits: ["Stärkt Beine und Rumpf", "Öffnet Hüfte und Brust", "Verbessert Balance und Fokus"],
        imageName: "ImageCourse01"
    ),
    Asana(
        id: UUID(uuidString: "A0000000-0000-0000-0000-000000000003")!,
        name: "Baum",
        sanskrit: "Vrksasana",
        description: "Die Baumpose ist die klassische Gleichgewichtsübung im Yoga. Sie fördert Fokus, Stabilität und innere Ruhe.",
        steps: [
            "Steh aufrecht auf einem Bein",
            "Platziere den Fuß an Wade oder Oberschenkel",
            "Führe die Hände vor der Brust oder nach oben",
            "Fixiere den Blick auf einen ruhigen Punkt",
            "Halte 5–8 Atemzüge pro Seite"
        ],
        benefits: ["Verbessert Gleichgewicht und Stabilität", "Stärkt Bein- und Fußmuskeln", "Schult Konzentration"],
        imageName: "ImageCourse02"
    ),
    Asana(
        id: UUID(uuidString: "A0000000-0000-0000-0000-000000000004")!,
        name: "Kobra",
        sanskrit: "Bhujangasana",
        description: "Die Kobra öffnet sanft Brust und Schultern und stärkt die gesamte Rückenmuskulatur. Ideal als Ausgleich für sitzende Tätigkeiten.",
        steps: [
            "Leg dich auf den Bauch",
            "Platziere die Hände neben den Schultern",
            "Hebe den Oberkörper langsam an",
            "Schultern bewusst von den Ohren wegziehen",
            "Halte 3–5 Atemzüge"
        ],
        benefits: ["Stärkt die Rückenmuskulatur", "Öffnet Brust und Schultern", "Verbessert die Körperhaltung"],
        imageName: "BackgroundYoga3"
    ),
    Asana(
        id: UUID(uuidString: "A0000000-0000-0000-0000-000000000005")!,
        name: "Sonnengruß",
        sanskrit: "Surya Namaskar",
        description: "Der Sonnengruß ist eine kraftvolle Abfolge von Posen, die den ganzen Körper aufwärmt, dehnt und stärkt. Perfekt als Einstieg in jede Praxis.",
        steps: [
            "Beginne in Berghaltung (Tadasana)",
            "Strecke die Arme nach oben (Urdhva Hastasana)",
            "Vorwärtsbeuge (Uttanasana)",
            "Hohe Plank → Chaturanga",
            "Kobra oder Aufrechter Hund",
            "Herabschauender Hund"
        ],
        benefits: ["Aktiviert den gesamten Körper", "Synchronisiert Atem und Bewegung", "Baut Wärme und Energie auf"],
        imageName: "ImageCourse03"
    ),
    Asana(
        id: UUID(uuidString: "A0000000-0000-0000-0000-000000000006")!,
        name: "Haltung des Kindes",
        sanskrit: "Balasana",
        description: "Die Kindeshaltung ist eine sanfte Ruhepause zwischen anspruchsvollen Posen. Sie beruhigt Geist und Nervensystem und dehnt behutsam Rücken und Hüften.",
        steps: [
            "Knie auf der Matte, Zehen berühren sich",
            "Senke die Hüften zu den Fersen",
            "Strecke die Arme nach vorne oder lass sie neben dem Körper ruhen",
            "Stirn berührt sanft die Matte",
            "Atme tief durch den Rücken"
        ],
        benefits: ["Entspannt Rücken und Geist", "Dehnt Hüften und Oberschenkel", "Beruhigt das Nervensystem"],
        imageName: "BackgroundYoga"
    )
]
