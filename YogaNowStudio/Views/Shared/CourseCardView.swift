import SwiftUI

struct CourseCardView: View {

    let imageName: String
    let title: String
    let time: String
    let participants: Int

    var body: some View {

        HStack(spacing: 12) {

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 90)
                .clipped()
                .cornerRadius(15)

            VStack(
                alignment: .leading,
                spacing: 10
            ) {

                Text(title)
                    .font(.headline)
                    .foregroundColor(.yogaGreen)

                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 6) {

                    Image(systemName: "person.2.fill")

                    Text("x \(participants)")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.yogaGold)
        }
        .padding(12)
        .background(Color.white.opacity(0.85))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    Color.yogaGold.opacity(0.15),
                    lineWidth: 1
                )
        )
        .cornerRadius(20)
    }
}

#Preview {
    CourseCardView(
        imageName: "ImageCourse01",
        title: "Morning Flow",
        time: "08:30 Uhr",
        participants: 12
    )
}
