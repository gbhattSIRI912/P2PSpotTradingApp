//
//  WarningBoxView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 11/01/25.
//

import SwiftUI

struct WarningBoxView: View {
    var body: some View {
        // Warning Box'
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(
                    style: StrokeStyle(lineWidth: 1, dash: [4])
                )
                .foregroundColor(Color.estimatedFeeColor)
                .padding(1)
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                        .font(.title3)
                    Text("Warning")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.secondaryTextColor)
                }
                Text("""
            * The data presented is for informational purposes only. It is provided by CoinMarketCap, and shown on an "as is" basis, without representation or warranty of any kind.
            """)
                .font(.customfont(.regular, fontSize: 14))
                .foregroundStyle(Color.secondaryTextColor)
            }
            .padding()
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(8)
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    WarningBoxView()
}
