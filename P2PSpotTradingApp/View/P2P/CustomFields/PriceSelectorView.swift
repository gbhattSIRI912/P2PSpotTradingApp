//
//  PriceSelectorView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 12/01/25.
//

import SwiftUI

struct PriceSelectorView: View {
//    @State private var selectedOption: String = "15"
    var bestSellPrice: String
    var bestBuyPrice: String
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Best Sell Price")
                        .font(.customfont(.regular, fontSize: 10))
                        .foregroundColor(Color.darkGray)
                    Text(bestSellPrice)
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundColor(Color.textRedColor)
                }
                
                VStack(alignment: .center, spacing: 2) {
                    Text("Best Buy Price")
                        .font(.customfont(.regular, fontSize: 10))
                        .foregroundColor(Color.darkGray)
                    Text(bestBuyPrice)
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundColor(Color.greenColor)
                }
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    PriceSelectorView(bestSellPrice: "", bestBuyPrice: "")
}
