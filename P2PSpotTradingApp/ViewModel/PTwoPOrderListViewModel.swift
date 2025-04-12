//
//  PTwoPOrderListViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 05/02/25.
//

import Foundation
import PKHUD

class PTwoPOrderListViewModel: ObservableObject {
    @Published var p2pList: PTwoPOrderDataModel?
    @Published var isUnauthorized: Bool?
    @Published var isLoading: Bool = true
    
    func loadApiPTwoPOrderList(page: Int, rows: Int, asset: String, fiat: String) {
        //HUD.show(.progress)
        isLoading = true
        register(target: AuthManagerProvider.listOfPTwoP(page: page, rows: rows, asset: asset, fiat: fiat)) { response, error in
            HUD.hide()
            if let error = error {
                HUD.flash(.label(error.localizedDescription), delay: 1)
            } else {
                if response != nil {
                    do {
                        let success = try JSONDecoder().decode(PTwoPModel.self, from: response!)
                        if success.status == 200 {
                            self.p2pList = success.data
                        } else if success.status == 401 {
                            HUD.flash(.label("\(success.message ?? "")"), delay: 1)
                            self.isUnauthorized = true
                        } else {
                            HUD.flash(.label("\(success.message ?? "")"), delay: 1)
                        }
                        self.isLoading = false
                    } catch let decodingError {
                        HUD.flash(.label("\(decodingError)"), delay: 1)
                        print(decodingError)
                    }
                }
            }
        }
    }
}
