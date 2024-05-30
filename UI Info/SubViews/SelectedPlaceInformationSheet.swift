//
//  SelectedPlaceInformationSheet.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/28/24.
//

import SwiftUI
import MapKit

struct SelectedPlaceInformationSheet: View {
    var selectedPlace: Place
    var imageName: String
    @State var showDetails = false
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageName)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    Rectangle()
                        .aspectRatio(1, contentMode: .fill)
                        .overlay {
                            image
                                .resizable()
                                .scaledToFill()
                                .scaleEffect(CGSize(width: 1, height: 1.05))
                                .ignoresSafeArea(edges: .vertical)
                                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width, minHeight: 0)
                        .onAppear {
                            showDetails = true
                        }
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                }
            }
            if showDetails {
                VStack {
                    HStack {
                        Text(selectedPlace.name)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                        Spacer()
                    }
                    .padding(.top)
                    ScrollView {
                        VStack {
                            HStack {
                                Text(selectedPlace.description)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        Button(action: {
                            let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: selectedPlace.latitude, longitude: selectedPlace.longitude))
                            let landmark = MKMapItem(placemark: placemark)
                            landmark.name = selectedPlace.name
                            landmark.openInMaps()
                        }) {
                            ColoredButtonView(color: Color.blue, text: "Open in Maps")
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .frame(minHeight: 0)
    }
}

#Preview {
    SelectedPlaceInformationSheet(selectedPlace: mockPlaceHousing[1], imageName: "https://uiinfo-public-data-bucket.s3.amazonaws.com/UICImages/arcimage.jpg")
}
