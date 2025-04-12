//
//  viewOrderListView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct viewOrderListView: View {
    @Binding var isHidePopUpView: Bool
    @State private var selectedIndex: Int = 0
    @Binding var viewAds: String
    @State private var arrOrder: [String] = ["All Ads", "Fiat Ads", "Token Ads", "Token Ads", "Token Ads", "Token Ads"]
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.black)
                .opacity(0.5)
            VStack {
                HStack {
                    Text("View Orders")
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
                    ForEach(arrOrder.indices, id: \.self) { item in
                        Text(arrOrder[item])
                            .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                            .background(selectedIndex == item ? Color.lightGreyColor : Color.whiteTextColor)
                            .cornerRadius(8)
                            .padding(.horizontal, 24)
                            .onTapGesture {
                                viewAds = arrOrder[item]
                                selectedIndex = item
                                isHidePopUpView = false
                                
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
    viewOrderListView(isHidePopUpView: .constant(true), viewAds: .constant(""))
}
