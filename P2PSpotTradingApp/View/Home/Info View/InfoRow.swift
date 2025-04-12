//
//  InfoRow.swift
//  P2PSpotTradingApp
//
//  Created by orange on 13/01/25.
//

import SwiftUI

struct InfoRow: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color.secondaryTextColor)
                .font(.customfont(.regular, fontSize: 14))
            Spacer()
            Text(value)
                .foregroundColor(Color.secondaryTextColor)
                .font(.customfont(.medium, fontSize: 14))
        }
        .padding(.vertical, 5)
    }
}
#Preview {
    InfoRow(title: "", value: "")
}
