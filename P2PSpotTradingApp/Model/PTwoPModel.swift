//
//  PTwoPModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 05/02/25.
//

import Foundation

struct PTwoPModel: Codable {
    let success: Bool?
    let data: PTwoPOrderDataModel?
    let message: String?
    let status: Int?
}

struct PTwoPOrderDataModel: Codable {
    let buyPercentage: String?
    let sellPercentage: String?
    let buyPercentageRounded: String?
    let sellPercentageRounded: String?
    let orders: [BuyOrdersModel]?
    let best_buy_price: String?
    let best_sell_price: String?
}

struct BuyOrdersModel: Codable {
    let price: String?
    let asset: String?
    let fiat: String?
    let tradeType: String?
    let total_ads: Int?
    let tradableQuantity: String?
}
