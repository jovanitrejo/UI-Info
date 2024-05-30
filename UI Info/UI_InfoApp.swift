//
//  UI_InfoApp.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

@main
struct UI_InfoApp: App {
    @AppStorage("selectedCampus") var selectedCampus: String = "none"
    
    var body: some Scene {
        WindowGroup {
            ContentViewWrapper()
        }
    }
}
