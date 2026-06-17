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

    // MARK: - Course Formatting

    private func startTime(
        for course: SupabaseCourse
    ) -> String {

        course.startAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(
                    Locale(identifier: "de_DE")
                )
        )
    }

    private func timeRange(
        for course: SupabaseCourse
    ) -> String {

        let endDate = Calendar.current.date(
            byAdding: .minute,
            value: course.durationMinutes,
            to: course.startAt
        ) ?? course.startAt

        let start = course.startAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(
                    Locale(identifier: "de_DE")
                )
        )

        let end = endDate.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(
                    Locale(identifier: "de_DE")
                )
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

                    headerSection

                    coursePlanSection

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

    // MARK: - Header Section

    private var headerSection: some View {

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
    }

    // MARK: - Course Plan Section

    private var coursePlanSection: some View {

        VStack(spacing: 10) {

            coursePlanHeader

            courseContent
        }
        .padding(24)
    }

    // MARK: - Course Plan Header

    private var coursePlanHeader: some View {

        VStack(spacing: 30) {

            VStack(spacing: 6) {

                Text("HEUTE")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.yogaGold)
                    .tracking(4)

                Rectangle()
                    .fill(Color.yogaGold.opacity(0.45))
                    .frame(width: 65, height: 1)

                Text(courseCountText)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text("Dein Kursplan")
                .font(
                    .system(
                        size: 28,
                        weight: .medium,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)
               
        }
        .frame(maxWidth: .infinity)
        .padding(.top, -10)
    }

    // MARK: - Course Content

    @ViewBuilder
    private var courseContent: some View {

        if courseStore.isLoading {

            ProgressView("Kurse werden geladen …")
                .padding()

        } else if let errorMessage = courseStore.errorMessage {

            Text(errorMessage)
                .font(.caption)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)

        } else if courseStore.courses.isEmpty {

            Text("Für heute sind keine Kurse eingetragen.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 16)

        } else {

            ForEach(courseStore.courses) { course in

                NavigationLink {

                    CourseDetailView(
                        role: .trainer,
                        imageName:
                            course.imageName
                            ?? "ImageCourse01",
                        title: course.title,
                        time: timeRange(for: course),
                        duration:
                            "\(course.durationMinutes) Min.",
                        level:
                            course.level
                            ?? "Alle Levels",
                        trainer: userName,
                        description:
                            course.description
                            ?? "Keine Beschreibung hinterlegt.",
                        participants: 0,
                        maxParticipants:
                            course.maxParticipants,
                        isBooked: true,
                        courseDate: course.startAt
                    )

                } label: {

                    CourseCardView(
                        imageName:
                            course.imageName
                            ?? "ImageCourse01",
                        title: course.title,
                        time:
                            "\(startTime(for: course)) Uhr",
                        participants: 0
                    )
                }
                .buttonStyle(.plain)
            }
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
