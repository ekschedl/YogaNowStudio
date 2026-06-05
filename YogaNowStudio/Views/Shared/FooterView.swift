import SwiftUI

struct FooterView: View {

    var body: some View {

        HStack {

            Spacer()

            VStack(spacing: 4) {
                Image(systemName: "house")
                Text("Heute")
                    .font(.caption)
            }

            Spacer()

            VStack(spacing: 4) {
                Image(systemName: "calendar")
                Text("Kalender")
                    .font(.caption)
            }

            Spacer()

            VStack(spacing: 4) {
                Image(systemName: "book")
                Text("Library")
                    .font(.caption)
            }

            Spacer()

            VStack(spacing: 4) {
                Image(systemName: "person")
                Text("Profil")
                    .font(.caption)
            }

            Spacer()
        }
        .foregroundColor(.yogaGreen)
        .padding(.top, 12)
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity)
        .background(Color.yogaCream)
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            y: -2
        )
    }
}

#Preview {
    FooterView()
}
