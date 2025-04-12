//
//  AuthManagerProvider.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Foundation
import Alamofire
import CryptoKit

public enum AuthManagerProvider {
    case loginApi(api_key: String, secret_key: String)
    case accountApi
    
    case listOfPTwoP(page: Int, rows: Int, asset: String, fiat: String)
    
    case creatingAds(advertiseType: String, asset: String, fiat: String, price: String, amount: String, paymentMethods: String, msg: String)
    case listUserOrderHistory
    case allOrderHistory
    
    case updateAccount(advNo: String, advStatus: Int, asset: String, authType: String, autoReplyMsg: String, buyerBtcPositionLimit: Int, buyerKycLimit: Int, buyerRegDaysLimit: Int, code: String, emailVerifyCode: String, fiatUnit: String, googleVerifyCode: String, initAmount: Int, maxSingleTransAmount: Int, minSingleTransAmount: Int, mobileVerifyCode: String, payTimeLimit: Int,  price: Int, priceFloatingRatio: Int, priceType: Int, rateFloatingRatio: Int, remarks: String, saveAsTemplate: Int, takerAdditionalKycRequired: Int, templateName: String, identifier: String, payType: String, payId: Int, tradeType: Int, updateMode: String, userAllTradeCountMax: Int, userAllTradeCountMin: Int, userBuyTradeCountMax: Int, userBuyTradeCountMin: Int, userSellTradeCountMax: Int, userSellTradeCountMin: Int, userTradeCompleteCountMin: Int, userTradeCompleteRateFilterTime: Int, userTradeCompleteRateMin: Int, userTradeCountFilterTime: Int, userTradeType: Int, userTradeVolumeAsset: String, userTradeVolumeFilterTime: Int, userTradeVolumeMax: Int, userTradeVolumeMin: Int, yubikeyVerifyCode: String)
   
}

extension AuthManagerProvider: AppTargetType {
    // for url
    public var baseURL: String {
        return developmentUrl//CoreApp.shared.settings.getURL() //CoreApp.shared.settings.getURL()
    }
    
