//
//  String.swift
//  Utilities
//
//  Created by Mayur Nilwant on 23/12/2023.
//

import Foundation
import UIKit

enum StringValidationType {
    case validateForNil
    case emailValidation
    case specialCharacterValidation
}


extension String {
    
}


protocol FormValidatorProtocol {
    
    func validate(string: String)
}



