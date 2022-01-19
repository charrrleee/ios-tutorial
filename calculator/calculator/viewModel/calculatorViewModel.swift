//
//  calculatorViewModel.swift
//  calculator
//
//  Created by Charlene Cheung on 18/1/2022.
//

import Foundation

class CalculatorViewMode {
    let buttons: [[CalcatorButten]] = [
        [.clear, .sign, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .adding],
        [.reverse, .zero, .dot, .equal]
    ]
    
    func add(val1: Double, val2: Double) -> String {
        return "\(val1 + val2)"
    }
    
    func subtract(val1: Double, val2: Double) -> String {
        return "\(val1 - val2)"
    }
    
    func multipy(val1: Double, val2: Double) -> String {
        return "\(val1 * val2)"
    }
    
    func divide(val1: Double, val2: Double) -> String {
        return "\(val1 / val2)"
    }
    
    func toPercentage(val1: Double) -> String {
        return "\(val1 / 100)"
    }
    
    func toOpposeValue(val1: Double) -> String {
        return "\(val1 / -1)"
    }
    
    func toFloatingPoint(val1: Double) -> String {
        return "\(val1)"
//        todo fix
    }
    
    func clear() {
//        todo
    }
    
    func calculate() {
        // todo
    }

}
