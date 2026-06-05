//
//  TrainerWelcomeView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//

import SwiftUI

struct TrainerWelcomeView: View {
    
    var body: some View {
        
        ZStack {
            
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 25) {
                    
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 70))
                        .foregroundColor(.yogaGreen)
                    
                    Text("Willkommen zurück!")
                        .font(
                            .system(
                                size: 32,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)
                    
                    Text("""
                    Du hast dich erfolgreich als
                    Trainer eingeloggt.
                    """)
                    .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        
                        TrainerCalendarView()
                        
                    } label: {
                        
                        Text("Zu meinen Kursen")
                        
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                            .frame(maxWidth: .infinity)
                        
                            .padding(.vertical, 16)
                        
                            .background(Color.yogaGreen)
                        
                            .cornerRadius(14)
                        
                    }
                }
                .padding(35)
                .background(
                    Color(
                        red: 252/255,
                        green: 250/255,
                        blue: 246/255
                    )
                )
                .cornerRadius(30)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    
    NavigationStack {
        TrainerWelcomeView()
        
    }
    
}
