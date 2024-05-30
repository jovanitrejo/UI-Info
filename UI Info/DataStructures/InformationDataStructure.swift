//
//  InformationDataStructure.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/29/24.
//

import Foundation

class Section: Codable, Identifiable {
    internal var id: UUID
    private var section: String
    private var text: String
    
    init(id: UUID = UUID(), section: String, text: String) {
        self.id = id
        self.section = section
        self.text = text
    }
    
    private enum CodingKeys: String, CodingKey {
        case section
        case text
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.section = try container.decode(String.self, forKey: .section)
        self.text = try container.decode(String.self, forKey: .text)
        self.id = UUID()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(section, forKey: .section)
        try container.encode(text, forKey: .text)
    }
    
    func getSection() -> String {
        return self.section
    }
    
    func getText() -> String {
        return self.text
    }
}
