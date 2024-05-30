//
//  GetImageURLDirectory.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
// Retrieves the correct directory link to campus imagery based on selectedCampus string
//

import Foundation

func getURLDirectory(selectedCampus: String) -> String {
    switch(selectedCampus) {
    case "uic":
        return "https://uiinfo-public-data-bucket.s3.amazonaws.com/UICImages/"
    case "illinois":
        return "https://uiinfo-public-data-bucket.s3.amazonaws.com/IllinoisImages/"
    case "uis":
        return "https://uiinfo-public-data-bucket.s3.amazonaws.com/UISImages/"
    default:
        return ""
    }
}
