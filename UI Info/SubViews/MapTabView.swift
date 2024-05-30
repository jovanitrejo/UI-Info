//
//  MapTabView.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI
import MapKit

struct MapTabView: View {
    @Binding var showSearchSheet: Bool
    @Binding var position: MKCoordinateRegion
    @Binding var selectedPlace: Place?
    @State private var selectedPlacemark: MKPlacemark?
    var places: [CampusCategory]?
    
    var body: some View {
        ZStack {
            MapView(region: $position, selectedPlace: $selectedPlace, categories: places)
                .ignoresSafeArea()
            /*Map(position: .constant(position ?? .automatic), selection: $selectedPlacemark) {
                ForEach(places ?? mockCategories) { category in
                    ForEach(category.places) { place in
                        Annotation(place.name, coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)) {
                            Image(systemName: determineIcon(categoryName: category.category).0)
                                .foregroundColor(determineIcon(categoryName: category.category).1)
                        }
                        .tag(MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)))
                    }
                }
            }*/
            VStack {
                HStack {
                    Button(action: {
                        updateSelectedCampus(to: "none")
                    }, label: {
                        UIButtonView(image: "arrowshape.left.circle.fill", text: "Select a Campus")
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                .padding(.leading, 5)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showSearchSheet = true
                    }, label: {
                        UIButtonView(image: "magnifyingglass.circle.fill", text: "Search")
                    })
                }
                .padding([.bottom, .trailing])
            }
        }
    }
}

struct MapTabView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State var testBool = false
        @State var testPosition: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        var body: some View {
            MapTabView(showSearchSheet: $testBool, position: $testPosition, selectedPlace: .constant(mockPlaceDining[0]), places: mockCategories)
        }
    }
}
