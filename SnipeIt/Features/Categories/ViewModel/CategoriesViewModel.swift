//
//  CategoriesViewModel.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    @ResolveService var service: SnipeItService?
    
    @MainActor
    func getData() {
        Task {
            do {
                categories = try await service!.category.fetch().rows
            } catch {
                print("Could not get categories")
            }
        }
    }
}
