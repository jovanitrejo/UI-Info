//
//  WelcomeScreenButtonView.swift
//  UI Info SwiftUI
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct WelcomeScreenButtonView: View {
    let imageString: String
    let campusName: String
    var body: some View {
        HStack {
            Image(imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text(campusName)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 100, height: 50)
    }
}

#Preview {
    WelcomeScreenButtonView(imageString: "uislogo", campusName: "University of Illinois Urbana-\nChampaign")
}
