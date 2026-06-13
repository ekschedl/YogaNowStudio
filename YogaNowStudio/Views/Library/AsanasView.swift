//
//  AsanasView.swift
//  YogaNowStudio
//
import SwiftUI

struct AsanasView: View {
    @Environment(\.dismiss) private var dismiss

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        ZStack {
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)

                Text("ASANAS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yogaGreen)
                    .tracking(4)

                Text("Master the Basics")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.yogaGold)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(mockAsanas) { asana in
                            NavigationLink {
                                AsanaDetailView(asana: asana)
                            } label: {
                                AsanaCard(asana: asana)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.top, 8)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Zurück")
                    }
                    .foregroundColor(.yogaGreen)
                }
            }
        }
    }
}

// MARK: - AsanaCard

private struct AsanaCard: View {
    let asana: Asana

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(asana.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .clipped()

            VStack(alignment: .leading, spacing: 4) {
                Text(asana.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.yogaGreen)
                    .lineLimit(1)

                Text(asana.sanskrit)
                    .font(.caption2)
                    .italic()
                    .foregroundColor(.yogaGold)
                    .lineLimit(1)
            }
            .padding(10)
        }
        .background(Color.white.opacity(0.95))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.07), radius: 5)
        .contentShape(Rectangle())
    }
}

#Preview {
    NavigationStack {
        AsanasView()
    }
    .environment(FavoritesStore())
}
