//
//  GlobalAPIClass.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Foundation

enum HttpMethodType: String {
    case GET
}
public func register(target: AuthManagerProvider, completion : @escaping(_ dictArr: Data?, Error?) -> Void){
    let url = target.getURL()
    let apiType = target.method
    let params = target.params
    _ = target.apiResponseType
    
    switch target {
    case .loginApi, .accountApi, .listOfPTwoP, .creatingAds, .listUserOrderHistory, .updateAccount, .allOrderHistory:
        
      NetworkManager.shared.apiRequest(urlEndPoint: "\(url)", param: params, method: apiType) { responseDataObject, error in
          print(url)
          print(params)
          print(apiType)
          
            completion(responseDataObject ?? Data(), error)
        }
        break
//    case .userRegister:
//
//        NetworkManager.shared.apiRequest(urlEndPoint: "http://10.2.0.24:21004/register/user", method: apiType, param: params) { responseDataObject, error in
//            completion(responseDataObject ?? Data(), error)
//        }
//        break
    
    }
}
extension AppTargetType {
    func getURL() -> String { //URL {
        return self.baseURL.appending(self.path) //self.baseURL.url!.appendingPathComponent(self.path)
    }
}
