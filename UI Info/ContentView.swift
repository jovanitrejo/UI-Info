//
//  ContentView.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let selectedCampus: String
    @State private var campus: Campus? = nil
    @State private var showSearchSheet: Bool = false
    @State private var imageDirectory: String?
    @State private var region: MKCoordinateRegion
    @State private var selectedPlace: Place? = nil
    @State private var selectedTab: String = "Map"
    var imageURLPath: String
    
    init(selectedCampus: String, region: MKCoordinateRegion) {
        self.selectedCampus = selectedCampus
        self._region = State(initialValue: region)
        self.imageURLPath = getURLDirectory(selectedCampus: selectedCampus)
    }
    
    
    var body: some View {
        Group {
            if campus == nil {
                ProgressView()
                    .ignoresSafeArea()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            } else {
                TabView(selection: $selectedTab) {
                    MapTabView(showSearchSheet: $showSearchSheet, position: $region, selectedPlace: $selectedPlace, places: campus!.getPointsOfInterest())
                        .tabItem {
                            Image(systemName: "map")
                            Text("Map")
                        }
                        .tag("Map")
                    LandmarksTabView(campusCategories: campus!.getPointsOfInterest(), imageURLPath: imageURLPath, selectedPlace: $selectedPlace)
                        .tabItem {
                            Image(systemName: "mappin.circle")
                            Text("Landmarks")
                        }
                        .tag("Landmarks")
                    InfoTabView(sections: campus!.getInfo(), selectedCampus: selectedCampus)
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("Info")
                        }
                        .tag("Info")
                }
                .onChange(of: selectedCampus) {
                    if selectedCampus != "none" {
                        loadData()
                    }
                }
                .onChange(of: selectedPlace) {
                    if selectedPlace != nil {
                        showSearchSheet = true
                        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: selectedPlace!.getLatitude() - 0.001, longitude: selectedPlace!.getLongitude()), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
                        selectedTab = "Map"
                    }
                }
                .sheet(isPresented: $showSearchSheet, onDismiss: {
                    showSearchSheet = false
                    selectedPlace = nil
                    region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: campus!.getLatitude(), longitude: campus!.getLongitude()), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
                    configureTabBarAppearance()
                }) {
                    SheetView(selectedPlace: $selectedPlace, campus: $campus, selectedCampus: selectedCampus)
                        .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.5)))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                loadData()
                configureTabBarAppearance()
            }
        }
    }
    
    func loadData() {
        S3DataLoader().loadCampusDataFromS3(selectedCampus: selectedCampus) { result in
            switch result {
            case .success(let campus):
                DispatchQueue.main.async {
                    self.campus = campus
                    self.imageDirectory = getURLDirectory(selectedCampus: selectedCampus)
                    self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: campus.getLatitude(), longitude: campus.getLongitude()), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    
    func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.selectionIndicatorTintColor = .systemBlue
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.selected.iconColor = UIColor.systemBlue
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        itemAppearance.normal.iconColor = .gray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().standardAppearance = appearance
        } else {
            UITabBar.appearance().standardAppearance = appearance
        }
    }
}

#Preview {
    ContentView(selectedCampus: "uic", region: campusRegions[0])
}
