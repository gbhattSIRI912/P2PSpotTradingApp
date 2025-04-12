//
//  UpdateAdsViewModel.swift
//  P2PSpotTradingApp
//
//  Created by orange on 27/01/25.
//

import Foundation
import PKHUD

class UpdateAdsViewModel: ObservableObject {
    
    func loadApiUpdateAds(advNo: String, advStatus: Int, asset: String, fiatUnit: String, price: Int, identifier: String,
                          payType: String, tradeType: Int, updateMode: String, authType: String = "FIDO2", autoReplyMsg: String = "",
                          buyerBtcPositionLimit: Int = 0, buyerKycLimit: Int = 0, buyerRegDaysLimit: Int = 0, code: String = "", emailVerifyCode:
                          String = "", googleVerifyCode: String = "", initAmount: Int = 0, maxSingleTransAmount: Int = 0, minSingleTransAmount: Int
                          = 0, mobileVerifyCode: String = "", payTimeLimit: Int = 0,
                          priceFloatingRatio: Int = 0, priceType: Int = 0, rateFloatingRatio: Int = 0, remarks: String = "Remarks", saveAsTemplate:
                          Int = 0, takerAdditionalKycRequired: Int = 0, templateName: String = "Template Name", userAllTradeCountMax: Int = 0,
                          userAllTradeCountMin: Int = 0, userBuyTradeCountMax: Int = 0, userBuyTradeCountMin: Int = 0, userSellTradeCountMax: Int =
                          0, userSellTradeCountMin: Int = 0, userTradeCompleteCountMin: Int = 0, userTradeCompleteRateFilterTime: Int = 0,
                          userTradeCompleteRateMin: Int = 0, userTradeCountFilterTime: Int = 0, userTradeType: Int = 0, userTradeVolumeAsset:
                          String = "", userTradeVolumeFilterTime: Int = 0, userTradeVolumeMax: Int = 0, userTradeVolumeMin: Int = 0, yubikeyVerifyCode: String = "") {
        register(target: AuthManagerProvider.updateAccount(advNo: advNo, advStatus: advStatus, asset: asset, authType: authType,
                                                           autoReplyMsg: autoReplyMsg, buyerBtcPositionLimit: buyerBtcPositionLimit,
                                                           buyerKycLimit: buyerKycLimit, buyerRegDaysLimit: buyerRegDaysLimit,
                                                           code: code, emailVerifyCode: emailVerifyCode, fiatUnit: fiatUnit,
                                                           googleVerifyCode: googleVerifyCode, initAmount: initAmount,
                                                           maxSingleTransAmount: maxSingleTransAmount, minSingleTransAmount: minSingleTransAmount,
                                                           mobileVerifyCode: mobileVerifyCode, payTimeLimit: payTimeLimit, price: price,
                                                           priceFloatingRatio: priceFloatingRatio, priceType: priceType, rateFloatingRatio:
                                                            rateFloatingRatio, remarks: remarks, saveAsTemplate: saveAsTemplate,
                                                           takerAdditionalKycRequired: takerAdditionalKycRequired, templateName: templateName,
                                                           identifier: identifier, payType: payType, payId: 0, tradeType: tradeType,
                                                           updateMode: updateMode, userAllTradeCountMax: userAllTradeCountMax,
                                                           userAllTradeCountMin: userAllTradeCountMin, userBuyTradeCountMax: userBuyTradeCountMax,
                                                           userBuyTradeCountMin: userBuyTradeCountMin, userSellTradeCountMax:
                                                            userSellTradeCountMax, userSellTradeCountMin: userSellTradeCountMin,
                                                           userTradeCompleteCountMin: userTradeCompleteCountMin, userTradeCompleteRateFilterTime:
                                                            userTradeCompleteRateFilterTime, userTradeCompleteRateMin: userTradeCompleteRateMin,
                                                           userTradeCountFilterTime: userTradeCountFilterTime, userTradeType: userTradeType,
                                                           userTradeVolumeAsset: userTradeVolumeAsset, userTradeVolumeFilterTime:
                                                            userTradeVolumeFilterTime, userTradeVolumeMax: userTradeVolumeMax, userTradeVolumeMin:
                                                            userTradeVolumeMin, yubikeyVerifyCode: yubikeyVerifyCode)) { response, error in
            if let error = error {
                HUD.flash(.label(error.localizedDescription), delay: 1)
                print("\(error.localizedDescription)")
            } else {
                if let response = response {
                    do {
                        let success = try JSONDecoder().decode(UpdateCommonCommisionRateModel.self, from: response)
                        if success.code == "200" {
                            print("response>>>>\(success.data)")
                        }
                    } catch let decodingError {
                        HUD.flash(.label("\(decodingError)"), delay: 1)
                        print("\(decodingError)")
                    }
                }
            }
        }
    }
    
}
