//
//  ListOfAdsView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct ListOfAdsView: View {
    @Binding var isSwitchOn: Bool
    @Binding var isSelectMoreAction: Bool
    var editAction: () -> Void
    var deleteAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            HStack {
                HStack(spacing: 5) {
                    Text("Buy BTC with USD")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.secondaryTextColor)
                    Image("Right_Yellow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13, height: 13)
                }
                Spacer()
                HStack {
                    HStack(spacing: 10) {
                        Button(action: {
                            deleteAction()
                        }, label: {
                            Image("Trash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                        })
                        .frame(width: 16, height: 16, alignment: .trailing)

                        Button(action: {
                            editAction()
                        }, label: {
                            Image("Edit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                        })
                        .frame(width: 16, height: 16, alignment: .trailing)
                    }

                    // Toggle with fixed size
                    Toggle(isOn: $isSwitchOn) {}
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                        .frame(width: 24, height: 24)
                        .padding(.leading)
                        
                }
                .padding(.trailing)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("$ 90.22")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundStyle(Color.secondaryTextColor)
                HStack(spacing: 2) {
                    Text("Crypto Amount")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.darkGray)
                    Text("48.78 BTC")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
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
                
                HStack {
                    HStack(spacing: 2) {
                        Text("Posted On")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundStyle(Color.darkGray)
                        Text("2023-11-04  11:57:04")
                            .font(.customfont(.regular, fontSize: 11))
                            .foregroundStyle(Color.secondaryTextColor)
                    }
                    Spacer()
                    Button(action: {
                        isSelectMoreAction =  true
                    }, label: {
                        Image("DotsThreeOutlineVertical")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    })
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .padding(.bottom, 10)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.heading_Black_TextColor, lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

#Preview {
    ListOfAdsView(isSwitchOn: .constant(true), isSelectMoreAction: .constant(true), editAction: {
        
    }, deleteAction: {
        
    })
}
