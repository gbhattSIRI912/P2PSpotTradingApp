//
//  AutomaticSpotTradingView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct AutomaticSpotTradingView: View {
    @State private var isSelectedToggle: Bool = false
    @State private var isSelectOption = Array(repeating: false, count: 3)
    @State private var txtAmount: String = "40000"
    var body: some View {
        ZStack {
            Color.whiteTextColor
                .navigationBarBackButtonHidden()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: 0)
                    .background(Color.whiteTextColor)
                    .safeAreaTopPadding()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Automatic Spot Trading")
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundStyle(Color.secondaryTextColor)
                            .padding(.horizontal)
                        HStack {
                            Text("Enable Automatic Spot Trading After P2P Transactions")
                                .font(.customfont(.regular, fontSize: 16))
                                .foregroundColor(Color.secondaryTextColor)
                            Spacer()
                            HStack(spacing: 10) {
                                Toggle(isOn: $isSelectedToggle) {
                                    
                                }
                                .toggleStyle(SwitchToggleStyle(tint: .green))
                                .frame(width: 24, height: 24)
                                Text(isSelectedToggle ? "ON" : "OFF")
                                    .font(.customfont(.regular, fontSize: 16))
                                    .foregroundColor(Color.secondaryTextColor)
                                    .padding(.leading, 12)
                            }
                            .padding(.trailing, 24)
                            .padding(.leading, 5)
                        }
                        .padding(.horizontal)
                        
                        Text("Sell BTC for USD")
                            .font(.customfont(.regular, fontSize: 16))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.horizontal)
                            .padding(.top, 30)
                        
                        ForEach(0...1, id: \.self) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(isSelectOption[item] ? "tick-circle" : "Untick-circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16, alignment: .leading)
                                    Text("Option \(item + 1)")
                                        .font(.customfont(.regular, fontSize: 16))
                                        .foregroundStyle(Color.secondaryTextColor)
                                }
                                .padding(.leading, 10)
                                TotalAmountCustomView(title: "Buy.", amount: $txtAmount, currencyType: "BTC")
                                    .padding(.top, 10)
                                TotalAmountCustomView(title: "Using ( include transaction fees)", amount: $txtAmount, currencyType: "BTC")
                                    .padding(.top, 10)
                                    .padding(.bottom, 10)
                                
                            }
                            .padding([.horizontal, .vertical], 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.primaryButtonColor, lineWidth: 0.5)
                            )
                            .padding(.horizontal)
                            .padding(.top, 20)
                            .onTapGesture {
                                isSelectOption[item].toggle()
                            }
                        }
                        
                        TotalAmountCustomView(title: "Fiat/USDT Conversion Rate", amount: $txtAmount, currencyType: "BTC")
                            .padding(.top, .topInsets + 10)
                        
                        CustomButtonView(title: "Save Settings", didTap: {
                            
                        }, maxWidth: .infinity)
                        .padding(.horizontal)
                        .padding(.top, .topInsets + 40)
                        .padding(.bottom, .bottomInsets + 30)
                    }
                }
                .padding(.bottom, .bottomInsets + 50)
                .clipped()
            }
        }
    }
}

#Preview {
    AutomaticSpotTradingView()
}
