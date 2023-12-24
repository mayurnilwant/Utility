//
//  EndPoint.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation


//struct User {
//    let firstname: String
//    let lastName : String
//    var birthday : Date?
//
//    private func isValid() -> Bool {
//
//        let numbers: [Int] = [1000, 5670, -1, 42, 21341123, 9223372036833434684]
//        let average = numbers.reduce(0, +)/numbers.count
//        return false
//    }
//}


struct User {
    let firstname: String
    let lastName : String
    var birthday : Date?
    
     func isValid() -> Bool {
        return firstname == "max"
    }
}



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
        
        let testUser = User(firstname: "max", lastName: nil, birthday: nil)
        assert(testUser.isValid(), "fjdsfjk;")
        
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
