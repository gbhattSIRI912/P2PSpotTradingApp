//
//  P2PSpotTradingAppApp.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import SwiftUI

@main
struct P2PSpotTradingAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var acountViewModel:AccountViewModel = AccountViewModel()
    var createAdsViewModel:CreateAdsViewModel = CreateAdsViewModel()
    var listUserOrderHistoryViewModel: ListUserOrderHistoryViewModel = ListUserOrderHistoryViewModel()
    var updateAdsViewModel:UpdateAdsViewModel = UpdateAdsViewModel()
    var ptwopOrderviewModel: PTwoPOrderListViewModel = PTwoPOrderListViewModel()
    var body: some Scene {
        WindowGroup {
            RouterView {
                LoginView()
            }
            .environmentObject(acountViewModel)
            .environmentObject(createAdsViewModel)
            .environmentObject(listUserOrderHistoryViewModel)
            .environmentObject(updateAdsViewModel)
            .environmentObject(ptwopOrderviewModel)
            
            
        }
    }
}
