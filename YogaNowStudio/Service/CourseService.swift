//
//  CourseService.swift
//  YogaNowStudio
//

import Foundation
import Supabase

final class CourseService {

    // MARK: - Client

    private let client = SupabaseManager.client

    // MARK: - Course Selection

    private let courseSelection = """
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
        created_at,
        trainer_profile:profiles!courses_trainer_id_fkey (
            id,
            display_name
        )
        """

    // MARK: - Load All Courses

    func loadCourses() async throws -> [SupabaseCourse] {

        var courses: [SupabaseCourse] = try await client
            .from("courses")
            .select(courseSelection)
            .order(
                "start_at",
                ascending: true
            )
            .execute()
            .value

        let participantCounts =
            try await loadParticipantCounts()

        applyParticipantCounts(
            participantCounts,
            to: &courses
        )

        return courses
    }

    // MARK: - Load Trainer Courses

    func loadCourses(
        for trainerID: UUID
    ) async throws -> [SupabaseCourse] {

        var courses: [SupabaseCourse] = try await client
            .from("courses")
            .select(courseSelection)
            .eq(
                "trainer_id",
                value: trainerID
            )
            .order(
                "start_at",
                ascending: true
            )
            .execute()
            .value

        let participantCounts =
            try await loadParticipantCounts()

        applyParticipantCounts(
            participantCounts,
            to: &courses
        )

        return courses
    }

    // MARK: - Load Participant Counts

    private func loadParticipantCounts()
        async throws -> [CourseParticipantCount] {

        let counts: [CourseParticipantCount] =
            try await client
                .rpc(
                    "get_course_participant_counts"
                )
                .execute()
                .value

        return counts
    }

    // MARK: - Apply Participant Counts

    private func applyParticipantCounts(
        _ counts: [CourseParticipantCount],
        to courses: inout [SupabaseCourse]
    ) {

        let countByCourseID =
            Dictionary(
                uniqueKeysWithValues:
                    counts.map {
                        (
                            $0.courseID,
                            $0.participantCount
                        )
                    }
            )

        for index in courses.indices {

            courses[index].participantCount =
                countByCourseID[
                    courses[index].id
                ] ?? 0
        }
    }
}
