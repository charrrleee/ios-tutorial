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
    
    var _val1: String = ""
    var _val2: String = ""
    
    var state: CalculateState = CalculateState.initState
    var operateSymbol: String = ""
    @Published var display: String = "0"
    
    
    func add() -> Double {
        return (Double(self._val1)! + Double(self._val2)!)
    }
    
    func subtract() -> Double {
        return (Double(self._val1)! - Double(self._val2)!)
    }
    
    func multipy() -> Double {
        return (Double(self._val1)! * Double(self._val2)! )
    }
    
    func divide() -> Double {
        return (Double(self._val1)! / Double(self._val2)!)
    }
    
    func toPercentage(val: Double) -> Double {
        return (Double(self._val1)! / 100)
    }
    
    func reverse(val: Double) -> Double {
        return Double(self._val1)! / -1
    }
    
    func toFloatingPoint(val: Double) -> Double {
        return Double(self._val1)!
        //        todo fix
    }
    
    func clear() {
        //        todo
        _val1 = ""
        _val2 = ""
        state = CalculateState.initState
        display = "0"
        operateSymbol = ""
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
                self._val1 = value
                state = CalculateState.firstInputState
            } else {
                if(value == CalculatorButton.dot.name) {
                    self._val1 = String("0.")
                }
            }
            self.display = self._val1
        } else if(state == CalculateState.firstInputState) {
            if(isNumber) {
                self._val1 = self._val1 + value
                self.display = self._val1
            } else if(isNumberOperator) {
                if(value == CalculatorButton.dot.name) {
                    if(!self._val1.contains(CalculatorButton.dot.name)) {
                        self._val1 = self._val1 + CalculatorButton.dot.name
                    }
                } else if(value == CalculatorButton.reverse.name) {
                    if(self._val1.contains("-")) {
                        self._val1 = self._val1.substring(from: 1, to: self._val1.count)
                    } else {
                        self._val1 = "-" + self._val1
                    }
                } else if(value == CalculatorButton.percentage.name) {
                    self._val1 = String(reverse(val: Double(self._val1)!))
                }
                self.display = self._val1
            } else {
                self.operateSymbol = value
                state = CalculateState.operationState
            }
            self.display = self._val1
        }else if(state == CalculateState.operationState) {
            if(isNumber) {
                self._val2 = value
                self.display = self._val2
                state = CalculateState.secondInputState
            } else if (isNumberOperator) {
                if(value == CalculatorButton.dot.name) {
                    if(!self._val2.contains(CalculatorButton.dot.name)) {
                        self._val2 = self._val2 + CalculatorButton.dot.name
                    }
                } else if(value == CalculatorButton.reverse.name) {
                    if(self._val2.contains("-")) {
                        self._val2 = self._val2.substring(from: 1, to: self._val2.count)
                    } else {
                        self._val2 = "-" + self._val2
                    }
                } else if(value == CalculatorButton.percentage.name) {
                    self._val2 = String(reverse(val: Double(self._val2)!))
                }
                state = CalculateState.secondInputState
            } else {
                // do nothing
                state = CalculateState.secondInputState
            }
            self.display = self._val2

        }else if(state == CalculateState.secondInputState) {
            var answer: String = ""
            print(isNumber, isNumberOperator, isCalculateOperator)
            if(isNumber) {
                self._val2 = self._val2 + value
                self.display = self._val2
            }  else if (isNumberOperator) {
                if(value == CalculatorButton.dot.name) {
                    // check value is float or int?
                } else if(value == CalculatorButton.reverse.name) {
                    self._val2 = String(self.reverse(val: Double(value)!))
                } else if(value == CalculatorButton.percentage.name) {
                    self._val2 = String(self.toPercentage(val: Double(value)!))
                }
            } else if(isCalculateOperator || value == CalculatorButton.equal.name) {
                // todo shift state
                if(operateSymbol == CalculatorButton.adding.name) {
                    answer =  String(self.add())
                } else if(operateSymbol == CalculatorButton.subtract.name) {
                    answer =   String(self.subtract())
                } else if(operateSymbol == CalculatorButton.multiply.name) {
                    answer =   String(self.multipy())
                } else if(operateSymbol == CalculatorButton.divide.name) {
                    answer =   String(self.divide())
                }
                self.display = answer
                

            }
        } else {
            
        }
//        return ""
    }
}
