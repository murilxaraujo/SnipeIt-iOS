//
//  AddHardwareViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import Foundation

class AddHardwareViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var serial: String = ""
    @Published var status: [StatusLabel] = []
    @Published var selectedStatus = 0
    @Published var selectedModel: HardwareModel?
    @ResolveService var service: SnipeItService?
    
    @MainActor
    func getData() {
        Task {
            do {
                status = try await service!.statusLabel.fetch().rows
            } catch let error {
                print(error)
            }
        }
    }
}
