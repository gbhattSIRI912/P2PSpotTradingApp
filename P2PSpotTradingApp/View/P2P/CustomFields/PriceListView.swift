//
//  PriceListView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import SwiftUI

struct PriceListView: View {
    var orderList: [BuyOrdersModel]
    var selectedTab: String
    var parentView: PTwoPView?
    var body: some View {
        VStack {
            HStack {
                Text("Fiat Price (SAR)")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.secondaryTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("No. of Ads")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.secondaryTextColor)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("Amount (\(selectedTab))")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.secondaryTextColor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)

            ForEach(orderList.indices, id: \.self) { item in
                HStack {
                    Text(orderList[item].tradableQuantity ?? "")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(orderList[item].tradeType == "SELL" ? Color.textRedColor : Color.greenColor)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("\(orderList[item].total_ads ?? 0)")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text(orderList[item].price ?? "")
                        .font(.customfont(.regular, fontSize: 11))
                        .foregroundStyle(Color.secondaryTextColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.top, 5)
                .onAppear {
                    if ((item == (orderList.count - 1)) && (orderList.count < (orderList.count + 1))) {
                        userDefaultData.pageCountForPTwoP.saveDefaultValue(((userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0) + 1))
                        parentView?.pTwopOrderListViewModel.loadApiPTwoPOrderList(page: userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0, rows: parentView?.selectedOption == "All" ? 20 : Int(parentView?.selectedOption ?? "") ?? 0, asset: selectedTab, fiat: "USD")
                        print(userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0)
                    }
                }
            }
        }
        .padding(.bottom, 20)

    }
}
