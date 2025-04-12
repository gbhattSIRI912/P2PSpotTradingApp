//
//  UpdateCommonCommisionRateModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 28/01/25.
//

import Foundation

struct UpdateCommonCommisionRateModel: Codable {
    let code: String?
    let data: DataModeltModel?
    let message: String?
    let success: Bool?
}

struct DataModeltModel: Codable {
    let assetRetList: [AssetRetListModel]?
    let userDiscountOffRateMaker: Int?
    let userDiscountOffRateTaker: Int?
    let userLevel: Int?
}

struct AssetRetListModel: Codable {
    let asset: String?
    let assetLogoUrl: String?
    let assetName: String?
    let items: [AssetRetItemListModel]?
}

struct AssetRetItemListModel: Codable {
    let area: String?
    let channel: String?
    let fiat: String?
    let makerBuyBaseCommissionRate: String?
    let makerBuyCommissionRate : String?
    let makerSellBaseCommissionRate : String?
    let makerSellCommissionRate : String?
    let takerBuyBaseCommissionRate : String?
    let takerBuyCommissionRate : String?
    let takerSellBaseCommissionRate : String?
    let takerSellCommissionRate : String?
}
