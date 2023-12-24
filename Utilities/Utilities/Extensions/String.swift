//
//  String.swift
//  Utilities
//
//  Created by Mayur Nilwant on 23/12/2023.
//

import Foundation

enum StringValidationType {
    case validateForNil
    case emailValidation
    case specialCharacterValidation
}


extension String {
    
    func validate(forValidator validator: StringValidationType) -> Bool {
        switch validator {
        case .validateForNil:
            do {
                
                return self.isEmpty
            }
        case .emailValidation:
            return true
        case .specialCharacterValidation:
            return false
        }
    }
}


