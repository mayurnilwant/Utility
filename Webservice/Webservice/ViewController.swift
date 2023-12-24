//
//  ViewController.swift
//  Webservice
//
//  Created by Mayur Nilwant on 03/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let productEndPoint = ProductResourceEndPoint(withQueryParam: ["name": "mayur"])
//        print("Url is: \(productEndPoint.url?.absoluteString)")
        
        
        
        // Do any additional setup after loading the view.
    }


}



enum HttpOperation {
    
    case get
    case post(Encodable)
    case update(Encodable)
    case delete(Encodable)
    
    
    func httpMethod() -> String {
        switch self {
        case .get:
            return "GET"
        case .post(_), .delete(_), .update(_):
            return "POST"
        
        }
    }
    
}

protocol EndPointResource {
    
    var baseUrl: String{get}
    var path: String {get}
    var queryParam : [String: String]? {get set}
    var scheme: String {get}
    var httpOperation: HttpOperation{get set}
    
    init()
    
}

extension EndPointResource {
    
    var baseUrl: String {
        
        return "www.ndtv.com"
    }
    
    var scheme: String {
        
        return "https"
    }
    
    init(withQueryParam param: [String: String]? = nil, andHttpOperation httpOperation: HttpOperation) {
        
        self.init()
        if let param = param {
            self.queryParam = param
        }
        
        self.httpOperation = httpOperation
        
    }
    
    var url : URL? {
        
        var urlComponent = URLComponents()
        urlComponent.scheme = self.scheme
        urlComponent.host = self.baseUrl
        urlComponent.path = path
        if let queryParam = self.queryParam {
            urlComponent.queryItems = queryParam.map({ key, value in
                return URLQueryItem(name: key, value: value)
            })
        }
        
        return urlComponent.url
        
    }
}


struct ProductResourceEndPoint: EndPointResource {
    
    init() {
        self.httpOperation = .get
    }
    
    
    var path: String {
        
        switch self.httpOperation {
            
        case .get:
            return "/allProducts"
        case .post(_), .delete(_), .update(_):
            return "/addProduct"
        
        }
    }
    var httpOperation: HttpOperation
    var queryParam: [String : String]?
    
}



struct IngredientsResourceEndPoint: EndPointResource {
    
    init() {
        self.httpOperation = .get
    }
    
    
    var path: String {
        
        switch self.httpOperation {
            
        case .get:
            return "/allIngredients"
        case .post(_), .delete(_), .update(_):
            return "/addIngredients"
        
        }
    }
    var httpOperation: HttpOperation
    var queryParam: [String : String]?
    
}

