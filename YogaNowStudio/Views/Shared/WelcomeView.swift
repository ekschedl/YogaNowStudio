//
//  ContentView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationStack{
            ZStack {
            
                Image("BackgroundYoga")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        HStack(spacing: 6) {
                            Image(systemName: "globe")
                            Text("DE")
                        }
                        .foregroundColor(.yogaGreen)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 12)
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    }
                    .padding()
                    
                    Spacer()
                    
                    Image("LogoYogaNow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340)
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink {
                            YogaLibraryView()
                        } label: {
                            NavigationCard(
                                title: "Yoga Library",
                                iconName: "IconLibrary"
                            )
                        }
                        NavigationLink {
                            LoginView()
                        } label: {
                            NavigationCard(
                                title: "YogaNow Plattform",
                                iconName: "IconCourse"
                            )
                        }
                    }
                    .padding(30)
             
                    
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

#Preview {

    WelcomeView()
        .environment(FavoritesStore())
        .environmentObject(BookingStore())
        .environmentObject(SessionStore())
}


