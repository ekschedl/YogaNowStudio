//
//  TrainerLoginView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//
import SwiftUI

struct TrainerLoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        
        ZStack {
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320)
                    .offset(y: -35)
                
                VStack(alignment: .leading, spacing: 22) {
                    
                    VStack(spacing: 10) {
                        
                        Text("Trainer Login")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)
                        
                        Rectangle()
                            .fill(Color.yogaGold.opacity(0.25))
                            .frame(width: 80, height: 1)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("E-Mail-Adresse")
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(.yogaGreen)
                        
                        HStack {
                            
                            Image(systemName: "envelope")
                                .foregroundColor(.gray.opacity(0.7))
                            
                            TextField(
                                "E-Mail-Adresse",
                                text: $email
                            )
                        }
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.yogaGold.opacity(0.15))
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Passwort")
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(.yogaGreen)
                        
                        HStack {
                            
                            Image(systemName: "lock")
                                .foregroundColor(.gray.opacity(0.7))
                            
                            if showPassword {
                                TextField(
                                    "Passwort",
                                    text: $password
                                )
                            } else {
                                SecureField(
                                    "Passwort",
                                    text: $password
                                )
                            }
                            
                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(
                                    systemName:
                                        showPassword
                                    ? "eye.slash"
                                    : "eye"
                                )
                                .foregroundColor(.gray.opacity(0.7))
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.yogaGold.opacity(0.15))
                        )
                    }
                    
                    Button("Passwort vergessen?") {
                        
                    }
                    .font(.footnote)
                    .foregroundColor(.yogaGreen)
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        
                    } label: {
                        
                        Text("Anmelden")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.yogaGreen)
                            .cornerRadius(14)
                    }
                    
                    Text("Noch keinen Zugang? Bitte im Studio melden.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
                .padding(35)
                .background(
                    Color(
                        red: 252/255,
                        green: 250/255,
                        blue: 246/255
                    )
                )
                .frame(maxWidth: .infinity)
                .frame(height: 480)
                .cornerRadius(30)
                .shadow(
                    color: .black.opacity(0.05),
                    radius: 15,
                    y: 5
                )
                .padding(.horizontal)
                .offset(y: -25)
            }
        }
    }
}

#Preview {
    TrainerLoginView()
}
