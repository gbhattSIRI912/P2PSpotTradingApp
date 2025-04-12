//
//  AccountModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 31/01/25.
//

import Foundation

struct AccountBalanceModel: Codable {
    let success: Bool?
    let data: AccountModel?
    let message: String?
    let status: Int?
}

struct AccountModel: Codable {
    let total_balance_usdt: String?
    let total_gain_usdt: String?
    let total_gain_percentage: String?
    let total_investment: String?
    let balances: [Balance]?
}

// MARK: - Balance
struct Balance: Codable {
    let asset: String?
    let free: String?
    let locked: String?
}

// MARK: - CommissionRates
struct CommissionRates: Codable {
    let maker: String?
    let taker: String?
    let buyer: String?
    let seller: String
}
