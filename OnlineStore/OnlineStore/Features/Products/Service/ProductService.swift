//
//  ProductService.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation


//protocol erv {
//
//    associatedtype resource
//    func getResource() -> resource
//}


protocol ServiceProtocol {
    
    associatedtype Resource
    
    func getAllResource() async throws -> [Resource]
    func getResourceby(id identifier: Int) -> Resource
    
}


class ProductService : HttpClientProtocol, ServiceProtocol {
    
    
    typealias Resource = Product
    
    func getAllResource() async throws -> [Product] {
        
        self.getProducts(for: ProductRequestEnum.all, andType: ProductResponse.self)
        
        return [Product]()
    }
    
    func getResourceby(id identifier: Int) -> Product {
        
        self.getProducts(for: ProductRequestEnum.forId(identifier), andType: Product.self)
        
        return Product()
        
        
    }
    
    
    
    func getProducts<T: Decodable>(for type: ProductRequestEnum, andType modelType: T.Type) {
        let urlProduct = EndPoint.getProduct(for: type)
        let req = self.makeRequest(withUrl: urlProduct, withHeaderDictionary: nil, andMethod: .get)
        
        self.fetch(withUrlRequest: req, withType: modelType.self) { result in
            
            switch result {
                
            case .success(let model):
                do {
                
                    print(model.debugDescription)
            }
            case .failure(let error) :
                do {
                    print(error.debugDescription)
                }
                
            }
        }
        
        
    }
    
    

}
