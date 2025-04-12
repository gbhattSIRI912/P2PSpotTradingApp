//
//  StockListView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 31/01/25.
//

import SwiftUI

struct StockListView: View {
    var balancedata: Balance
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text(balancedata.asset ?? "")
                            .foregroundStyle(Color.secondaryTextColor)
                            .font(.customfont(.medium, fontSize: 16))
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Last Price")
                                    .foregroundStyle(Color.darkGray)
                                    .font(.customfont(.regular, fontSize: 11))
                               
                                Text("$ \(balancedata.free ?? "")")
                                    .foregroundStyle(Color.secondaryTextColor)
                                    .font(.customfont(.regular, fontSize: 14))
                            }
                        }
                        .padding(.top, 10)
                    }
                }
                Spacer()
                VStack {
                    Text("+ \(balancedata.locked ?? "")")
                        .foregroundStyle(Color.secondaryTextColor)
                        .font(.customfont(.regular, fontSize: 20))
                    Text("In the last 3 years")
                        .foregroundStyle(Color.secondaryTextColor)
                        .font(.customfont(.regular, fontSize: 11))
                }
            }
         
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.boarderColor, lineWidth: 0.5)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}

#Preview {
    StockListView(balancedata: Balance(asset: "", free: "", locked: ""))
}
