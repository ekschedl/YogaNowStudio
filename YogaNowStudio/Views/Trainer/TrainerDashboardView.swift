import SwiftUI

struct TrainerDashboardView: View {

    // MARK: - Environment
    @EnvironmentObject private var courseStore: CourseStore
    @EnvironmentObject private var sessionStore: SessionStore

    // MARK: - User Information
    private var courseCountText: String {
        courseStore.courses.count == 1
            ? "1 Kurs"
            : "\(courseStore.courses.count) Kurse"
    }
    
    private var userName: String {
        sessionStore.profile?.displayName ?? "Trainerin"
    }
    
    private func startTime(for course: SupabaseCourse) -> String {
        course.startAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(Locale(identifier: "de_DE"))
        )
    }

    private func timeRange(for course: SupabaseCourse) -> String {
        let endDate = Calendar.current.date(
            byAdding: .minute,
            value: course.durationMinutes,
            to: course.startAt
        ) ?? course.startAt

        let start = course.startAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(Locale(identifier: "de_DE"))
        )

        let end = endDate.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(Locale(identifier: "de_DE"))
        )

        return "\(start) - \(end)"
    }

    // MARK: - Body

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack {

                    // MARK: - Header

                    VStack(spacing: 4) {

                        Text("Namasté")
                            .font(.subheadline)
                            .foregroundColor(.yogaGreen)

                        Text(userName)
                            .font(
                                .system(
                                    size: 36,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .tracking(2)
                            .foregroundColor(.yogaGold)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .minimumScaleFactor(0.7)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 80)

                    // MARK: - Course Plan

                    VStack(spacing: 10) {

                        VStack(
                            alignment: .leading,
                            spacing: 8
                        ) {

                            HStack(alignment: .center) {

                                Text("HEUTE")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yogaGold)
                                    .tracking(4)

                                Spacer()

                                Text(courseCountText)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }

                            Rectangle()
                                .fill(Color.yogaGold.opacity(0.3))
                                .frame(width: 70, height: 1)

                            Text("Dein Kursplan")
                                .font(
                                    .system(
                                        size: 28,
                                        weight: .medium,
                                        design: .serif
                                    )
                                )
                                .tracking(0.5)
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(.horizontal)
                        .padding(.top, 20)

                        if courseStore.isLoading {

                            ProgressView("Kurse werden geladen …")
                                .padding()

                        } else if let errorMessage = courseStore.errorMessage {

                            Text(errorMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)

                        } else {

                            ForEach(courseStore.courses) { course in

                                NavigationLink {

                                    CourseDetailView(
                                        role: .trainer,
                                        imageName: course.imageName ?? "ImageCourse01",
                                        title: course.title,
                                        time: timeRange(for: course),
                                        duration: "\(course.durationMinutes) Min.",
                                        level: course.level ?? "Alle Levels",
                                        trainer: userName,
                                        description:
                                            course.description
                                            ?? "Keine Beschreibung hinterlegt.",
                                        participants: 0,
                                        maxParticipants: course.maxParticipants,
                                        isBooked: true
                                    )

                                } label: {

                                    CourseCardView(
                                        imageName: course.imageName ?? "ImageCourse01",
                                        title: course.title,
                                        time: "\(startTime(for: course)) Uhr",
                                        participants: 0
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    
                    }
                    .padding(24)

                    Spacer()
                        .frame(height: 100)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await courseStore.loadCourses()
        }
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {
        TrainerDashboardView()
    }
    .environmentObject(SessionStore())
    .environmentObject(CourseStore())
    .environment(FavoritesStore())

}
