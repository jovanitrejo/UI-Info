//
//  SheetView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/28/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var selectedPlace: Place?
    @Binding var campus: Campus?
    let selectedCampus: String
    var body: some View {
        if selectedPlace == nil {
            SearchSheetView(pointsOfInterests: campus?.pointsOfInterest ?? mockCategories, selectedPlace: $selectedPlace)
                .presentationBackgroundInteraction(.enabled)
                .presentationDetents([.large])
        } else {
            SelectedPlaceInformationSheet(selectedPlace: selectedPlace!, imageName: getURLDirectory(selectedCampus: selectedCampus) + selectedPlace!.image)
                .presentationDetents([.fraction(0.5), .fraction(0.7), .fraction(0.99)])
        }
    }
}
