//
//  NetworkManager.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Alamofire
import PKHUD
import SwiftUI
import Network

public class NetworkManager: NSObject {
    
    public static let shared = NetworkManager()
    
    //    var header: HTTPHeaders = ["Accept": "application/json", "X-ClientCert":"admin1"]
    var header : HTTPHeaders = ["Content-Type":"application/json",
                                "Authorization":""]//Bearer
    //, "Content-Type": "application/x-www-form-urlencoded; charset=utf-8"]
    private let decoder: JSONDecoder
    
    public init(_ decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    /// - Parameters:
    ///   - urlEndPoint: end point of URL
    ///   - method: found it
    public func apiRequest(urlEndPoint: String, param: Parameters, method: HTTPMethods, onCompletion: @escaping(_ dictArr: Data?, Error?) -> Void) {//token: String,
        
        guard Connectivity.isConnectedToInternet() else {
            print("Add Error Message for No internet connection here")
            //HUD.hide()
            HUD.flash(.labeledError(title: "No Internet!", subtitle: "Please check your internet connection"), delay: 5.0)
            return
        }
       
        switch method {
        case .get:
            print("Get Method")
            getData(url: urlEndPoint) { responseDataObject , error  in
                onCompletion(responseDataObject, error)
            }
        case .post:
            
            print("Post Method")
            postData(url: urlEndPoint, param: param) { responseDataObject, error in
                onCompletion(responseDataObject, error)
            }
        case .delete:
            delteData(url: urlEndPoint, param: param) { responseDataObject, error in
                onCompletion(responseDataObject, error)
            }
        case .put:
            
            print("Put Method")
            putData(url: urlEndPoint, param: param) { responseDataObject, error in
                onCompletion(responseDataObject, error)
            }
            
        case .multipart:
            print("Put Multipart")
        }
    }
    
    func performOperation(urlEndPoint: String, method: HTTPMethod, param: Parameters?, _ completion: @escaping (_ dictArr: Data?, Error?) -> ()) {
        var headers = HTTPHeaders()
        if urlEndPoint.contains("login")  {
            headers  = ["Content-Type":"application/json",
                        "Authorization":""]//\(userDefaultData.token.getDefaultValue())
        } else {
            headers = ["Content-Type":"application/json",
                       "Authorization":"Bearer \(userDefaultData.token.getDefaultValue())"]
        }
//        headers = ["Content-Type": "application/json",
//                   "Authorization": "qVztR5QYHiRsT9TAHmc25AtHnaOvoM5KLVGY9KNWPidyg77K70eKdUx56gXKcTMe"
//        ]
        
        AF.request(urlEndPoint, method: method, parameters: param, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
                
            case .success( _):
                //TODO: Marked for no auth code 401, Can be changed later on!
                completion(response.data, nil)
                
            case .failure(let error):
                print("Method Fail Error: ", error.responseCode ?? "no error", error.localizedDescription)
                completion(nil,error)
            }
        }
    }
    
    func delteData(url: String, param: Parameters, completion: @escaping(_ responseDataObject: Data?, Error?) -> Void) {
        performOperation(urlEndPoint: url, method: .delete, param: param) { response , error  in
            completion(response, error)
        }
    }
    // MARK:- Post Data Method
    func postData(url: String, param: Parameters, completion: @escaping(_ responseDataObject: Data?, Error?) -> Void) {
        performOperation(urlEndPoint: url, method: .post, param: param) { response , error  in
            completion(response, error)
        }
    }
    
    func putData(url: String, param: Parameters, completion: @escaping(_ responseDataObject: Data?, Error?) -> Void) {
        performOperation(urlEndPoint: url, method: .put, param: param) { response , error  in
            completion(response, error)
        }
    }
    // MARK:- Get Data Method
    func getData(url: String, completion: @escaping(_ responseDataObject: Data?, Error?) -> Void) {
        performOperation(urlEndPoint: url, method: .get, param: nil) { response , error  in
            completion(response, error)
        }
    }
    
