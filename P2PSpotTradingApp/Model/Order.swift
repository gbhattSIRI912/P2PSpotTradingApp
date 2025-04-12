//
//  Order.swift
//  P2PSpotTradingApp
//
//  Created by orange on 20/01/25.
//

import Foundation

struct Order: Identifiable {
    let id = UUID()
    let type: String
    let status: String
    let orderType: String
    let quantity: String
    let price: String
    let orderId: String
    let userName: String
    let amount: String
    let date: String
}
