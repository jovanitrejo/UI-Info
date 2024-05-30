//
//  DetermineButton.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/28/24.
//

import Foundation
import SwiftUI

func determineButton(category: String) -> (String, Color) {
    switch(category) {
    case "food":
        return ("View Menu", Color.orange)
    default:
        return ("Directions", Color.blue)
    }
}
