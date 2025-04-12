//
//  SearchTextField.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import SwiftUI

struct SearchTextField: View {
   
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image("Search")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
           
            TextField(placholder, text: $txt)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 30)
        }
        .frame(height: 30)
        .padding(10)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(8)
    }
}


#Preview {
    SearchTextField(txt: .constant("search"))
}
