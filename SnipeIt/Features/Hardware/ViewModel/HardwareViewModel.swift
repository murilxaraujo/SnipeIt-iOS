//
//  HardwareViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import Foundation

class HardwareViewModel: ObservableObject {
    @Published var hardwares: [Hardware] = []
    
    @ResolveService var service: SnipeItService?
    
    @MainActor
    func fetch() {
        Task {
            do {
                hardwares = try await service!.hardware.fetch().rows
            } catch let error {
                print(error)
            }
        }
    }
}
