//
//  calculatorViewModel.swift
//  calculator
//
//  Created by Charlene Cheung on 18/1/2022.
//

import Foundation


class CalculatorViewMode: ObservableObject {
    @Published var buttons: [[CalculatorButton]] = [
        [.clear, .sign, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .adding],
        [.reverse, .zero, .dot, .equal]
    ]
    
    var val1: Double = 0
    var val2: Double = 0
    var state: CalculateState = CalculateState.initState
    var operateSymbol: String = ""
    var display: String = "0"
    func add() -> Double {
        return self.val1 + self.val2
    }
    
    func subtract() -> Double {
        return self.val1 - self.val2
    }
    
    func multipy() -> Double {
        return self.val1 * self.val2
    }
    
    func divide() -> Double {
        return self.val1 / self.val2
    }
    
    func toPercentage(val1: Double) -> Double {
        return val1 / 100
    }
    
    func reverse(val1: Double) -> Double {
        return val1 / -1
    }
    
    func toFloatingPoint(val1: Double) -> Double {
        return val1
        //        todo fix
    }
    
    func clear() {
        //        todo
        val1 = 0
        val2 = 0
        state = CalculateState.initState
        display = "0"
    }
    
    func calculate(value: String) {
        let isNumber: Bool = value.isNumber
        let isNumberOperator: Bool = value.isNumberOperator
        let isCalculateOperator: Bool = value.isCalculateOperator
        let isNumberPack: Bool = isNumber || isNumberOperator
        
        if (value == CalculatorButton.clear.name) {
            self.clear()
            return
        }
        
        if(state == CalculateState.initState) {

            if(isNumber) {
                // do nothing
                self.val1 = Double(value)!
                state = CalculateState.inputState
            } else {
                if(value == CalculatorButton.dot.name) {
                    self.val1 = Double(0.0)
                    self.display = String("0.")
                    print(self.display, "???")
                    // todo diplay 0.0
                }
                // do nothing
            }
//            return String(val1)
        } else if(state == CalculateState.inputState) {
            if(isNumber) {
                self.val1 = Double("\(self.val1)\(value)")!
            } else if(isNumberOperator) {
                if(value == CalculatorButton.dot.name) {
                    // check value is float or int?
                } else if(value == CalculatorButton.reverse.name) {
                    self.val1 = self.reverse(val1: Double(value)!)
                } else if(value == CalculatorButton.percentage.name) {
                    self.val1 = self.toPercentage(val1: Double(value)!)
                }
            } else {
                self.operateSymbol = value
                state = CalculateState.operationState
            }
        }else if(state == CalculateState.operationState) {
            if(isNumber) {
                self.val2 = Double(value)!
            } else if (isNumberOperator) {
                if(value == CalculatorButton.dot.name) {
                    // check value is float or int?
                } else if(value == CalculatorButton.reverse.name) {
                    self.val2 = self.reverse(val1: Double(value)!)
                } else if(value == CalculatorButton.percentage.name) {
                    self.val2 = self.toPercentage(val1: Double(value)!)
                }
            } else {
                // do nothing
                state = CalculateState.processState
            }
            
        }else if(state == CalculateState.processState) {
            var answer: String = ""
            if(isNumber) {
                state = CalculateState.processState
            }  else if (isNumberOperator) {
                if(value == CalculatorButton.dot.name) {
                    // check value is float or int?
                } else if(value == CalculatorButton.reverse.name) {
                    self.val2 = self.reverse(val1: Double(value)!)
                } else if(value == CalculatorButton.percentage.name) {
                    self.val2 = self.toPercentage(val1: Double(value)!)
                }
            } else if(isCalculateOperator) {
                // todo shift state
                if(value == CalculatorButton.adding.name) {
                    answer =  String(self.add())
                } else if(value == CalculatorButton.subtract.name) {
                    answer =   String(self.subtract())
                } else if(value == CalculatorButton.multiply.name) {
                    answer =   String(self.multipy())
                } else if(value == CalculatorButton.divide.name) {
                    answer =   String(self.divide())
                }
//                return answer
            }
        }
//        return ""
    }
}
