//
//  CreateAdsModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 23/01/25.
//

import Foundation

struct CreateAdsModel: Codable {
    let code: Int?
    let msg: String?
    let data: CreateAdsDataModel?
}

struct CreateAdsDataModel: Codable {
    let adId: String?
    let advertiseType: Int?
    let asset: String?
    let fiat: String?
    let price: String?
    let amount: String?
    let paymentMethods: String?
    let msg: String?
    
}
