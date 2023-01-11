//
//  ProductModel.swift
//  OnlineStore
//
//  Created by Mayur Nilwant on 11/01/2023.
//

import Foundation


enum ProductCategory: String {
    case men = "men's clothing"
    case women = "women's clothing"
    
    init?(withValue value: String) {
        
        self = ProductCategory(rawValue: value) ?? .men
        
    }
}

struct Product : Decodable {
    
    let identifier: Int?
    let price: Double?
    let title : String?
    let description : String?
    let imageLocation : String?
    let category: ProductCategory?
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case price = "price"
        case category = "category"
        case description = "description"
        case imageLocation = "image"
        case identifier = "id"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let productContainer = try? decoder.container(keyedBy: CodingKeys.self)
        self.identifier = try? productContainer?.decodeIfPresent(Int.self, forKey: .identifier)
        self.title = try? productContainer?.decodeIfPresent(String.self, forKey: .title)
        self.price = try? productContainer?.decodeIfPresent(Double.self, forKey: .price)
        let category = try? productContainer?.decodeIfPresent(String.self, forKey: .category)
        self.category = ProductCategory(rawValue: category ?? "")
        self.description = try? productContainer?.decodeIfPresent(String.self, forKey: .description)
        self.imageLocation = try? productContainer?.decodeIfPresent(String.self, forKey: .imageLocation)
        
        
    }
}

struct ProductResponse: Decodable {
    
    let products: [Product]?
    
    init(from decoder: Decoder) throws {
        
        let container = try? decoder.singleValueContainer()
        self.products = try? container?.decode([Product].self)
        print("")
    }
}
