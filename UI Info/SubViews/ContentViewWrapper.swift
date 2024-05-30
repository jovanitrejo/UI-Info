//
//  ContentViewWrapper.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI
import MapKit

struct ContentViewWrapper: View {
    @AppStorage("selectedCampus") var selectedCampus: String = "none"
    @State private var showContent: Bool = false

    var body: some View {
        ZStack {
            if showContent {
                ContentView(selectedCampus: selectedCampus, region: MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 39.5, longitude: -89.5),
                    span: MKCoordinateSpan(latitudeDelta: 6.0, longitudeDelta: 4.0)
                ))
                //ContentView(selectedCampus: selectedCampus)
                    .transition(.move(edge: .trailing))
            } else {
                WelcomeScreen()
            }
        }
        .onAppear {
            if selectedCampus != "none" {
                showContent = true // Directly set to true without animation if a campus is already selected
            } else {
                withAnimation(.easeInOut(duration: 0.4)) {
                    showContent = selectedCampus != "none"
                }
            }
        }
        .onChange(of: selectedCampus) {
            withAnimation(.snappy(duration: 0.3)) {
                showContent.toggle() // Toggle the view based on selectedCampus
            }
        }
    }
}

#Preview {
    ContentViewWrapper()
}
