//
//  CampusDataStructure.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import Foundation

class Campus: Codable {
    let campusName: String
    let logoName: String
    let latitude: Double
    let longitude: Double
    let delta: Double
    let pointsOfInterest: [CampusCategory]
    let info: [Section]
    
    init(campusName: String, logoName: String, latitude: Double, longitude: Double, delta: Double, pointsOfInterest: [CampusCategory], info: [Section]) {
        self.campusName = campusName
        self.logoName = logoName
        self.latitude = latitude
        self.longitude = longitude
        self.delta = delta
        self.pointsOfInterest = pointsOfInterest
        self.info = info
    }
}
