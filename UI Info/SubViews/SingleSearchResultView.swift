//
//  SingleSearchResultView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct SingleSearchResultView: View {
    var categoryImageString: String
    var placeName: String
    var iconPair: (String, Color)
    
    init(categoryImageString: String, placeName: String) {
        iconPair = determineIcon(categoryName: categoryImageString)
        self.placeName = placeName
        self.categoryImageString = categoryImageString
    }


    var body: some View {
        HStack {
            Image(systemName: determineIcon(categoryName: categoryImageString).0)
                .foregroundColor(determineIcon(categoryName: categoryImageString).1)
            Text(placeName)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 50)
    }
}

#Preview {
    SingleSearchResultView(categoryImageString: "Housing", placeName: "Academic and Residential Complex")
}
