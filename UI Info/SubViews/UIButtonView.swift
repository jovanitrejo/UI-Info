//
//  UIButtonView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct UIButtonView: View {
    let image: String
    let text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 25, height: 25)
        }
        .padding(.horizontal)
        .padding(.vertical, 5.0)
        .frame(height: 40)
        .background(.regularMaterial)
        .foregroundColor(.gray)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UIButtonView(image: "magnifyingglass.circle.fill", text: "Search")
}
