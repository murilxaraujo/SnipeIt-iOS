//
//  HardwareView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 14/01/23.
//

import SwiftUI

struct HardwareView: View {
    @StateObject var viewModel = HardwareViewModel()
    
    var body: some View {
        List(viewModel.hardwares, id: \.id) { hardware in
            HStack {
                VStack(alignment: .leading) {
                    Text(hardware.name?.removingPercentEncoding ?? "")
                    Text(hardware.manufacturer.name)
                        .font(.subheadline)
                    Spacer()
                    HStack {
                        Image(systemName: "barcode").foregroundColor(.gray)
                        Text(hardware.tag).font(.caption)
                    }
                }.padding(.top)
                    .padding(.bottom)
                Spacer()
                CachableImage(urlString: hardware.image.replacingOccurrences(of: "\\", with: "").replacingOccurrences(of: "https", with: "http"))
                    .frame(width: 100, height: 100)
                    .background(.gray)
                    .cornerRadius(5)
            }
        
        }
        .onAppear {
            viewModel.fetch()
        }
        .navigationBarTitle("Hardware")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.newHardwarePressed()
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(isPresented: $viewModel.isShowingAddHardware) {
            NavigationStack {
                AddHardwareView()
            }
        }
    }
}

struct HardwareView_Previews: PreviewProvider {
    
    static var previews: some View {
        return HardwareView()
    }
}
