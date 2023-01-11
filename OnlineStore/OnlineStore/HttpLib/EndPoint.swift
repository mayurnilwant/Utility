//
//  EndPoint.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation


enum SchemeType: String {
    
    case http = "http"
    case https = "https"
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
        
        self.host = "fakestoreapi.com"
        self.scheme = SchemeType.https
    }
    
    // Get Query Initializer
    
    init(withPath path: String, andQueryParam param: [String: String]? = nil) {
        self.init()
        self.path = path
        self.queryParam = param
        
    }
}



extension EndPoint {
    
    static var allProducts: URL? {
        
        let productsEndPoint = EndPoint(withPath: "/products")
        let component = URLComponents(withEndPoint: productsEndPoint)
        
        guard let productUrl = component.url else {
            return nil
        }
        return productUrl
    }
    
}
