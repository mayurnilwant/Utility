//
//  EndPoint.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation


enum ProductRequestEnum: Equatable {
    
    case all
    case forId(Int)
    
    func getProductId() -> String? {
        
        switch self {
        case .all:
            return nil
        case .forId(let identifier):
            return "\(identifier)"
        }
    }
}


enum HttpMethod {
    case get
    case post(Data)
    
    func getPostDat() -> Data? {
        
        switch self {
        case .get:
            return nil
        case .post(let postData):
            return postData
        }
    }
    
    func getMethodType() -> String
        {
            switch self {
            case .get:
                return "GET"
            case .post(_):
                return "POST"
            }
        }
    
    
}

enum SchemeType: String {
    
    case http = "http"
    case https = "https"
}

enum Enviornment: String {
    
    case stagingHost = "staging_fakestoreapi.com"
    case prodHost = "fakestoreapi.com"
    case uatHost = "uat_fakestoreapi.com"
}


struct EndPoint {
     let host: String
     let scheme: SchemeType
    var path: String?
    var queryParam: [String: String]?
    
     init(withHost host: String, andScheme scheme: SchemeType) {
        self.host = host
        self.scheme = scheme
    }
    
    private init() {
        
        self.host = Enviornment.prodHost.rawValue
        self.scheme = SchemeType.https
    }
    
    // Get Query Initializer
    
    init(withPath path: String, andQueryParam param: [String: String]? = nil) {
        self.init()
        self.path = path
        self.queryParam = param
        
    }
    
    init(withScheme scheme: SchemeType = SchemeType.https, withHost host: String = "fakestoreapi.com", withPath path: String, andQueryParam param: [String: String]? = nil) {
        
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryParam = param
    }
    
}



extension EndPoint {

    
  static func getProduct(for type: ProductRequestEnum) -> URL? {
    
      var path = ""
      if let productId = type.getProductId() {
             path = "/products/\(productId)"
      }else {
          path = "/products"
      }
        let productsEndPoint = EndPoint(withPath: path)
        let component = URLComponents(withEndPoint: productsEndPoint)
        return component.url
        
    }
    
}
