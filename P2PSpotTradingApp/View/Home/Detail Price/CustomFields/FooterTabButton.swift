//
//  FooterTabButton.swift
//  P2PSpotTradingApp
//
//  Created by orange on 15/01/25.
//

import SwiftUI

struct FooterTabButton: View {
    let iconName: String
    let label: String
    var didTab: () -> ()
    
    var body: some View {
        Button {
            didTab()
        } label: {
            VStack {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 15)
                
                Text(label)
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundColor(Color.darkGray)
            }
            .frame(width: 44, height: 39)
        }
        .frame(width: 44, height: 39)
    }
}

#Preview {
    FooterTabButton(iconName: "More", label: "Buy") {
        
    }
}
