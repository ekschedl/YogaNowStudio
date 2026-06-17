//
//  CourseStore.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

//CourseStore, der die Kurse aus CourseService lädt und für die Views bereitstellt.
//  CourseStore.swift
//  YogaNowStudio
//

import Foundation
import Combine

@MainActor
final class CourseStore: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var courses: [SupabaseCourse] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    // MARK: - Properties

    private let courseService: CourseService

    // MARK: - Initialization

    init(courseService: CourseService) {
        self.courseService = courseService
    }

    init() {
        self.courseService = CourseService()
    }

    // MARK: - Load Courses

    func loadCourses() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            courses = try await courseService.loadCourses()

        } catch {
            courses = []
            errorMessage = "Die Kurse konnten nicht geladen werden."

            print("Fehler beim Laden der Kurse: \(error)")
        }
    }
    
    func loadCourses(for trainerID: UUID) async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {
            courses = try await courseService.loadCourses(
                for: trainerID
            )

        } catch {
            courses = []
            errorMessage = "Die Kurse konnten nicht geladen werden."

            print("Fehler beim Laden der Trainer-Kurse: \(error)")
        }
    }
}