    //return parameters
    public var params: Parameters {
        switch self {
            
        case .loginApi(api_key: let api_key, secret_key: let secret_key):
            return ["api_key": api_key,
                    "secret_key": secret_key]
        case .accountApi:
            return [:]
        case .listOfPTwoP(page: let page, rows: let rows, asset: let asset, fiat: let fiat):
            return [
                "page": page,
                "rows": rows,
                "asset": asset,
                "fiat": fiat
            ]
        case .creatingAds(advertiseType: let advertiseType, asset: let asset, fiat: let fiat, price: let price, amount: let amount, paymentMethods: let paymentMethods, msg: let msg):
            return [
                "advertiseType": advertiseType,
                "asset": asset,
                "fiat": fiat,
                "price": price,
                "amount": amount,
                "paymentMethods": paymentMethods,
                "msg": msg
            ]
        case .listUserOrderHistory:
            return [:]
        case .allOrderHistory:
            return [:]
            
        
        case .updateAccount(advNo: let advNo, advStatus: let advStatus, asset: let asset, authType: let authType, autoReplyMsg: let autoReplyMsg, buyerBtcPositionLimit: let buyerBtcPositionLimit, buyerKycLimit: let buyerKycLimit, buyerRegDaysLimit: let buyerRegDaysLimit, code: let code, emailVerifyCode: let emailVerifyCode, fiatUnit: let fiatUnit, googleVerifyCode: let googleVerifyCode, initAmount: let initAmount, maxSingleTransAmount: let maxSingleTransAmount, minSingleTransAmount: let minSingleTransAmount, mobileVerifyCode: let mobileVerifyCode, payTimeLimit: let payTimeLimit, price: let price, priceFloatingRatio: let priceFloatingRatio, priceType: let priceType, rateFloatingRatio: let rateFloatingRatio, remarks: let  remarks, saveAsTemplate: let saveAsTemplate, takerAdditionalKycRequired: let takerAdditionalKycRequired, templateName: let templateName, identifier: let identifier, payType: let payType, payId: let payId, tradeType: let tradeType, updateMode: let updateMode, userAllTradeCountMax: let userAllTradeCountMax, userAllTradeCountMin: let userAllTradeCountMin, userBuyTradeCountMax: let userBuyTradeCountMax, userBuyTradeCountMin: let userBuyTradeCountMin, userSellTradeCountMax: let userSellTradeCountMax, userSellTradeCountMin: let userSellTradeCountMin, userTradeCompleteCountMin: let userTradeCompleteCountMin, userTradeCompleteRateFilterTime: let userTradeCompleteRateFilterTime, userTradeCompleteRateMin: let userTradeCompleteRateMin, userTradeCountFilterTime: let userTradeCountFilterTime, userTradeType: let userTradeType, userTradeVolumeAsset: let userTradeVolumeAsset, userTradeVolumeFilterTime: let userTradeVolumeFilterTime, userTradeVolumeMax: let userTradeVolumeMax, userTradeVolumeMin: let userTradeVolumeMin, yubikeyVerifyCode: let yubikeyVerifyCode):
            return [
                "advNo": advNo,
                "advStatus": advStatus,
                "asset": asset,
                "fiatUnit": fiatUnit,
                "price": price,
                "authType": authType,
                "autoReplyMsg": autoReplyMsg,
                "buyerBtcPositionLimit": buyerBtcPositionLimit,
                "buyerKycLimit": buyerKycLimit,
                "buyerRegDaysLimit": buyerRegDaysLimit,
                "code": code,
                "emailVerifyCode": emailVerifyCode,
                "googleVerifyCode": googleVerifyCode,
                "initAmount": initAmount,
                "maxSingleTransAmount": maxSingleTransAmount,
                "minSingleTransAmount": minSingleTransAmount,
                "mobileVerifyCode": mobileVerifyCode,
                "payTimeLimit": payTimeLimit,
                "priceFloatingRatio": priceFloatingRatio,
                "priceType": priceType,
                "rateFloatingRatio": rateFloatingRatio,
                "remarks": remarks,
                "saveAsTemplate": saveAsTemplate,
                "takerAdditionalKycRequired": takerAdditionalKycRequired,
                "templateName": templateName,
                "tradeMethods": [
                        "identifier": identifier,
                        "payType": payType,
                        "payId": payId
                        
                ],
                "tradeType": tradeType,
                "updateMode": updateMode,
                "userAllTradeCountMax": userAllTradeCountMax,
                "userAllTradeCountMin": userAllTradeCountMin,
                "userBuyTradeCountMax": userBuyTradeCountMax,
                "userBuyTradeCountMin": userBuyTradeCountMin,
                "userSellTradeCountMax": userSellTradeCountMax,
                "userSellTradeCountMin": userSellTradeCountMin,
                "userTradeCompleteCountMin": userTradeCompleteCountMin,
                "userTradeCompleteRateFilterTime": userTradeCompleteRateFilterTime,
                "userTradeCompleteRateMin": userTradeCompleteRateMin,
                "userTradeCountFilterTime": userTradeCountFilterTime,
                "userTradeType": userTradeType,
                "userTradeVolumeAsset": userTradeVolumeAsset,
                "userTradeVolumeFilterTime": userTradeVolumeFilterTime,
                "userTradeVolumeMax": userTradeVolumeMax,
                "userTradeVolumeMin": userTradeVolumeMin,
                "yubikeyVerifyCode": yubikeyVerifyCode
            ]
        }
    }
    //return Api end url
    public var path: String {
        switch self {
      
        case .loginApi:
            return Apis.kk_login
        case .accountApi:
            return Apis.kk_account
        case .listOfPTwoP:
            return Apis.kk_listP2p
        case .creatingAds:
            return Apis.kk_createAds
        case .listUserOrderHistory:
            return Apis.kk_listOrderHistory
        case .allOrderHistory:
            return Apis.kk_allOrders
        case .updateAccount:
            return createBinanceRequestURL(urlString: Apis.kk_update)
      
        }
    }
    /// Return a Api Type
    /// Post or Get
    public var method: HTTPMethods {
        switch self {
        case .loginApi, .listOfPTwoP, .creatingAds, .updateAccount:
            return .post
            
        case .accountApi, .listUserOrderHistory, .allOrderHistory:
            return .get
        
            

       // case .faqs://.termsAndCondition, .privacyAndPolicy,.searchStore,

       
           // return .get
//        case .profileUpdate, .updateAddress:
//            return .put
//        case .deleteAddress:
//            return .delete

        }
    }
    public var apiResponseType: String {
        switch self {
        case .loginApi:
            return "Login User"
        case .accountApi:
            return "Account Api"
        case .listOfPTwoP:
            return "list Of P Two P"
        case .creatingAds:
            return "Creating Ads"
        case .listUserOrderHistory:
            return "ListUserOrderHistory"
        case .allOrderHistory:
            return "AllOrderHistory"
        case .updateAccount:
            return "Update Account"
        }
    }
    
}
