//
//  DetailPriceView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 14/01/25.
//

import SwiftUI
import Charts

struct DetailPriceView: View {
    @EnvironmentObject var router: Router
    @State private var selectedTab = "Price"
    let tabs = ["Price", "Info", "Trading Data", "Square"]
    let newTabs = ["Order Book", "Trades"]
    @State private var selectedOrder = "Order Book"
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.whiteTextColor
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Button {
                            router.navigateBack()
                        } label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .tint(Color.secondaryTextColor)
                        }
                        
                        Text("BNB/USDT")
                            .foregroundStyle(Color.secondaryTextColor)
                            .font(.customfont(.medium, fontSize: 18))
                    }
                    Spacer()
                    HStack(spacing: 14) {
                        Button {
                            
                        } label: {
                            Image("BookmarkSimple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("ShareNetwork")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
                .padding([.leading, .trailing], 10)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        // Header Tabs
                        HStack(spacing: 15) {
                            ForEach(tabs, id: \.self) { tab in
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(tab)
                                        .font(.customfont(.medium, fontSize: 12))
                                        .foregroundColor(selectedTab == tab ? Color.primaryButtonColor : Color.secondaryTextColor)
                                    
                                    Divider()
                                        .frame(maxWidth: selectedTab == tab ? nil : 0, minHeight: 1 ,maxHeight: 1)
                                        .background(selectedTab == tab ? Color.primaryButtonColor : Color.clear)
                                }
                                .fixedSize(horizontal: true, vertical: false)
                                .onTapGesture {
                                    selectedTab = tab
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.horizontal, 20)
                        switch selectedTab {
                        case "Price":
                            TradingScreenView(parentView: self)
                            
                            //Other Tab and Data
                            HStack(spacing: 10) {
                                ForEach(newTabs, id: \.self) { tab in
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(tab)
                                            .font(.customfont(.regular, fontSize: 12))
                                            .foregroundColor(selectedOrder == tab ? Color.primaryButtonColor : Color.secondaryTextColor)
                                        
                                        Divider()
                                            .frame(maxWidth: selectedOrder == tab ? nil : 0, minHeight: 1 ,maxHeight: 1)
                                            .background(selectedOrder == tab ? Color.primaryButtonColor : Color.clear)
                                    }
                                    .fixedSize(horizontal: true, vertical: false)
                                    .onTapGesture {
                                        selectedOrder = tab
                                    }
                                }
                            }
                            
                            //Progress view
                            ProgressBarView(greenPercentage: 49.32, redPercentage: 50.68)
                                .frame(maxWidth: .infinity,maxHeight: 10)
                                .padding([.top, .bottom], 15)
                                .padding([.leading, .trailing], 10)
                            
                            OrderBookView()
                                .padding(.top, 10)
                                .padding(.bottom, .bottomInsets + 45)
                          
                        default:
                            BNBInfoView()
                        }
                       
                    }
                    .padding(.horizontal)
                }
                HStack {
                    HStack {
                        FooterTabButton(iconName: "More", label: "More") {
                            
                        }
                        FooterTabButton(iconName: "Margin", label: "Margin") {
                            
                        }
                        FooterTabButton(iconName: "ChartLine", label: "Grid") {
                            
                        }
                        Spacer()
                        HStack {
                            CustomButtonView(title: "Buy", didTap: {
                                
                            }, forgroundColor: Color.whiteTextColor, backgroundColor: Color.greenColor, maxWidth: 80)
                            CustomButtonView(title: "Sell", didTap: {
                                
                            }, forgroundColor: Color.whiteTextColor, backgroundColor: Color.textRedColor, maxWidth: 80)
                        }
                        
                    }
                    .padding([.leading, .trailing], 24)
                    .padding([.top, .bottom], 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
           
        }
    }
}

#Preview {
    DetailPriceView()
}
