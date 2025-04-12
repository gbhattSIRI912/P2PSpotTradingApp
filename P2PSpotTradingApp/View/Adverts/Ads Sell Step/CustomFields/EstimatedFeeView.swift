//
//  EstimatedFeeView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI

struct EstimatedFeeView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(
                    style: StrokeStyle(lineWidth: 1, dash: [4])
                )
                .foregroundColor(Color.estimatedFeeColor)
                .padding(4)
            
            Text("Estimated Fee - 0.876 BTC")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
                .padding([.top, .bottom], 8)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.innerBoarderColor)
                .padding(.horizontal, 7)
                .padding([.top, .bottom], 8)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding([.top, .bottom], 5)
        }
        .padding()
        
    }
}

#Preview {
    EstimatedFeeView()
}
