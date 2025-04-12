//
//  FloatingPriceView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI

struct FloatingPriceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Floating Price value as per market price")
                .font(.customfont(.regular, fontSize: 14))
                .foregroundColor(Color.secondaryTextColor)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemTeal).opacity(0.3))
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1))
                
                HStack(spacing: 2) {
                    Text("USD")
                        .font(.customfont(.regular, fontSize: 16))
                        .foregroundColor(Color.secondaryTextColor)
                    
                    Text("460.54")
                        .font(.customfont(.medium, fontSize: 16))
                        .foregroundColor(Color.secondaryTextColor)
                }
                .padding(.horizontal, 16)
            }
            
            // Market Price
            HStack {
                Text("Market Price")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.secondaryTextColor)
                
                Spacer()
                
                Text("USD 450.00")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.secondaryTextColor)
            }
            .padding(.horizontal, 24)
        }
        .padding()
    }
}

#Preview {
    FloatingPriceView()
        .previewLayout(.sizeThatFits)
}
