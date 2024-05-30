//
//  UpdateSelectedCampus.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import Foundation

func updateSelectedCampus(to campusName: String) {
    UserDefaults.standard.set(campusName, forKey: "selectedCampus")
    print("Changed selected campus")
}
