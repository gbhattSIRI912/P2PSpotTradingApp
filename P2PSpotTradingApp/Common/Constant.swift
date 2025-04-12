//
//  Constant.swift
//  P2PSpotTradingApp
//
//  Created by orange on 08/01/25.
//

import Foundation
import CryptoKit

let api_Key = "qVztR5QYHiRsT9TAHmc25AtHnaOvoM5KLVGY9KNWPidyg77K70eKdUx56gXKcTMe"
let secretKey = "jXdQIZPOZry1ZPfM57n2bXC1JmiJ7ZK6YyTlOpCBkSyhO3wTht1xNXBaKVVmxnLH"

enum Globalvariable {
    static let environment = "TEST"
}

// MARK:- UserDefaultsEnum
enum userDefaultData: String {
    case id = "id"
    case token = "Token"
    case guestToken = "GuestToken"
    case login = "isLogin"
    case userType = "UserType"
    case appKey = "appKey"
    case secretKey = "secretKey"
    case sessionExpire = "sessionExpire"
    case pageCountForPTwoP = "pageCountForPTwoP"
    
    func saveDefaultValue<T: Equatable>(_ value: T) {
        UserDefaults.standard.set(value, forKey: self.rawValue)
    }
    
    func getDefaultValue() -> Any {
        if let value = UserDefaults.standard.object(forKey: self.rawValue) { return value } else { return "" }
        
    }
    
    func getArrayValue() -> [Any] {
        if let value = UserDefaults.standard.array(forKey: self.rawValue) { return value} else {return [Any]()}
    }
    
    func deleteValue() {
        UserDefaults.standard.removeObject(forKey: self.rawValue)
    }
}


//MARK: - Custom Function 
// Genrate Binance Signature
func generateBinanceSignature(queryString: String, secretKey: String) -> String {
    let key = SymmetricKey(data: Data(secretKey.utf8))
    let signature = HMAC<SHA256>.authenticationCode(for: Data(queryString.utf8), using: key)
    return signature.map { String(format: "%02x", $0) }.joined()
}

// Create Binance Request Url
func createBinanceRequestURL(urlString: String) -> String {
    let timestamp = Int(Date().timeIntervalSince1970 * 1000)
    let queryString = "timestamp=\(timestamp)"
    let secretKey = secretKey
    let signature = generateBinanceSignature(queryString: queryString, secretKey: secretKey)
    
    return "\(urlString)?\(queryString)&signature=\(signature)"
}

// Convert TimeStamp to Date & Time Formate
func convertTimestampToDate(timestamp: Double, format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone = .current) -> String {
    // Convert the timestamp from milliseconds to seconds
    let date = Date(timeIntervalSince1970: timestamp / 1000)
    
    // Create and configure the DateFormatter
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.timeZone = timeZone
    
    // Convert the Date to a formatted string
    return dateFormatter.string(from: date)
}

func formatDateString(_ dateString: String) -> String? {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    inputFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Adjust if needed
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        outputFormatter.timeZone = TimeZone.current
        return outputFormatter.string(from: date)
    }
    
    return nil
}
