//
//  BNBInfoView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 11/01/25.
//

import SwiftUI

struct BNBInfoView: View {
    @EnvironmentObject var router: Router
    @State private var selectedTab: String = "Info"
    let infoData = [
        ("Rank", "No. 8"),
        ("Market Cap", "$90.98B"),
        ("Fully Diluted Market Cap", "$90.98B"),
        ("Market Dominance", "2.90%"),
        ("Volume", "$1.56B"),
        ("Vol/Market Cap", "1.57%"),
        ("Circulation Supply", "144.01M BNB"),
        ("Total Supply", "144.01M BNB"),
        ("Issue Date", "2017-07-08"),
        ("Issue Price", "$0.16"),
        ("All Time High", "$702.3505")
    ]
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                // BNB Title
                Text("BNB")
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundStyle(Color.secondaryTextColor)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                
                WarningBoxView()
                
                // Detailed Information Table
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(infoData.indices, id: \.self) { index in
                        InfoRow(title: infoData[index].0, value: infoData[index].1)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom, .bottomInsets + 65)
            }
        }
    }
}
