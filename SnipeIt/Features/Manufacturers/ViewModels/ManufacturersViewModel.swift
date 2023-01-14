//
//  ManufacturersViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import Foundation

class ManufacturersViewModel: ObservableObject {
    @Published var manufacturers: [Manufacturer] = []
    
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
}
