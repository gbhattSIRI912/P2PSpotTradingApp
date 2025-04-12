//
//  MainTabView.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeVM = HomeViewModel.shared

    var body: some View {
        ZStack {
            // Main Views for Each Tab
            Group {
                switch homeVM.selectTab {
                case 0:
                    PortfolioView()
                case 1:
                    PTwoPView()
                case 2:
                    AdsBuyView()
                case 3:
                    OrderListingView()
                default:
                    AutomaticSpotTradingView()
                
                }
                /*if homeVM.selectTab == 0 {
                    PortfolioView()
                } else if homeVM.selectTab == 1 {
                    PTwoPView()
                } else if homeVM.selectTab == 2 {
                    AdsBuyView()
                } else if homeVM.selectTab == 3 {
                    OrderListingView()
                } else if homeVM.selectTab == 4 {
                    AutomaticSpotTradingView()
                }*/
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // Custom Bottom Tab Bar
            VStack {
                Spacer()
                HStack {
                    TabButton(title: "Home", icon: homeVM.selectTab == 0 ? "home_Selected" : "Home_Unselected", isSelect: homeVM.selectTab == 0
                    ) {
                        withAnimation {
                            homeVM.selectTab = 0
                        }
                    }

                    TabButton(title: "P2P", icon: homeVM.selectTab == 1 ? "User_selected" : "Users_Unselected", isSelect: homeVM.selectTab == 1
                    ) {
                        withAnimation {
                            homeVM.selectTab = 1
                        }
                    }

                    TabButton(title: "Adverts",
                        icon: homeVM.selectTab == 2 ? "Advert_Selected" : "Adverts_Unselected", isSelect: homeVM.selectTab == 2
                    ) {
                        withAnimation {
                            homeVM.selectTab = 2
                        }
                    }

                    TabButton(
                        title: "Orders", icon: homeVM.selectTab == 3 ? "Order_Selected" : "Order_Unselected", isSelect: homeVM.selectTab == 3
                    ) {
                        withAnimation {
                            homeVM.selectTab = 3
                        }
                    }

                    TabButton(
                        title: "Auto Spot", icon: homeVM.selectTab == 4 ? "AutoSpot_Selected" : "AutoSpot_Unselected", isSelect: homeVM.selectTab == 4
                    ) {
                        
                        withAnimation {
                            homeVM.selectTab = 4
                        }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 10)
                .padding(.bottom, 18)
                .padding([.horizontal], 10)
                .background(Color.black)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}



#Preview {
    MainTabView()
}
