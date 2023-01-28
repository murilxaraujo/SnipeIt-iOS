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
    
    var body: some View {
        List(viewModel.models, id: \.self, selection: $selected) { model in
            Text(model.name)
        }.onAppear {
            viewModel.getData()
        }.navigationTitle("HardwareModels")
    }
}
