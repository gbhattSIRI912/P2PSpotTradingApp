//
//  ListUserOrderHistoryViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 24/01/25.
//

import Foundation
import PKHUD

class ListUserOrderHistoryViewModel: ObservableObject {
    @Published var orderHistory: [OrderHistoryDataModel]?
    @Published var unauthorizedUser: Int?
    @Published var allOrderHistory: [UserOrderDataResponse]?
    @Published var isLoading: Bool = true
    func loadApiListUserOrderHistory() {
        register(target: AuthManagerProvider.listUserOrderHistory) { response, error in
            if let error = error {
                HUD.flash(.label(error.localizedDescription), delay: 1)
                
            } else {
                if response != nil {
                    do {
                        let success = try JSONDecoder().decode(ListUserOrderHistoryModel.self, from: response!)
                        if success.status == 200 {
                            self.orderHistory = success.data?.data
                        } else if success.status == 401 {
                            self.unauthorizedUser = success.status ?? 0
                        } else {
                            HUD.flash(.label("\(success.message ?? "")"), delay: 1)
                        }
                    } catch let decodingError {
                        HUD.flash(.label("\(decodingError)"), delay: 1)
                        print(decodingError)
                    }
                }
            }
        }
    }
    
    //load Api Order history
    func loadApiAllOrderHistory() {
//        HUD.show(.progress)
        self.isLoading = true
        register(target: AuthManagerProvider.allOrderHistory) { response, error in
            HUD.hide()
            if let error = error {
                HUD.flash(.label(error.localizedDescription), delay: 1)
            } else {
                if response != nil {
                    do {
                        let success = try JSONDecoder().decode(AllUserOrderHistoryModel.self, from: response!)
                        if success.status == 200 {
                            self.allOrderHistory = success.data
                        } else if success.status == 401 {
                            self.unauthorizedUser = success.status ?? 0
                            print("Staus code: >>>>>\(success.status ?? 0)")
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


