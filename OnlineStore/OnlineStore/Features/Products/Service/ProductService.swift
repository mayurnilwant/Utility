//
//  ProductService.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation




class ProductService : HttpClientProtocol {
    
    
    func getProducts() {
        
        let productUrl = EndPoint.allProducts
        
        let req = self.makeRequest(withUrl: productUrl, withHeaderDictionary: nil, andMethod: .get)
        
        self.fetch(withUrlRequest: req, withType: ProductResponse.self) { result in
            
            switch result {
                
            case .success(let model):
                do {
                
            }
            case .failure(let error) :
                do {
                    
                }
                
            }
        }
    }

}
