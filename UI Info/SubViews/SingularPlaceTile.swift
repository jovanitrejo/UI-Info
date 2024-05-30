//
//  SingularPlaceTile.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct SingularPlaceTile: View {
    var place: String
    var imageName: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageName)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    Rectangle()
                        .aspectRatio(1, contentMode: .fit)
                        .overlay {
                            image
                                .resizable()
                                .scaledToFill()
                        }
                        .clipShape(Rectangle())
                        .cornerRadius(10)
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
            VStack {
                Spacer()
                HStack {
                    Text(place)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                        .shadow(radius: 10)
                    Spacer()
                }
            }
            .padding(.bottom, 10)
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    SingularPlaceTile(place: "The Academic and Residential Complex", imageName: "https://uiinfo-public-data-bucket.s3.amazonaws.com/UICImages/arcimage.jpg")
}
