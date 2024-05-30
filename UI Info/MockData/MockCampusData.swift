//
//  MockCampusData.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import Foundation

let mockPlaceHousing = [
    Place(name: "CMW", description: "CMW is a residence hall at UIC", image: "cmwimage.jpg", latitude: 0, longitude: 0),
    Place(name: "ARC", description: "ARC is a residence hall at UIC", image: "arcimage.jpg", latitude: 0, longitude: 0),
    Place(name: "CMN", description: "CMN is a residence hall at UIC", image: "cmnimage.jpg", latitude: 0, longitude: 0),
    Place(name: "CMS", description: "CMS is a residence hall at UIC", image: "cmsimage.jpg", latitude: 0, longitude: 0),
    Place(name: "JST", description: "JST is a residence hall at UIC", image: "jstimage.jpg", latitude: 0, longitude: 0),
    Place(name: "SSR", description: "SSR is a residence hall at UIC", image: "ssrimage.jpg", latitude: 0, longitude: 0)
]

let mockPlaceDining = [
    Place(name: "SCE", description: "SCE is a dining hall at UIC", image: "cmwimage.jpg", latitude: 0, longitude: 0),
    Place(name: "JST", description: "JST is a dining hall at UIC", image: "jstimage.jpg", latitude: 0, longitude: 0),
]

let mockCategories = [CampusCategory(category: "housing", places: mockPlaceHousing), CampusCategory(category: "dining", places: mockPlaceDining)]

let mockInfo = [Section(section: "History", text: "blah blah blah")]

let mockCampus = Campus(campusName: "University of Illinois Chicago", logoName: "uiclogo", latitude: 41.87189, longitude: -87.64925, delta: 0.4, pointsOfInterest: mockCategories, info: mockInfo)
