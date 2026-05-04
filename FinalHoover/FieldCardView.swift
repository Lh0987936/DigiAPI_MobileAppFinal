//
//  FieldCardView.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 5/1/26.
//

import SwiftUI

struct FieldCardView: View {
    let field: Field
    var body: some View {
        //Checking if the Url is empty.
        if let url = URL(string: field.image),
           !field.image.isEmpty {
            //Grabbing the Image from the url
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } //here down displaying a progress circle if can't display an image.
            placeholder: {
                ProgressView()
            }
            .frame(height: 50)
        } else  {
            ProgressView()
                .frame(height: 50)
        }
    }
}
