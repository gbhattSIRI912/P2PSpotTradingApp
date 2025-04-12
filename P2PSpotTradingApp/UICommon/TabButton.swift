//
//  TabButton.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct TabButton: View {
    let title: String
    let icon: String
    let isSelect: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Image(icon)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelect ? .primaryButtonColor : .whiteTextColor)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
}
