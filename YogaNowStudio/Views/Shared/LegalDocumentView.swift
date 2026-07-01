//
//  LegalDocumentView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.07.26.
//

import SwiftUI

struct LegalDocumentView: View {

    let document: LegalDocument

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(
                    alignment: .leading,
                    spacing: 24
                ) {

                    headerSection

                    Text(document.content)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(5)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(24)
                        .background(
                            Color.white.opacity(0.82)
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 28
                            )
                        )

                    Spacer()
                        .frame(height: 60)
                }
                .padding(.horizontal, 22)
                .padding(.top, 50)
            }
        }
        .navigationTitle(document.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var headerSection: some View {

        VStack(spacing: 12) {

            Image(systemName: document.icon)
                .font(.system(size: 35))
                .foregroundColor(.yogaGold)

            Text(document.title)
                .font(
                    .system(
                        size: 30,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}
