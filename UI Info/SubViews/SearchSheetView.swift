//
//  SearchSheetView.swift
//  UI Info
//
//  Created by Jovani Trejo on 5/25/24.
//

import SwiftUI

struct SearchSheetView: View {
    var pointsOfInterests: [CampusCategory]
    @State var searchText = ""
    @Binding var selectedPlace: Place?
    
    private var filteredPointsOfInterests: [CampusCategory] {
        if searchText.isEmpty {
            return pointsOfInterests
        } else {
            let lowercasedSearchText = searchText.lowercased()
            return pointsOfInterests.map { category in
                let filteredPlaces = category.getPlaces().filter { place in
                    let nameMatches = containsCharactersInOrder(name: place.getName(), searchText: lowercasedSearchText)
                    let acronymMatches = generateAcronyms(from: place.getName()).contains { $0.lowercased().contains(lowercasedSearchText) }
                    return nameMatches || acronymMatches
                }
                return CampusCategory(category: category.getCategory(), places: filteredPlaces)
            }.filter { category in
                !category.getPlaces().isEmpty
            }
        }
    }
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.horizontal)
                    .frame(maxHeight: .infinity)
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
            .background(.regularMaterial)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.top, 20)
            ScrollView {
                ForEach(filteredPointsOfInterests) { category in
                    ForEach(category.getPlaces()) { place in
                        Button(action: {
                            selectedPlace = place
                        }, label: {
                            SingleSearchResultView(categoryImageString: category.getCategory(), placeName: place.getName())
                        })
                        .buttonStyle(PlainButtonStyle())
                        Divider()
                    }
                }
            }
            Spacer()
        }
    }
    
    func generateAcronyms(from name: String) -> [String] {
        let commonWords: Set<String> = ["and", "the", "of", "in", "a", "to"]
        let words = name.split(separator: " ").filter { !commonWords.contains($0.lowercased()) }
        var acronyms: [String] = []
        
        func generateCombinations(current: String, index: Int) {
            if index == words.count {
                acronyms.append(current)
                return
            }
            let word = words[index]
            generateCombinations(current: current + (word.first?.uppercased() ?? ""), index: index + 1)
            generateCombinations(current: current, index: index + 1)
        }
        
        generateCombinations(current: "", index: 0)
        
        return acronyms.filter { !$0.isEmpty }
    }
    
    func containsCharactersInOrder(name: String, searchText: String) -> Bool {
        var searchIndex = searchText.startIndex
        for char in name.lowercased() {
            if char == searchText[searchIndex] {
                searchIndex = searchText.index(after: searchIndex)
                if searchIndex == searchText.endIndex {
                    return true
                }
            }
        }
        return searchIndex == searchText.endIndex
    }
}

#Preview {
    SearchSheetView(pointsOfInterests: mockCategories, selectedPlace: .constant(nil))
}
