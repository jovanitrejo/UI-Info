//
//  CampusCategoryStruct.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import Foundation

class CampusCategory: Codable, Identifiable {
    let id: UUID
    let category: String
    let places: [Place]
    
    init(category: String, places: [Place]) {
        self.id = UUID()
        self.category = category
        self.places = places
    }
    
    private enum CodingKeys: String, CodingKey {
        case category
        case places
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(String.self, forKey: .category)
        self.places = try container.decode([Place].self, forKey: .places)
        self.id = UUID()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(category, forKey: .category)
        try container.encode(places, forKey: .places)
    }
}
