//
//  BottomMetricTab.swift
//  P2PSpotTradingApp
//
//  Created by orange on 15/01/25.
//

import SwiftUI

struct BottomMetricTab: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.customfont(.regular, fontSize: 9.51))
                .foregroundStyle(Color.greyColor)
            Text(value)
                .font(.customfont(.regular, fontSize: 8.4))
                .foregroundStyle(Color.green)
        }
        .padding()
    }
}

#Preview {
    BottomMetricTab(title: "Today", value: "8.89%")
}