    func uploadImage<T:Decodable>(urlEndPoint: String, param: Parameters?, token: String?, isJsonAvailable: Bool, postKey: NSArray, imagesArray: NSArray, type: T.Type, mimeType: [String] = ["image/png"], completion: @escaping(_ response: T?, [T]?, String?, Bool?) ->Void) {
        HUD.show(.progress)
        
        if token != nil || token != "" {
            header["Authorization"] = "Bearer \(token!)"
            
        }
        guard Connectivity.isConnectedToInternet() else {
            HUD.flash(.labeledError(title: "No Internet!", subtitle: "Please check your internet connection"), delay: 3.0)
            return
        }
        //        print("MULTIPART Request:\nAPI URL - \(urlEndPoint)\nAPI Header - \(header)\nAPI PARAMETER - \(String(describing: param))")
        AF.upload(multipartFormData: { (form: MultipartFormData) in
            
            for (index, media) in imagesArray.enumerated() {
                
                if mimeType[index] == "image/png" {
                    if let imageData = (media as? UIImage)?.jpegData(compressionQuality: 0.3) {
                        if postKey.count != imagesArray.count {
                            form.append(imageData, withName: "\(postKey)[]", fileName: "\("\(Date().timeIntervalSince1970).png")", mimeType: mimeType[index])
                            
                        } else {
                            form.append(imageData, withName: postKey[index] as! String, fileName: "\(postKey[index] as! String).png", mimeType: mimeType[index])
                        }
                    }
                } else {
                    form.append(media as! Data, withName: postKey[index] as! String, fileName: "\(postKey[index] as! String)", mimeType: mimeType[index])
                }
            }
            if param != nil {
                for (key,value) in param! {
                    if let value = value as? String {
                        form.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    } else {
                        let arrayObj = value as! Array<Any>
                        for i in 0..<arrayObj.count {
                            let value = arrayObj[i] as! String
                            let keyObj = key + "[" + String(i) + "]"
                            form.append(value.data(using: String.Encoding.utf8)!, withName: keyObj)
                        }
                    }
                }
            }
        }, to: urlEndPoint, headers: header).validate(statusCode: 200..<500).responseDecodable(of: BaseModel<T>.self, decoder: decoder) { (response) in
            //            print("Code:", response.response?.statusCode as Any, "Response:", response)
            switch response.result {
            case .success(let value):
                if response.response?.statusCode == 401 {
                    completion(nil, nil, value.message, nil)
                } else {
                    if value.status == true {
                        if isJsonAvailable {
                            if value.jsonData != nil || value.jsonArray?.count != 0 {
                                completion(value.jsonData, value.jsonArray, value.message, value.status)
                            } else {
                                completion(nil, nil, value.message, value.status)
                            }
                        } else {
                            completion(nil, nil, value.message, value.status)
                        }
                    } else {
                        completion(nil, nil, value.message, value.status)
                    }
                }
            case .failure(let error):
                PKHUD().hide()
                print("Method Fail Error: ", error.responseCode ?? "no error", error.localizedDescription)
                completion(nil, nil, error.localizedDescription, nil)
            }
        }
    }
    
    func multiPartPutApi(urlString: String ,params:[String:Any],handler:@escaping(_ responseDataObject: Data?, Error?) -> Void) {
        if let url = URL(string: urlString) {
            if NetworkReachabilityManager()?.isReachable == true {
                let headers: HTTPHeaders = [
                    "Content-Type":"application/json",
                    "Authorization": "Bearer "]
                AF.upload(multipartFormData: { (multipartFormData) in
                    
                    if let image = params["fileImage"] as? Data {
                        multipartFormData.append(image, withName: "profile_image", fileName: "fileImage.jpg", mimeType: "image/jpeg")
                    }
                },
                          to: url, method: .put , headers: headers)
                .responseJSON(completionHandler: { (response) in
                    let _ = print("Succesfully uploaded")
                    switch response.result {
                        
                    case .success( _):
                        //TODO: Marked for no auth code 401, Can be changed later on!
                        handler(response.data, nil)
                        
                    case .failure(let error):
                        print("Method Fail Error: ", error.responseCode ?? "no error", error.localizedDescription)
                        handler(nil,error)
                    }
                    
                    /*print(response)
                    if let err = response.error{
                        print(err)
                        return
                    }
                    print("Succesfully uploaded")
                    let json = response.data
                    if (json != nil) {
                        let jsonObject = json
                        handler(response.value as? [String : AnyObject] )
                    }*/
                })
            } else {
                return
            }
        }
    }
}
// MARK:- Connectivity Class
class Connectivity {
    
    //Check internet connectivity
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
