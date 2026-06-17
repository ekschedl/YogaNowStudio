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

    // MARK: - Properties

    private let client = SupabaseManager.client

    // MARK: - Load Courses

    func loadCourses() async throws -> [SupabaseCourse] {

        let courses: [SupabaseCourse] = try await client
            .from("courses")
            .select()
            .order("start_at", ascending: true)
            .execute()
            .value

        return courses
    }
}
