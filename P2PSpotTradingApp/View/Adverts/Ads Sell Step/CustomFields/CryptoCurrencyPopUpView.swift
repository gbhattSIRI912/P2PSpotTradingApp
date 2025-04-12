//
//  CryptoCurrencyPopUpView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 09/01/25.
//

import SwiftUI

struct CryptoCurrencyPopUpView: View {
    var title: String = ""
    @Binding var isHidePopUpView: Bool
    @State private var selectedIndex: Int = 0
    @Binding var viewAds: String
    var arrOrderList: [String] = []
    var isComming: String
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .opacity(0.5)
            VStack {
                HStack {
                    Text(title)
                        .font(.customfont(.bold, fontSize: 24))
                        .foregroundStyle(Color.secondaryTextColor)
                    Spacer()
                    Button(action: {
                        isHidePopUpView = false
                    }, label: {
                        Image("Cancel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    })
                }
                .padding(.horizontal, 24)
                .padding([.top, .bottom], 10)
                
                ScrollView {
                    ForEach(arrOrderList.indices, id: \.self) { item in
                        if isComming == "Crypto Currency" {
                            Text(arrOrderList[item])
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundStyle(Color.secondaryTextColor)
                                .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                                .onTapGesture {
                                    viewAds = arrOrderList[item]
                                    selectedIndex = item
                                    isHidePopUpView = false
                                }
                        } else {
                            Text(arrOrderList[item])
                                .font(.customfont(.regular, fontSize: 14))
                                .foregroundStyle(Color.secondaryTextColor)
                                .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45, alignment: .leading)
                                .padding(.horizontal, 5)
                                .background(selectedIndex == item ? Color.lightGreyColor : Color.whiteTextColor)
                                .cornerRadius(8)
                                .padding(.horizontal, 24)
                                .onTapGesture {
                                    viewAds = arrOrderList[item]
                                    selectedIndex = item
                                    isHidePopUpView = false
                                }
                        }
                        
                    }
                }
                .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            .background(Color.whiteTextColor)
            .cornerRadius(24)
            .shadow(radius: 10)
            
        }
        .background(AlmostTransparentDialogView())
        .transition(.move(edge: .bottom))
        .ignoresSafeArea()
    }
}

#Preview {
    CryptoCurrencyPopUpView(isHidePopUpView: .constant(false), viewAds: .constant(""), isComming: "")
}
