//
//  SupabaseBookingService.swift
//  YogaNowStudio
//

import Foundation
import Supabase

final class SupabaseBookingService: BookingService {

    // MARK: - Client

    private let client = SupabaseManager.client

    // MARK: - Database Response

    private struct SupabaseBookingRow: Decodable {

        let id: UUID
        let courseID: UUID
        let createdAt: Date
        let course: SupabaseCourse

        enum CodingKeys: String, CodingKey {
            case id
            case courseID = "course_id"
            case createdAt = "created_at"
            case course = "courses"
        }
        
    }
    func fetchParticipants(
        for courseID: UUID
    ) async throws -> [CourseParticipant] {

        let participants: [CourseParticipant] = try await client
            .rpc(
                "get_course_participants",
                params: [
                    "p_course_id": courseID.uuidString
                ]
            )
            .execute()
            .value

        return participants
    }
    
    //MARK: - Fetch Bookings

    func fetchBookings() async throws -> [Booking] {

        let rows: [SupabaseBookingRow] = try await client
            .from("bookings")
            .select(
                """
                id,
                course_id,
                created_at,
                courses (
                    id,
                    trainer_id,
                    title,
                    description,
                    start_at,
                    duration_minutes,
                    room,
                    level,
                    max_participants,
                    image_name,
                    created_at
                )
                """
            )
            .order(
                "created_at",
                ascending: false
            )
            .execute()
            .value

        return rows.map { row in

            let databaseCourse = row.course

            let endDate = Calendar.current.date(
                byAdding: .minute,
                value: databaseCourse.durationMinutes,
                to: databaseCourse.startAt
            ) ?? databaseCourse.startAt

            let startTime = databaseCourse.startAt.formatted(
                .dateTime
                    .hour()
                    .minute()
                    .locale(
                        Locale(identifier: "de_DE")
                    )
            )

            let endTime = endDate.formatted(
                .dateTime
                    .hour()
                    .minute()
                    .locale(
                        Locale(identifier: "de_DE")
                    )
            )

            let day = databaseCourse.startAt.formatted(
                .dateTime
                    .weekday(.wide)
                    .locale(
                        Locale(identifier: "de_DE")
                    )
            )

            let course = Course(
                title: databaseCourse.title,
                day: day,
                date: databaseCourse.startAt,
                time: "\(startTime) - \(endTime)",
                room: databaseCourse.room ?? "Raum 1",
                participants: 0,
                imageName:
                    databaseCourse.imageName
                    ?? "ImageCourse01"
            )

            return Booking(
                id: row.id,
                courseID: row.courseID,
                course: course,
                bookingDate: row.createdAt
            )
        }
    }

    // MARK: - Book Course

    func bookCourse(
        courseID: UUID
    ) async throws -> BookCourseResult {

        let result: BookCourseResult = try await client
            .rpc(
                "book_course",
                params: [
                    "p_course_id": courseID.uuidString
                ]
            )
            .execute()
            .value

        return result
    }

    // MARK: - Cancel Booking
    func cancelBooking(
        bookingID: UUID
    ) async throws -> CancelBookingResult {

        let result: CancelBookingResult = try await client
            .rpc(
                "cancel_booking",
                params: [
                    "p_booking_id": bookingID.uuidString
                ]
            )
            .execute()
            .value

        return result
    }
}

// MARK: - Booking Service Error

enum BookingServiceError: LocalizedError {

    case cancelNotImplemented

    var errorDescription: String? {

        switch self {

        case .cancelNotImplemented:
            return "Die Stornierung ist noch nicht mit Supabase verbunden."
        }
    }
}
