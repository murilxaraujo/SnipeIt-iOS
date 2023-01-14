//
//  MainView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel.shared
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressView().progressViewStyle(.circular)
                .onAppear {
                    viewModel.fetch()
                }
        case .configured:
            NavigationStack {
                HardwareView()
            }
        case .pendingConfiguration:
            ServerConfigView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
