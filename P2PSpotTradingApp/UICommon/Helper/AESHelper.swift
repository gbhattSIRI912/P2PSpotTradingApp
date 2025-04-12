//
//  AESHelper.swift
//  P2PSpotTradingApp
//
//  Created by orange on 21/02/25.
//

import Foundation
import CryptoKit

struct AESHelper {
    static let key = SymmetricKey(size: .bits256) // Secure 256-bit key

    static func encrypt(_ text: String) -> String? {
        guard let data = text.data(using: .utf8) else { return nil }
        let sealedBox = try? AES.GCM.seal(data, using: key)
        return sealedBox?.combined?.base64EncodedString()
    }

    static func decrypt(_ encryptedText: String) -> String? {
        guard let data = Data(base64Encoded: encryptedText),
              let sealedBox = try? AES.GCM.SealedBox(combined: data),
              let decryptedData = try? AES.GCM.open(sealedBox, using: key) else { return nil }
        return String(data: decryptedData, encoding: .utf8)
    }
}

