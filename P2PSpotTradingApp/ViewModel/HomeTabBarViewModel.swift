//
//  HomeTabBarViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Foundation
import CryptoKit


class HomeViewModel: ObservableObject {
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
}
