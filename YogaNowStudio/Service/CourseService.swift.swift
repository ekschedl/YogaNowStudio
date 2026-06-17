//
//  CourseService.swift.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

//
//  CourseService.swift
//  YogaNowStudio
//
import Foundation
import Supabase

final class CourseService {

    private let client = SupabaseManager.client

    func loadCourses() async throws -> [SupabaseCourse] {

        let courses: [SupabaseCourse] = try await client
            .from("courses")
            .select()
            .order("start_at", ascending: true)
            .execute()
            .value

        return courses
    }

    func loadCourses(for trainerID: UUID) async throws -> [SupabaseCourse] {

        let courses: [SupabaseCourse] = try await client
            .from("courses")
            .select()
            .eq("trainer_id", value: trainerID)
            .order("start_at", ascending: true)
            .execute()
            .value

        return courses
    }
}
