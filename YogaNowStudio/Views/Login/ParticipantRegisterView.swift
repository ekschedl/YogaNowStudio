//
//  ParticipantRegisterView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//
// wird später gemacht
import SwiftUI

struct ParticipantRegisterView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Text("Teilnehmer Registierung")
                .font(.largeTitle)
                .foregroundColor(.yogaGreen)
        }
    }
}

#Preview {
    ParticipantRegisterView()
}
