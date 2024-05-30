//
//  LandmarksTabView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct LandmarksTabView: View {
    var campusCategories: [CampusCategory]
    var selectedCampus: String
    @Binding var selectedPlace: Place?
    var body: some View {
        VStack {
            HStack {
                Text("Points of Interests")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading)
            Spacer()
            ScrollView {
                ForEach(campusCategories) { category in
                    VStack {
                        HStack {
                            Text(category.category)
                                .font(.title2)
                                .padding(.leading)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Array(category.places.enumerated()), id: \.element.id) { index, place in
                                    Button(action: {
                                        selectedPlace = place
                                    }, label: {
                                        SingularPlaceTile(place: place.name, imageName: getURLDirectory(selectedCampus: selectedCampus) + place.image)
                                            .padding(.leading, index == 0 ? 16 : 0) // Padding for the first element
                                            .padding(.trailing, index == category.places.count - 1 ? 16 : 0) // Padding for the last element
                                    })
                                }
                            }
                        }
                    }
                }
            }
            .safeAreaPadding(.bottom, 10)
        }
        .padding(.top)
    }
}

#Preview {
    LandmarksTabView(campusCategories: mockCategories, selectedCampus: "uic", selectedPlace: .constant(nil))
}
