//
//  ServerConfigView.swift
//  SnipeIt
//
//  Created by Murilo Araujo on 13/01/23.
//

import SwiftUI

struct ServerConfigView: View {
    @State var serverURL: String = ""
    @State var serverToken: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "shippingbox.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding()
            Text("SnipeIt connection")
                .font(.title)
            Text("To use the app fill in your SnipeIt server configuration")
                .font(.body)
                .multilineTextAlignment(.center)
            VStack {
                TextField("Server URL", text: $serverURL)
                    .textFieldStyle(.roundedBorder)
                TextField("Token", text: $serverToken)
                    .textFieldStyle(.roundedBorder)
            }.padding()
            Button {
                
            } label: {
                Text("Submit")
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct ServerConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ServerConfigView()
    }
}
