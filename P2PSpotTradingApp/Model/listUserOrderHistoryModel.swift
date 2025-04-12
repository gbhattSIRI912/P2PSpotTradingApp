//
//  listUserOrderHistoryModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 24/01/25.
//

import Foundation

struct ListUserOrderHistoryModel: Codable {
    let success: Bool?
    let message: String?
    let status: Int?
    let data: listUserOrderHistoryModel?
}

struct listUserOrderHistoryModel: Codable {
    let code: String?
    let message: String?
    let data: [OrderHistoryDataModel]
    let total: Int?
    let success: Bool?
}

struct OrderHistoryDataModel: Codable {
    let orderNumber: String?
    let advNo: String?
    let tradeType: String?
    let asset: String?
    let fiat: String?
    let fiatSymbol: String?
    let amount: String?
    let totalPrice: String?
    let unitPrice: String?
    let orderStatus: String?
    let createTime: Int?
    let commission: String?
    let takerCommissionRate: String?
    let takerCommission: String?
    let takerAmount: String?
    let counterPartNickName: String?
    let payMethodName: String?
    let additionalKycVerify: Int?
    let paymentOption: String?
    //let advertisementRole: String?
    
}

//All Order History
struct AllUserOrderHistoryModel: Codable {
    let success: Bool?
    let message: String?
    let status: Int?
    let data: [UserOrderDataResponse]?
}

struct UserOrderDataResponse: Codable {
    let symbol: String?
    let orderId: Int?
    let price: String?
    let updated_price: String?
    let quantity: String?
    let executedQty: String?
    let totalQuote: String?
    let status: String?
    let orderType: String?
    let side: String?
    let time: String?
    let updateTime: String?
}
