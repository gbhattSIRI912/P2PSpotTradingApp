//
//  PTwoPView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct PTwoPView: View {
    @State private var isSelectAds: Bool = false
    @State private var adsTitle: String = "All Ads"
    @State var selectedTab: String = "USDT"
    @EnvironmentObject var pTwopOrderListViewModel: PTwoPOrderListViewModel
    @State var selectedOption: String = "15"
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Color.whiteTextColor
                .ignoresSafeArea(edges: .top)
                .onAppear {
                    userDefaultData.pageCountForPTwoP.saveDefaultValue(1)
                    if pTwopOrderListViewModel.isUnauthorized == true {
                        router.navigateTo(.loginView)
                    }
                    pTwopOrderListViewModel.loadApiPTwoPOrderList(page: userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0, rows: Int(selectedOption) ?? 0, asset: selectedTab, fiat: "USD")
                }

            VStack(alignment: .leading, spacing: 0) {
                // Header Section
                HStack {
                    Text("P2P")
                        .foregroundStyle(Color.heading_Black_TextColor)
                        .font(.customfont(.bold, fontSize: 24))
                        .padding([.leading, .bottom], 10)
                }
                .frame(height: 50)
                .padding(.horizontal)
                .padding(.top, .topInsets)

                // Scrollable Content
                ScrollView {
                    // Top View with Ads Title
                    TopViewOrderView(title: adsTitle, isSelectAds: $isSelectAds, didTap: {
                        pTwopOrderListViewModel.loadApiPTwoPOrderList(page: userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0, rows: Int(selectedOption) ?? 0, asset: selectedTab, fiat: "USD")
                    })
                        .padding(.top, 10)

                    ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 16) {
                                   ForEach(["USDT", "BTC", "BNB", "ETH", "ADA", "TRX", "BUSI"], id: \.self) { item in
                                       HorizontalTabBarView(
                                           item: item,
                                           isSelected: selectedTab == item,
                                           onTap: {
                                               selectedTab = item
                                               pTwopOrderListViewModel.loadApiPTwoPOrderList(page: userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0, rows: selectedOption == "All" ? 20 : Int(selectedOption) ?? 0, asset: selectedTab, fiat: "USD")
                                           }
                                       )
                                   }
                               }
                               .padding(.horizontal)
                           }

                    ProgressBarView(
                        greenPercentage: CGFloat(Double(pTwopOrderListViewModel.p2pList?.buyPercentageRounded ?? "0") ?? 0),
                        redPercentage: CGFloat(Double(pTwopOrderListViewModel.p2pList?.sellPercentageRounded ?? "0") ?? 0)
                    )

                        .frame(height: 10)
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 24)

                    // Selling Price Top View
                    HStack {
                        PriceSelectorView(bestSellPrice: pTwopOrderListViewModel.p2pList?.best_sell_price ?? "", bestBuyPrice: pTwopOrderListViewModel.p2pList?.best_buy_price ?? "")
                        Spacer()
                        
                        HStack(spacing: 8) {
                            ForEach(["All", "5", "10", "15", "20"], id: \.self) { option in
                                Button(action: {
                                    selectedOption = option
                                    pTwopOrderListViewModel.loadApiPTwoPOrderList(page: userDefaultData.pageCountForPTwoP.getDefaultValue() as? Int ?? 0, rows: selectedOption == "All" ? 20 : Int(selectedOption) ?? 0, asset: selectedTab, fiat: "USD")
                                }) {
                                    Text(option)
                                        .font(.customfont(.regular, fontSize: 10))
                                        .foregroundColor(Color.secondaryTextColor)
                                        .frame(width: 26, height: 20)
                                        .foregroundColor(selectedOption == option ? Color.whiteTextColor : Color.secondaryTextColor)
                                        .cornerRadius(5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(selectedOption == option ? Color.secondaryTextColor : Color.clear, lineWidth: 1))
                                }
                            }
                        }
                        .padding(.trailing, 10)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 8)
                    .background(Color.lightGreyColor)
                    .cornerRadius(8)

                    // Price List View
                    PriceListView(orderList: pTwopOrderListViewModel.p2pList?.orders ?? [], selectedTab: selectedTab, parentView: self)
                        .padding(.top, 10)
                        .padding(.bottom, .bottomInsets + 30)
                }
            }
            
            if pTwopOrderListViewModel.isLoading == true {
                CircleLoader()
            }
        }
        // Use .sheet instead of .fullScreenCover
        .fullScreenCover(isPresented: $isSelectAds, content: {
            viewOrderListView(isHidePopUpView: $isSelectAds, viewAds: $adsTitle)
                .background(AlmostTransparentDialogView())
                .transition(.move(edge: .bottom))
                .ignoresSafeArea()
        })
    }
}



#Preview {
    PTwoPView()
}
