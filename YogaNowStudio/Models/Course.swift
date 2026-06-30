import Foundation

struct Course: Identifiable, Equatable {

    let id: UUID
    let title: String
    let day: String
    let date: Date
    let time: String
    let room: String
    let participants: Int
    let maxParticipants: Int
    let imageName: String


    init(
        id: UUID = UUID(),
        title: String,
        day: String,
        date: Date = Date(),
        time: String,
        room: String,
        participants: Int,
        maxParticipants: Int,
        imageName: String
     
    ) {
        self.id = id
        self.title = title
        self.day = day
        self.date = date
        self.time = time
        self.room = room
        self.participants = participants
        self.maxParticipants = maxParticipants
        self.imageName = imageName
        
    }
}
