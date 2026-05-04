//
//  DigiFileView.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/27/26.
//

import SwiftUI

struct DigiFileView: View {
    let digifile: DigiFile
    var body: some View {
        VStack {
            if let url = URL(string: digifile.image),
               !digifile.image.isEmpty {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 75)
            } else  {
                ProgressView()
                    .frame(height: 75)
            }
            Text(digifile.name)
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(20)
    }
}


