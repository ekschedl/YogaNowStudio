//
//  ParticipantWelcomeView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//
// wird später gemacht

import SwiftUI

struct ParticipantWelcomeView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Text("Teilnehmerbereich")
                .font(.largeTitle)
                .foregroundColor(.yogaGreen)
        }
    }
}

#Preview {
    ParticipantWelcomeView()
}
