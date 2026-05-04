//
//  ContentView.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/27/26.
//

import SwiftUI

struct ContentView: View {
@StateObject private var viewModel = DigiListViewModel()
    var body: some View {
        TabView {
            NavigationStack {
                //Title
                VStack {
                    Text("The DigiList!")
                        .font(.largeTitle)
                }
                //LazyGrid to display digimon buttons
                LazyVGrid(columns: Array(repeating: GridItem(), count:2)) {
                    ForEach(viewModel.content) {
                        digi in DigiFileView(digifile: digi)
                            .padding()
                            .frame(width:150)
                            .onTapGesture {
                                viewModel.DigiDetail(digiId: digi.id)

                            }
                    }
                }
                .padding()
                .onAppear {
                    viewModel.DigiScan()
                }
            }
            //pulls up each digimon in the Detail View!
            .fullScreenCover(item: $viewModel.selected, content: {digi in DigiDetailView(digimon:digi)})
            .tabItem {
                Label("DigiSearch", systemImage:"magnifyingglass")
            }
            DevelopView(developer: .LoganHoover)
                .tabItem {
                    Label("Developer", systemImage: "at.circle.fill")
                }
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle.fill")
                }
        }

    }
}

#Preview {
    ContentView()
}
