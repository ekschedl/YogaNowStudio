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
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
         .frame(height: 70)
        .background(.ultraThinMaterial)
    }
    
}

#Preview {
    FooterView()
}
