//
//  HorizontalTabBarView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct HorizontalTabBarView: View {
    let item: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item)
                .font(.custom("YourCustomFontName", size: 14))
                .foregroundColor(isSelected ? Color.primaryButtonColor : Color.black)
                .frame(height: 30)
                .padding(.horizontal, 5)
            
            if isSelected {
                Divider()
                    .frame(height: 2)
                    .background(Color.primaryButtonColor)
                    .padding(.horizontal, 5)
            }
        }
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    HorizontalTabBarView(item: "", isSelected: true) {
        
    }
}
