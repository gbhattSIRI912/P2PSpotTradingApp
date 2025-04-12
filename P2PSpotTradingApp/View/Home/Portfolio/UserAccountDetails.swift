//
//  UserAccountDetails.swift
//  P2PSpotTradingApp
//
//  Created by orange on 31/01/25.
//

import SwiftUI

struct UserAccountDetails: View {
    var title: String
    var totalCount: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                Image("TotalOrder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .leading)
                
                Text("""
                     \(title)
                     """)
                .foregroundStyle(Color.secondaryTextColor)
                .font(.customfont(.regular, fontSize: 14))
            }
            
            Text("\(totalCount)")
                .foregroundStyle(Color.secondaryTextColor)
                .font(.customfont(.regular, fontSize: 20))
        }
        .padding(5)
        .frame(width: .screenWidth * 0.3, height: 110, alignment: .leading)
        .background(Color.lightGreyColor)
        .cornerRadius(8)
    }
}

#Preview {
    UserAccountDetails(title: "", totalCount: 0)
}
