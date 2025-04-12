//
//  TradingScreenView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 15/01/25.
//

import SwiftUI

struct TradingScreenView: View {
    var parentView: DetailPriceView?
    var body: some View {
        VStack(alignment: .leading) {
            
            // Price Section
            HStack {
                VStack(alignment: .leading) {
                    Text("671.72")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.primaryButtonColor)
                    
                    if #available(iOS 17.0, *) {
                        Text("=$671.72 ")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundStyle(Color.darkGray)
                        +
                        Text("+4.62%")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundStyle(Color.primaryButtonColor)
                    } else {
                        // Fallback on earlier versions
                        Text("=$671.72 ")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(Color.darkGray)
                        +
                        Text("+4.62%")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(Color.primaryButtonColor)
                    }
                        
                }
                
                HStack(spacing: 5) {
                    VStack(alignment: .leading) {
                        Text("24h High")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.greyColor)
                        Text("698.50")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("24h Low")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.greyColor)
                        Text("638.34")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("24h Vol(BNB)")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.greyColor)
                        Text("568,390.23")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    VStack(alignment: .leading) {
                        Text("24h Vol(USDT)")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.greyColor)
                        Text("568,390.23")
                            .font(.customfont(.regular, fontSize: 10))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                }
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 20)
            
            // Graph Section
            VStack(alignment: .leading, spacing: 0) {
                
                CustomChartView()
                    .padding(.top, 10)
                
                // Bottom Metrics Section
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        BottomMetricTab(title: "Today", value: "0.89%")
                        BottomMetricTab(title: "7 Days", value: "-7.71%")
                        BottomMetricTab(title: "30 Days", value: "6.39%")
                        BottomMetricTab(title: "90 Days", value: "8.93%")
                        BottomMetricTab(title: "180 Days", value: "15.34%")
                        BottomMetricTab(title: "1 Year", value: "144.83%")
                    }
                }
            }
        }
        .background(Color.white)
    }
}

#Preview {
    TradingScreenView()
}


