//
//  DigiDetailView.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/29/26.
//

import SwiftUI

struct DigiDetailView: View {
    @Environment(\.dismiss) var dismiss
    let digimon: Digimon
    var body: some View {
        VStack {
        Text(digimon.name)
            .font(.largeTitle)
        let pic = digimon.images.first?.href ?? ""
        if let url = URL(string: pic),
           !pic.isEmpty {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 75)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 75)
        } else  {
            ProgressView()
                .frame(height: 75)
        }
        let englishDesc = digimon.findEn_US()
        if englishDesc != -1 {Text("\(digimon.descriptions[englishDesc].description)")
                .font(.callout)
            .padding()} else {
                Text("No Description Found...")
                    .font(.caption)
                    .padding()
            }
        }
        Text("Environments")
        HStack {
            let environments = digimon.fields.count
            if environments > 0 {
                LazyVGrid (columns: Array(repeating: GridItem(), count:4)) {
                    ForEach(digimon.fields) {
                       environment in FieldCardView(field: environment)
                    }
                }
                
            }
        } .padding()
        Button(action: {dismiss()}) {
            Text("Back")
                .font(.largeTitle)
                .padding()
                .background(.black)
                .cornerRadius(20)
        }
    }
}
