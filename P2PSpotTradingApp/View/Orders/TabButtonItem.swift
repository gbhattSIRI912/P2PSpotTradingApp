//
//  TabButtonItem.swift
//  P2PSpotTradingApp
//
//  Created by orange on 20/01/25.
//

import SwiftUI

struct TabButtonItem: View {
    let title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            selectedTab = title
        }) {
            VStack(spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .foregroundColor(selectedTab == title ? .teal : .gray)
                
                Divider()
                    .frame(maxWidth: selectedTab == title ? nil : 0, maxHeight: 1)
                    .background(selectedTab == title ? Color.teal : Color.clear)
            }
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

#Preview {
    TabButtonItem(title: "", selectedTab: .constant("tab"))
}
