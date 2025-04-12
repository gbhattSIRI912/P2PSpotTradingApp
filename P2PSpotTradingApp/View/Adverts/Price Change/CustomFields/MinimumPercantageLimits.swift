//
//  MinimumPercantageLimits.swift
//  P2PSpotTradingApp
//
//  Created by orange on 10/01/25.
//

import SwiftUI

struct MinimumPercantageLimits: View {
    @State private var isSwitchLowestPrice: Bool = false
    @State private var isSwitchMarketPrice: Bool = false
    @State private var amount: Int = 0
    @State private var otherMinimumPrice: Int = 0
    @State private var amountPercentage: Double = 1.00
    @State private var otherPricePercentage: Double = 1.00
    @State private var marketAverageAmount: Int = 0
    @State private var marketAverageOtherPrice: Int = 0
    @State private var txtAmount: String = "40000"
    
    var body: some View {
        VStack {
            TotalAmountCustomView(title: "Set your price lower than the lowest price in the P2P market.", amount: $txtAmount, currencyType: "BTC")
            
            HStack {
                Text("Minimum/ Percantage Limits")
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundColor(Color.secondaryTextColor)
                Spacer()
                
                HStack(spacing: 10) {
                    Toggle(isOn: $isSwitchMarketPrice) {
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .frame(width: 24, height: 24)
                    
                    Text(isSwitchMarketPrice ? "ON" : "OFF")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.secondaryTextColor)
                        .padding(.leading, 12)
                }
                .padding(.trailing, 24)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            MinimumPriceView(title: "A minimum price threshold", amount: $amount, subHeading: "Floating Price will be in USD of market price", otherPrice: $otherMinimumPrice)
            
            MinimumPriceAccordingToPercentageView(title: "A minimum price threshold", amount: $amountPercentage, subHeading: "Floating Price will be % of market price", otherPrice: $otherPricePercentage)
            
            HStack {
                Text("Market Average Threshold")
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundColor(Color.secondaryTextColor)
                Spacer()
                
                HStack(spacing: 10) {
                    Toggle(isOn: $isSwitchLowestPrice) {
                        
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .frame(width: 24, height: 24)
                    Text(isSwitchLowestPrice ? "ON" : "OFF")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.secondaryTextColor)
                        .padding(.leading, 12)
                }
                .padding(.trailing, 24)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            MarketAverageThresholdView(title: "Adjust your price to remain below the market average or a set threshold.", amount: $marketAverageAmount, subHeading: "", otherPrice: $marketAverageOtherPrice)
            
        }
    }
}

#Preview {
    MinimumPercantageLimits()
}
