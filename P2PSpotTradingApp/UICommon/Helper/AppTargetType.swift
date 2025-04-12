//
//  AppTargetType.swift
//  P2PSpotTradingApp
//
//  Created by orange on 07/01/25.
//

import Foundation
import Alamofire

//MARK: Basic details listed below for API's calling
public protocol AppTargetType {
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethods { get }
    var params: Parameters { get }
    var apiResponseType: String { get }
}

//MARK: Network layer default public methods
public enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case multipart = "MULTIPART"
}
