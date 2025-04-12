//
//  BalanceView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 13/01/25.
//

import SwiftUI

struct BalanceView: View {
    @State private var isBalanceHidden: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 4) {
                    Text("Total Balance (BTC)")
                        .font(.customfont(.medium, fontSize: 10.5))
                        .foregroundStyle(Color.secondaryTextColor)
                    
                    Image("bottom_DropDown")
                        .resizable()
                        .frame(width: 10, height: 20)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 5) {
                    if isBalanceHidden {
                        Text("********")
                            .font(.customfont(.bold, fontSize: 12))
                            .foregroundStyle(Color.secondaryTextColor)
                    } else {
                        Text("0.12345678 BTC")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    
                    Button(action: {
                        isBalanceHidden.toggle()
                    }) {
                        Image(systemName: isBalanceHidden ? "eye.slash" : "eye")
                            .resizable()
                            .frame(width: 20, height: 14)
                            .foregroundColor(.gray)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                if #available(iOS 17.0, *) {
                    Text("You gained ")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundStyle(Color.greyColor)
                    + Text("$230.87")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundStyle(Color.greenColor)
                    + Text(" in October 2024")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundStyle(Color.greyColor)
                } else {
                    Text("You gained ")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundColor(Color.greyColor)
                    
                    + Text("$230.87")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundColor(Color.greenColor)
                    
                    + Text(" in October 2024")
                        .font(.customfont(.regular, fontSize: 12))
                        .foregroundColor(Color.greyColor)
                    
                }
            }
            
            Spacer()
            
            Button(action: {
                print("Deposit tapped")
            }) {
                Text("Deposit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(Color.primaryButtonColor)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    BalanceView()
}
