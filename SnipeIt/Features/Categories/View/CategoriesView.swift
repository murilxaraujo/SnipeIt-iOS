//
//  CategoriesView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 29/01/23.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel = CategoriesViewModel()
    @Binding var selectedCategory: Category?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List(viewModel.categories, id: \.id) { category in
            HStack {
                Text(category.name)
                Spacer()
                Text(category.type.rawValue)
            }.onTapGesture {
                selectedCategory = category
                dismiss()
            }
        }.onAppear {
            viewModel.getData()
        }.navigationTitle("Categories")
    }
}
