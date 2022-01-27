//
//  ext.swift
//  calculator
//
//  Created by Charlene Cheung on 19/1/2022.
//

import Foundation
extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits.inverted
        return !self.isEmpty && rangeOfCharacter(from: characters) == nil
    }
    
    var isNumberOperator: Bool {
        return [CalculatorButton.dot.name, CalculatorButton.percentage.name, CalculatorButton.reverse.name].contains(self)
    }
    
    var isCalculateOperator: Bool {
        
        return [CalculatorButton.adding.name, CalculatorButton.subtract.name, CalculatorButton.multiply.name, CalculatorButton.divide.name].contains(self)
    }
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from + 1)
        return String(self[start ..< end])
    }
    

}
