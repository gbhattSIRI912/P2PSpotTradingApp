//
//  TopViewOrderView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct TopViewOrderView: View {
    var title: String = "All Ads"
    @Binding var isSelectAds: Bool
    var didTap: (()->())
    var body: some View {
        HStack(spacing: 8) {
            Text("View Orders")
                .foregroundStyle(Color.secondaryTextColor)
                .font(.customfont(.regular, fontSize: 14))
                // Select pop up view
            Button(action: {
                isSelectAds = true
            }, label: {
                HStack {
                    Text(title)
                        .foregroundStyle(Color.secondaryTextColor)
                        .font(.customfont(.regular, fontSize: 14))
                        .padding(.leading, 8)
                    Spacer()
                    Image("bottom_DropDown")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 20, alignment: .trailing)
                        .padding(.trailing, 8)
                }
                .frame(width: .screenWidth * 0.6, height: 44)
                .background(Color.lightGreyColor)
                .cornerRadius(8)
                
            })
            
            Button(action: {
                didTap()
            }, label: {
                Image("Refresh")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            })
        }
        .frame(maxWidth: .infinity, alignment: .center)
        
    }
}

#Preview {
    TopViewOrderView(isSelectAds: .constant(false), didTap: {
        print("Api update")
    })
}
