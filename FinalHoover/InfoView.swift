//
//  InfoView.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/27/26.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        //Simple Vstack with Info
        VStack {
            Text("DAPI: Digimon API")
                .bold()
                .font(.largeTitle)
            Text("Website: Digi-api.com")
            Text("Student Name: Logan Hoover")
        }
        .padding()


    }
}

#Preview {
    InfoView()
}
