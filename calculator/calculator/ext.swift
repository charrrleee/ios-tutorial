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
        return [CalculatorButton.dot.name, CalculatorButton.percentage.name, CalculatorButton.equal.name, CalculatorButton.reverse.name].contains(self)
    }
    
    var isCalculateOperator: Bool {
        
        return [CalculatorButton.adding.name, CalculatorButton.subtract.name, CalculatorButton.multiply.name, CalculatorButton.divide.name].contains(self)
    }
}
