//
//  ApisConstant.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Foundation

//MARK: For DEMO URL
let developmentUrl =  "https://demo59.ciadmin.in/api/"//"https://api.binance.com/" //DEMO URL
let imageUrl = "http://demo2.1hour.in" // DEMO URL
let BaseURL = developmentUrl //DEMO URL

//MARK: For UAT
//let developmentUrl = "https://demo8.1hour.in/api/v1/" //UAT URL
//let BaseURL = developmentUrl //UAT URL
//let imageUrl = "http://demo8.1hour.in" // UAT URL

enum Apis {
    static let kk_login = "login"
    static let kk_account =  "portfolio-summary"//"binance/balance"
    static let kk_listP2p = "binance/ads"
    static let kk_createAds = "sapi/v1/c2c/ads/create"
    static let kk_listOrderHistory = "binance/c2c-orders"
    static let kk_update = "sapi/v1/c2c/ads/update"
    static let kk_allOrders = "binance/all-orders"
}
