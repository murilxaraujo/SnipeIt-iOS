//
//  HardwareModelView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 28/01/23.
//

import SwiftUI

struct HardwareModelView: View {
    @Binding var selected: HardwareModel?
    @StateObject var viewModel = HardwareModelViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List(viewModel.models, id: \.self) { model in
            HStack {
                Text(model.name)
                Spacer()
                Text(model.manufacturer.name)
                    .font(.caption)
            }.onTapGesture {
                selected = model
                dismiss()
            }
        }.onAppear {
            viewModel.getData()
        }.navigationTitle("Hardware models")
            .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddHardwareModelView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
    }
}
