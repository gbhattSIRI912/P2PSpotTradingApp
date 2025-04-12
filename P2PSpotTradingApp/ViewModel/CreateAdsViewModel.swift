//
//  CreateAdsViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 23/01/25.
//

import Foundation
import PKHUD

class CreateAdsViewModel: ObservableObject {
    
    func loadApiCreateAds(advertiseType: String, asset: String, fiat: String, price: String, amount: String, paymentMethods: String, msg: String) {
        register(target: AuthManagerProvider.creatingAds(advertiseType: advertiseType, asset: asset, fiat: fiat, price: price, amount: amount, paymentMethods: paymentMethods, msg: msg)) { response, error in
            if let error = error {
                HUD.flash(.label(error.localizedDescription), delay: 1)
            
            } else {
                if response != nil {
                    do {
                        let success = try JSONDecoder().decode(CreateAdsModel.self, from: response!)
                        if success.code == 200 {
                            print("response>>>>\(String(describing: success.data))")
                        } else if success.code == 401 {
                            
                        }
                    } catch let decodingError {
                        HUD.flash(.label("\(decodingError)"), delay: 1)
                    }
                }
            }
        }
    }
}
