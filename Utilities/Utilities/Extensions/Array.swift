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


extension Optional where Wrapped: StringProtocol {
    func safeExtract() -> Wrapped? {
        guard let val = self else {
            return ""
        }
        return val
    }
}


extension Array where Element : Comparable {
    
    func allEqual() -> Bool {
        
        for item in self {
            
            if self.first != item {
                return false
            }
        }
        return true
    }
}

