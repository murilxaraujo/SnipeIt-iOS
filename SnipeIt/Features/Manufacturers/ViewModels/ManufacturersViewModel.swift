//
//  ManufacturersViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class ManufacturersViewModel: ObservableObject {
    @Published var manufacturers: [Manufacturer] = []
    @Published var newManufacturerName = ""
    @Published var isPresentingNewManufacturer = false
    @ResolveService var service: SnipeItService?
    
    @MainActor
    func fetch() {
        Task {
            do {
                manufacturers = try await service!.manufacturers.fetch().rows
            } catch let error {
                print(error)
            }
        }
    }
    
    func didTapNewManufacturer() {
        isPresentingNewManufacturer = true
    }
    
    func addManufacturer() {
        guard !newManufacturerName.isEmpty else { return }
        
        Task {
            do {
                try await service?.manufacturers.add(withName: newManufacturerName)
                await fetch()
            } catch {
                print("Could not add manufacturer")
            }
        }
    }
}
