//
//  ColoredButtonView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/28/24.
//

import SwiftUI

struct ColoredButtonView: View {
    let color: Color
    let text: String
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(color)
            .foregroundColor(Color(UIColor.systemBackground))
            .cornerRadius(10)
    }
}

#Preview {
    ColoredButtonView(color: Color.blue, text: "Open in Maps")
}
