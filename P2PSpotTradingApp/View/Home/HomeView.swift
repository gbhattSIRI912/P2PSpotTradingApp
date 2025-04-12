//
//  HomeView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = "Hot"
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
                .navigationBarBackButtonHidden()
            
            VStack {
                ScrollView {
                    VStack {
                        HStack {
                            Image("BinanceEase")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .screenWidth * 0.23, height: 35)
                            HStack {
                                Image("Search")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Text("Search")
                                    .foregroundColor(Color.greyColor)
                                    .font(.customfont(.regular, fontSize: 12))
                            }
                            .padding(5)
                            .frame(width: .screenWidth * 0.35, alignment: .leading)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.boarderColor, lineWidth: 0.5)
                            }
                            .onTapGesture {
                                router.navigateTo(.searchTextView)
                            }
                            Spacer()
                            HStack(spacing: 8) {
                                Image("ChatCenteredText")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Image("Order_Selected")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                    .onTapGesture {
                                       // router.navigateTo(.portfolio)
                                    }
                                Image("Notification")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                            }
                        }
                        .padding([.horizontal, .vertical])
                        .frame(maxWidth: .infinity, maxHeight: 51)
                        .background(Color.lightGreyColor)
                        .padding(.top, 2)
                        
                        //Balance View
                        BalanceView()
                        //View for shared amount
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0...5, id: \.self) { index in
                                    VStack {
                                        Image("Deposit")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                        Text("Deposit")
                                            .font(.customfont(.regular, fontSize: 12))
                                            .foregroundStyle(Color.secondaryTextColor)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal)
                        }
                        .padding(.top, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(["Favourite", "Hot", "Gainers", "Losers", "New Listing"], id: \.self) { index in
                                    Button(action: {
                                        selectedTab = index
                                    }) {
                                        VStack(spacing: 2) {
                                            Text(index)
                                                .font(.customfont(.regular, fontSize: 14))
                                                .padding(.vertical, 8)
                                                .padding(.horizontal, 16)
                                                .foregroundColor(selectedTab == index ? Color.primaryButtonColor : .gray)
                                            
                                            Divider()
                                                .frame(maxWidth: selectedTab == index ? nil : 0, minHeight: 1 ,maxHeight: 1)
                                                .background(selectedTab == index ? Color.primaryButtonColor : Color.clear)
                                        }
                                    }
                                    .fixedSize(horizontal: true, vertical: false)
                                }
                            }
                        }
                        .padding(.leading, 0)
                        .padding(.top, 10)
                        
                        
                        HStack(spacing: 10) {
                            Text("Name")
                                .foregroundColor(Color.greyColor)
                                .font(.customfont(.regular, fontSize: 12))
                            Spacer()
                            Text("Last Price")
                                .foregroundColor(Color.greyColor)
                                .font(.customfont(.regular, fontSize: 12))
                            
                            Text("24 H changes %")
                                .foregroundColor(Color.greyColor)
                                .font(.customfont(.regular, fontSize: 12))
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 12)
                        VStack {
                            ForEach(0...8, id: \.self) { index in
                                HStack(spacing: 10) {
                                    VStack(alignment: .leading) {
                                        Text("BNB")
                                            .font(.customfont(.medium, fontSize: 14))
                                            .foregroundStyle(Color.secondaryTextColor)
                                        
                                        Text("BNB")
                                            .font(.customfont(.regular, fontSize: 12))
                                            .foregroundStyle(Color.greyColor)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Text("671.72")//(String(format: "%.2f", "671.72"))
                                            .font(.customfont(.medium, fontSize: 14))
                                            .foregroundStyle(Color.secondaryTextColor)
                                        
                                        Text("$ 671.72")//("$\(String(format: "%.2f", "671.72"))")
                                            .font(.customfont(.regular, fontSize: 12))
                                            .foregroundStyle(Color.greenColor)
                                    }
                                    .padding(.trailing, 15)
                                    
                                    Text("+0.75 %")
                                        .font(.customfont(.regular, fontSize: 14))
                                        .foregroundStyle(Color.whiteTextColor)
                                        .padding(8)
                                        .background(Color.green)//(true ? Color.green : Color.red)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 12)
                                .onTapGesture {
                                    router.navigateTo(.detailPricePageView)
                                }
                            }
                        }
                        .padding(.bottom, .bottomInsets + 70)
                    }
                }
                .clipped()
                .safeAreaTopPadding()
            }
        }
    }
}

#Preview {
    HomeView()
}
