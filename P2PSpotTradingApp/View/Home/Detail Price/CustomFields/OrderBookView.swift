//
//  OrderBookView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 15/01/25.
//

import SwiftUI

struct OrderBookView: View {
    let data: [OrderBookRow] = [
        OrderBookRow(bidQuantity: 21.164, bidPrice: 662.79, askPrice: 662.80, askQuantity: 12.567),
        OrderBookRow(bidQuantity: 2.563, bidPrice: 662.78, askPrice: 662.81, askQuantity: 2.545),
        OrderBookRow(bidQuantity: 2.072, bidPrice: 662.77, askPrice: 662.82, askQuantity: 0.011),
        OrderBookRow(bidQuantity: 12.066, bidPrice: 662.76, askPrice: 662.83, askQuantity: 15.145),
        OrderBookRow(bidQuantity: 0.008, bidPrice: 662.75, askPrice: 662.84, askQuantity: 33.407),
        OrderBookRow(bidQuantity: 6.921, bidPrice: 662.74, askPrice: 662.85, askQuantity: 15.127),
        OrderBookRow(bidQuantity: 10.340, bidPrice: 662.73, askPrice: 662.86, askQuantity: 28.692)
    ]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Bid")
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundStyle(Color.darkGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Ask")
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundStyle(Color.darkGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Table
            VStack {
                ForEach(data) { row in
                    HStack {
                        Text(String(format: "%.3f", row.bidQuantity))
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundStyle(Color.darkGray)
                        Spacer()
                        HStack(spacing: 8) {
                            Text(String(format: "%.2f", row.bidPrice))
                                .font(.customfont(.regular, fontSize: 12))
                                .foregroundStyle(Color.greenColor)
                            
                            Text(String(format: "%.2f", row.askPrice))
                                .font(.customfont(.regular, fontSize: 12))
                                .foregroundStyle(Color.textRedColor)
                        }
                        Spacer()
                        Text(String(format: "%.3f", row.askQuantity))
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundStyle(Color.darkGray)
                        
                    }
                    .padding(.top, 8)
                }
            }
        }
    }
}

#Preview {
    OrderBookView()
}


struct OrderBookRow: Identifiable {
    let id = UUID()
    let bidQuantity: Double
    let bidPrice: Double
    let askPrice: Double
    let askQuantity: Double
}
