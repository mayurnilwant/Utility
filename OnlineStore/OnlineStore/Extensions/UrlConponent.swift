//
//  UrlConponent.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation


extension URLComponents {
    
    init(withEndPoint endPoint: EndPoint) {
        self.init()
        self.host = endPoint.host
        self.path = endPoint.path ?? ""
        self.scheme = endPoint.scheme.rawValue
        if let  _queryParam = endPoint.queryParam  {
            
            self.queryItems = _queryParam.map{
                URLQueryItem(name: $0, value: $1)
            }
            
        }
    }
}
