//
//  ContentView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct ContentView: View {
    
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
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(.white.opacity(0.85))
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
                        
                        NavigationCard(
                            title: "Kurse buchen",
                            iconName: "IconCourse"
                        )
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


