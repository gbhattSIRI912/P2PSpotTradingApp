//
//  LoginViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 22/01/25.
//

import Foundation
import PKHUD

class AccountViewModel: ObservableObject {
    @Published var total_balance_usdt: String?
    @Published var total_gain_usdt: String?
    @Published var total_gain_percentage: String?
    @Published var buyerCommission: Int?
    @Published var sellerCommission: Int?
    @Published var balance: [Balance]?
    @Published var balanceLength: Int?
    @Published var isLoading: Bool = true
    
    func loadApiAccount() {
        isLoading = true
        //HUD.show(.progress)
        register(target: AuthManagerProvider.accountApi) { response, error in
            defer {
                HUD.hide()
            }
            DispatchQueue.main.async {
                if let error = error {
                    HUD.flash(.label(error.localizedDescription), delay: 1)
                } else {
                    if let response = response {
                        do {
                            let success = try JSONDecoder().decode(AccountBalanceModel.self, from: response)
                            DispatchQueue.main.async {
                                self.isLoading = false
                                self.total_balance_usdt = success.data?.total_balance_usdt ?? ""
                                self.total_gain_usdt = success.data?.total_gain_usdt ?? ""
                                self.total_gain_percentage = success.data?.total_gain_percentage ?? ""
                                self.balance = success.data?.balances
                                self.balanceLength = success.data?.balances?.count
                            }
                            
                        } catch let decodingError {
                            HUD.flash(.label("\(decodingError)"), delay: 1)
                        }
                    }
                }
            }
        }
    }
}

