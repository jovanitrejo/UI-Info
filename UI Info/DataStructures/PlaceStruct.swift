//
//  PlaceStruct.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import Foundation

class Place: Codable, Identifiable, Hashable, Equatable {
    internal var id: UUID
    private var name: String
    private var description: String
    private var image: String
    private var latitude: Double
    private var longitude: Double
    
    init(name: String, description: String, image: String, latitude: Double, longitude: Double) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case image
        case latitude
        case longitude
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.image = try container.decode(String.self, forKey: .image)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.id = UUID()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(image, forKey: .image)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getImage() -> String {
        return self.image
    }
    
    func getLatitude() -> Double {
        return self.latitude
    }
    
    func getLongitude() -> Double {
        return self.longitude
    }
}
