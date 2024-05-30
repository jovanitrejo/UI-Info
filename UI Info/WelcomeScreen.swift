//
//  WelcomeScreen.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct WelcomeScreen: View {
    
    let campusImages: [String] = ["uiclogo", "illinoislogo", "uislogo"]
    let campusNames: [String] = ["University of Illinois Chicago", "University of Illinois Urbana-\nChampaign", "University of Illinois Springfield"]
    let campusAcronyms: [String] = ["uic", "illinois", "uis"]
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to UI Info!")
                    .font(.title)
                Text("Please select a campus below")
                    .font(.subheadline)
            }
            Spacer()
            ForEach(0..<3) { index in
                Button(action: {
                    updateSelectedCampus(to: campusAcronyms[index])
                    print("Updated campus to \(campusAcronyms[index])")
                }, label: {
                    WelcomeScreenButtonView(imageString: campusImages[index], campusName: campusNames[index])
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.bottom)
            Spacer()
        }
    }
}

#Preview {
    WelcomeScreen()
}
