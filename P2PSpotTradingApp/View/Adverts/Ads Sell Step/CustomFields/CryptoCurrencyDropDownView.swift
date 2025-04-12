//
//  CryptoCurrencyDropDownView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI

struct CryptoCurrencyDropDownView: View {
    @State private var selectedSegment: String = "Floating"
    var didTapCryptoCurrency: (()->())
    var didTapTradeCurrency: (()->())
    var cryptoCurrency_Title: String
    var tradeCurrency: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Crypto Currency/Asset")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.secondaryTextColor)
                Button(action: {
                    didTapCryptoCurrency()
                }, label: {
                    HStack {
                        Text(cryptoCurrency_Title)
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.leading, 10)
                        Spacer()
                        Image("bottom_DropDown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 20)
                            .padding(.trailing, 10)
                    }
                    .frame(maxWidth: .infinity,minHeight: 40, maxHeight: 40)
                    .background(Color.lightGreyColor)
                    .cornerRadius(8)
                })
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Trade Currency/Fiat")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.secondaryTextColor)
                Button(action: {
                    didTapTradeCurrency()
                }, label: {
                    HStack {
                        Text(tradeCurrency)
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.leading, 10)
                        Spacer()
                        Image("bottom_DropDown")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 20)
                            .padding(.trailing, 10)
                    }
                    .frame(maxWidth: .infinity,minHeight: 40, maxHeight: 40)
                    .background(Color.lightGreyColor)
                    .cornerRadius(8)
                })
                
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

#Preview {
    CryptoCurrencyDropDownView(didTapCryptoCurrency: {
        print("didTapCryptoCurrency")
    }, didTapTradeCurrency: {
        print("didTapTradeCurrency")
    }, cryptoCurrency_Title: "", tradeCurrency: "")
}
