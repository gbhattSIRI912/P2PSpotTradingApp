//
//  SearchListUsingPriceBases.swift
//  P2PSpotTradingApp
//
//  Created by orange on 20/01/25.
//

import SwiftUI

struct SearchListUsingPriceBases: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .clipShape(.circle)
                            Text("RajVerma")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.secondaryTextColor)
                            
                            Image("Right_Yellow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10.56, height: 10.56)
                        }
                        Text("$ 90.22")
                            .font(.customfont(.regular, fontSize: 20))
                            .foregroundColor(Color.secondaryTextColor)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Image("Right_Yellow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10.56, height: 10.56)
                            Text("750 Trades")
                                .font(.customfont(.regular, fontSize: 11))
                                .foregroundColor(Color.secondaryTextColor)
                        }
                        
                        HStack {
                            Image("Right_Yellow")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10.56, height: 10.56)
                            Text("91% Completion")
                                .font(.customfont(.regular, fontSize: 11))
                                .foregroundColor(Color.secondaryTextColor)
                        }
                    }
                }
                
                HStack(spacing: 2) {
                    Text("Limit")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.darkGray)
                    Text("$ 200.00 - $ 1,200.00 ")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                }
                HStack(spacing: 5) {
                    Image("Blue_Line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 4, height: 12)
                    Text("Google Pay(Gpay)")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                    Image("Blue_Line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 4, height: 12)
                    Text("PhonePe")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                    Image("Blue_Line")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 4, height: 12)
                    Text("IMPS")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                }
            }
            .padding([.horizontal, .vertical], 10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primaryButtonColor, lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 10)
        
    }
}

#Preview {
    SearchListUsingPriceBases()
}
