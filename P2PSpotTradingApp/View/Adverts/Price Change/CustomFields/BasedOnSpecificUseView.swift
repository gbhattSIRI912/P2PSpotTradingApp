//
//  BasedOnSpecificUseView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 20/01/25.
//

import SwiftUI

struct BasedOnSpecificUseView: View {
    @State private var isToggleForSpecificUse: Bool = false
    @State private var txtSearch: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Price Based on Specific Use")
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundColor(Color.secondaryTextColor)
                Spacer()
                
                HStack(spacing: 10) {
                    Toggle(isOn: $isToggleForSpecificUse) {
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .frame(width: 24, height: 24)
                    Text(isToggleForSpecificUse ? "ON" : "OFF")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.secondaryTextColor)
                        .padding(.leading, 12)
                }
                .padding(.trailing, 24)
            }
            .padding(.horizontal)
            .padding(.top, .topInsets + 30)
            SearchTextField(placholder: "Search", txt: $txtSearch)
                .padding(.horizontal)
        }
    }
}

#Preview {
    BasedOnSpecificUseView()
}
