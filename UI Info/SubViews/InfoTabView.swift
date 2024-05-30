//
//  InfoTabView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct InfoTabView: View {
    var sections: [Section]
    var selectedCampus: String
    var body: some View {
        VStack {
            VStack {
                determineCampusImage(campusName: selectedCampus)
                    .resizable()
                    .scaledToFit()
            }
            .padding(.all, 10)
            .background(.white)
            .cornerRadius(10)
            ScrollView {
                ForEach(sections) { section in
                    HStack {
                        Text(section.getSection())
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    HStack {
                        Text(section.getText())
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.bottom)
                }
            }
            .padding(.top)
        }
        .padding([.top, .leading, .trailing])
    }
    
    func determineCampusImage(campusName: String) -> Image {
        switch(campusName) {
        case "uic":
            return Image("uicfulllogo")
        case "illinois":
            return Image("illinoisfulllogo")
        case "uis":
            return Image("uisfulllogo")
        default:
            return Image(systemName: "photo")
        }
    }
}

#Preview {
    InfoTabView(sections: mockInfo, selectedCampus: "uic")
}
