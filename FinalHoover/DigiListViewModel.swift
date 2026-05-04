//
//  DigiListViewModel.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/27/26.
//

import SwiftUI
import Combine

class DigiListViewModel: ObservableObject {
    @Published var content: [DigiFile] = [] //published array for the digiFiles grabbed by DigiScan
    @Published var selected: Digimon? = nil //Where the Digimon grabbed by DigiDetail is published to be turned into a detailView.

    func DigiScan() { //Grabs Page 10 of digimon from the API
        guard let url = URL(string: "https://digi-api.com/api/v1/digimon?page=10") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request failed: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                var digiResults = try JSONDecoder().decode(DigiList.self, from: data)
                
                DispatchQueue.main.async {
                    self.content = digiResults.content
                }
            } catch {
                print("DEcoding failed: \(error)")
            }
        }.resume()
    }
    
    func DigiDetail(digiId: Int) { //Grabs a specific Digimon by it's Id
        guard let url = URL(string: "https://digi-api.com/api/v1/digimon/\(digiId)") else {
            print("Invalid URL")
            return
            
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Request failed: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            do {
                let digiResults = try JSONDecoder().decode(Digimon.self, from: data)
                
                DispatchQueue.main.async {
                    self.selected = digiResults.self
                }
            } catch {
                print("DEcoding failed: \(error)")
            }
        }.resume()
    }
}
