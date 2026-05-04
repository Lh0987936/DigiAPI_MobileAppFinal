//
//  DevelopView.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/27/26.
//

import SwiftUI

struct DevelopView: View {
    let developer: Developer
    var body: some View {
        VStack {
            HStack {
                Text(developer.Name)
                    .font(.largeTitle)
                    .bold()
                Image("AgumonChibi")
                    .resizable()
                    .frame(width:75, height:75)
            }
            .padding()
            VStack {
                //Grabs the image from the Assets
                Image(developer.photo)
                    .resizable()
                    .frame(width:350)
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
            }
            VStack {
                Text("Age: \(developer.Age)")
                Text(developer.Greeting)
                    .padding()
            }
        }
    }
    
}

#Preview {
    DevelopView(developer: .LoganHoover)
}
