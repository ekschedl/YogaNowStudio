//
//  FilterButton.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.

import SwiftUI

struct FilterButton: View {

    let title: String

    var body: some View {

        Text(title)
            .font(.caption)
            .foregroundColor(.yogaGreen)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.white.opacity(0.92))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 3)
    }
}
