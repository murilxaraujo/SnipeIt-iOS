//
//  HardwareModelViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import Foundation

class HardwareModelViewModel: ObservableObject {
    @Published var models: [HardwareModel] = []
    
    @ResolveService var service: SnipeItService?
    
    @MainActor
    func getData() {
        Task {
            do {
                models = try await service!.hardwareModel.fetch().rows
            } catch let error {
                print(error)
            }
        }
    }
}
