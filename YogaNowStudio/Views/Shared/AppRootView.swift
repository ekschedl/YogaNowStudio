//
//  AppRootView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.
//

import SwiftUI

struct AppRootView: View {

    @EnvironmentObject private var sessionStore: SessionStore

    var body: some View {

        Group {

            if sessionStore.isLoading {

                ProgressView()

            } else {

                switch sessionStore.userRole {

                case .trainer:
                    TrainerMainTabView()

                case .participant:
                    ParticipantMainTabView()

                case nil:
                    WelcomeView()
                }
            }
        }
        .task {
            await sessionStore.restoreSession()
        }
    }
}
