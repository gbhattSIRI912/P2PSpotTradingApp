//
//  BaseModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Foundation

// MARK:- Base Modal
struct BaseModel<T:Decodable>: Decodable {
    let jsonArray: [T]?
    let jsonData: T?
    let status: Bool?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case jsonData = "data"
        case status = "success"
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Bool.self, forKey: .status)
        message = try container.decode(String.self, forKey: .message)
        do {
            jsonArray = try container.decode([T].self, forKey: .jsonData)
            jsonData = nil
        } catch DecodingError.typeMismatch {
            jsonArray = []
            jsonData = try container.decode(T.self, forKey: .jsonData)
        }
    }
}

// MARK: - NoDataStruct
struct NoDataStruct: Codable {
    
}


// MARK: - Pagination Model
struct PaginationModel: Codable {
    let from: Int?
    let to: Int?
    let currentPage: Int?
    let lastPage: Int?
    let perPage: Int?
    let total: Int?
    
    enum CodingKeys: String, CodingKey {
        case from, to, total
        case currentPage = "current_page"
        case lastPage = "last_page"
        case perPage = "per_page"
    }
}
