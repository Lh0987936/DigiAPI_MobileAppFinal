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
        if let url = URL(string: field.image),
           !field.image.isEmpty {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 50)
        } else  {
            ProgressView()
                .frame(height: 50)
        }
    }
}
