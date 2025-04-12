//
//  LoginModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 22/01/25.
//

import Foundation

struct LoginModels: Codable {
    let success: Bool?
    let data: UserDataDetails?
    let message: String?
    let status: Int?
}

struct UserDataDetails: Codable {
    let token: String?
    let user: UserDetailsModel?
}

struct UserDetailsModel: Codable {
    let id: Int?
    let name: String?
    let email: String?
    let api_key: String?
    let email_verified_at: String?
    let created_at: String?
    let updated_at: String?
}
