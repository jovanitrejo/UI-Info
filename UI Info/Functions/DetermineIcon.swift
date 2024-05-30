//
//  DetermineIcon.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/27/24.
//

import Foundation
import SwiftUI

func determineIcon(categoryName: String) -> (String, Color) {
    switch(categoryName) {
    case "Housing":
        return ("house.circle.fill", Color.blue)
    case "Food":
        return ("fork.knife.circle.fill", Color.orange)
    case "Lecture Buildings":
        return ("graduationcap.circle.fill", Color.brown)
    case "Offices":
        return ("building.2.crop.circle.fill", Color.yellow)
    case "Research":
        return ("atom", Color.green)
    case "Recreation":
        return ("figure.run.circle.fill", Color.teal)
    case "Libraries":
        return ("book.circle.fill", Color.brown)
    case "Medical":
        return ("cross.case.circle.fill", Color.red)
    default:
        return ("none", Color.gray)
    }
}
