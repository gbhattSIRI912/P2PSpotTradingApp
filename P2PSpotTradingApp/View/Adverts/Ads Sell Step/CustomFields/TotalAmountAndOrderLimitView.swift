//
//  TotalAmountAndOrderLimitView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI

struct TotalAmountAndOrderLimitView: View {
    @State private var amount: String = ""
    @State private var txtOrderLimitstart: String = "500.00"
    @State private var txtOrderLimitEnd: String = "1,500.00"

    var body: some View {
        VStack {
            TotalAmountCustomView(title: "Total Amount", amount: $amount, currencyType: "BTC")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Order Limit")
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.secondaryTextColor)
                HStack {
                    HStack {
//                        Text("500.00")
                        TextField("", text: $txtOrderLimitstart)
                            .keyboardType(.numberPad)
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.leading, 10)
                        Spacer()
                        Text("USD")
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.trailing, 10)
                    }
                    .frame(maxWidth: .screenWidth * 0.41, minHeight: 40, maxHeight: 40)
                    .background(Color.lightGreyColor)
                    .cornerRadius(8)
                    
                    Text("To")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(Color.secondaryTextColor)
                    
                    HStack {
                        //Text("1,500.00")
                        TextField("", text: $txtOrderLimitEnd)
                            .keyboardType(.numberPad)
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.leading, 10)
                        Spacer()
                        Text("USD")
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.trailing, 10)
                    }
                    .frame(maxWidth: .screenWidth * 0.41, minHeight: 40, maxHeight: 40)
                    .background(Color.lightGreyColor)
                    .cornerRadius(8)
                    
                }
            }
        }
    }
}

#Preview {
    TotalAmountAndOrderLimitView()
}

struct TotalAmountCustomView: View {
    var title: String
    @Binding var amount: String
    var currencyType: String
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.customfont(.regular, fontSize: 14))
                    .foregroundColor(Color.secondaryTextColor)
                
                HStack {
                    /*Text(amount)
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(Color.secondaryTextColor)
                        .padding(.leading, 10)*/
                    TextField("", text: $amount)
                        .keyboardType(.numberPad)
                            .font(.customfont(.regular, fontSize: 14))
                            .foregroundColor(Color.secondaryTextColor)
                            .padding(.leading, 10)
                    Spacer()
                    Text(currencyType)
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(Color.secondaryTextColor)
                        .padding(.trailing, 10)
                }
                .frame(maxWidth: .infinity,minHeight: 40, maxHeight: 40)
                .background(Color.lightGreyColor)
                .cornerRadius(8)
                
                
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}
