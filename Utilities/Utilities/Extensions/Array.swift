//
//  Array.swift
//  Utilities
//
//  Created by Mayur Nilwant on 23/12/2023.
//

import Foundation


extension Array {
    
    subscript(safe index: Index) -> Element? {
        
        guard index >= startIndex, index <= endIndex else {
            return nil
        }
        return self[index]
    }
    
}
