//
//  AsanaDetailView.swift
//  YogaNowStudio
//
import SwiftUI

struct AsanaDetailView: View {
    let asana: Asana
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Bild
                Image(asana.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 210)
                    .clipped()
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10)

                // Titel
                VStack(spacing: 4) {
                    Text(asana.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yogaGreen)
                        .multilineTextAlignment(.center)

                    Text(asana.sanskrit)
                        .font(.subheadline)
                        .italic()
                        .foregroundColor(.yogaGold)
                }

                // Beschreibung
                Text(asana.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                Divider()

                // Anleitung
                VStack(alignment: .leading, spacing: 10) {
                    Text("Schritt für Schritt")
                        .font(.headline)
                        .foregroundColor(.yogaGreen)

                    ForEach(Array(asana.steps.enumerated()), id: \.offset) { index, step in
                        HStack(alignment: .top, spacing: 12) {
                            Text("\(index + 1)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .background(Color.yogaGreen)
                                .clipShape(Circle())

                            Text(step)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white.opacity(0.85))
                .cornerRadius(16)

                // Vorteile
                VStack(alignment: .leading, spacing: 10) {
                    Text("Vorteile")
                        .font(.headline)
                        .foregroundColor(.yogaGreen)

                    ForEach(asana.benefits, id: \.self) { benefit in
                        HStack(spacing: 10) {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.yogaGold)
                                .font(.caption)
                            Text(benefit)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white.opacity(0.85))
                .cornerRadius(16)
                .padding(.bottom, 30)
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
        .background {
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
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

#Preview {
    NavigationStack {
        AsanaDetailView(asana: mockAsanas[0])
    }
}
