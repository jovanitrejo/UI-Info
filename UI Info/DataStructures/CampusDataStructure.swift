//
//  CampusDataStructure.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import Foundation

class Campus: Codable {
    private let campusName: String
    private let logoName: String
    private let latitude: Double
    private let longitude: Double
    private let delta: Double
    private let pointsOfInterest: [CampusCategory]
    private let info: [Section]
    
    init(campusName: String, logoName: String, latitude: Double, longitude: Double, delta: Double, pointsOfInterest: [CampusCategory], info: [Section]) {
        self.campusName = campusName
        self.logoName = logoName
        self.latitude = latitude
        self.longitude = longitude
        self.delta = delta
        self.pointsOfInterest = pointsOfInterest
        self.info = info
    }
    
    func getLatitude() -> Double {
        return self.latitude
    }
    
    func getLongitude() -> Double {
        return self.longitude
    }
    
    func getPointsOfInterest() -> [CampusCategory] {
        return self.pointsOfInterest
    }
    
    func getInfo() -> [Section] {
        return self.info
    }
}
