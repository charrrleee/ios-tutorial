//
//  calculatorViewModel.swift
//  calculator
//
//  Created by Charlene Cheung on 18/1/2022.
//

import Foundation


class CalculatorViewMode: ObservableObject {
    @Published var buttons: [[CalculatorButton]] = [
        [.clear, .plusMinus, .percentage, .divide],
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
    
    var _isNumber: Bool = false
    var _isNumberOperator: Bool  = false
    var _isCalculateOperator: Bool  = false
    var _isNumberPack: Bool = false

    
    
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
    
    func toPercentage(val: String) -> Double {
        return (Double(val)! / 100)
    }
    
    func toOpposeValue(val: String) -> Double {
        return Double(val)! / -1
    }
    
    func toFloatingPoint(val: String) -> String {
        var value:String = val
        if(!value.contains(CalculatorButton.dot.name)) {
            value = value + CalculatorButton.dot.name
        }
        return value
    }
    
    
    func updateVal1(val: String) {
        self._val1 = self._val1 + val
        self.display = self._val1
    }
    func updateVal2(val: String) {
        self._val2 = self._val2 + val
        self.display = self._val2
    }
    
    func _calculate() -> String {
        var answer: String = ""

        if(operateSymbol == CalculatorButton.adding.name) {
            answer =  String(self.add())
        } else if(operateSymbol == CalculatorButton.subtract.name) {
            answer =   String(self.subtract())
        } else if(operateSymbol == CalculatorButton.multiply.name) {
            answer =   String(self.multipy())
        } else if(operateSymbol == CalculatorButton.divide.name) {
            answer =   String(self.divide())
        }
        return answer;
    }
    
    func clear() {
        //        todo
        _val1 = ""
        _val2 = ""
        state = CalculateState.initState
        display = "0"
        operateSymbol = ""
    }
    
    func _calculateVal1(value: String) {
        if(_isNumber) {
            updateVal1(val: value)
            self.display = self._val1
        } else if(_isNumberOperator) {
            if(value == CalculatorButton.dot.name) {
                self._val1 = toFloatingPoint(val: self._val1)

            } else if(value == CalculatorButton.plusMinus.name) {
                self._val1 = String(toOpposeValue(val: self._val1))

            } else if(value == CalculatorButton.percentage.name) {
                self._val1 = String(toPercentage(val: self._val1))
            }
            self.display = self._val1
        } else {
            self.operateSymbol = value
            state = CalculateState.secondInputState
        }
    }
    
    func _calculateVal2(value:String) {
        if(_isNumber) {
            updateVal2(val: value)
            state = CalculateState.secondInputState
        } else if (_isNumberOperator) {
            if(value == CalculatorButton.dot.name) {
                self._val2 = toFloatingPoint(val: self._val2)
            } else if(value == CalculatorButton.plusMinus.name) {
                self._val2 = String(toOpposeValue(val: self._val2))

            } else if(value == CalculatorButton.percentage.name) {
                self._val2 = String(toPercentage(val: self._val2))
            }
            self.display = self._val2
        } else {
            if(_isCalculateOperator || value == CalculatorButton.equal.name) {
                let answer = self._calculate()
                self.clear()
                self._val1 = answer
                self.display = answer
                if(_isCalculateOperator) {
                    operateSymbol = value
                }
                state = CalculateState.operationState
            }
        }
    }
    
    func calculate(value: String) {
        _isNumber = value.isNumber
        _isNumberOperator = value.isNumberOperator
        _isCalculateOperator = value.isCalculateOperator
        _isNumberPack = _isNumber || _isNumberOperator

        
        if (value == CalculatorButton.clear.name) {
            self.clear()
            return
        }
        
        if(state == CalculateState.initState) {
            if(_isNumber) {
                self._val1 = value
                state = CalculateState.firstInputState
            } else {
                if(value == CalculatorButton.dot.name) {
                    self._val1 = String("0.")
                }
            }
            self.display = self._val1
        } else if(state == CalculateState.firstInputState) {
            _calculateVal1(value: value)

        }else if(state == CalculateState.operationState) {

            if(_isCalculateOperator || value == CalculatorButton.equal.name) {

                if (value == CalculatorButton.equal.name) {
                    self._val1 = self._calculate()
                    self.display = self._val1
                    state = CalculateState.secondInputState
                } else {
                    self.operateSymbol = value
                }
            } else if(_isNumber) {
                if(operateSymbol == "") {
                    clear()
                    updateVal1(val: value)
                    state = CalculateState.firstInputState
                }else{
                    state = CalculateState.secondInputState
                    _calculateVal2(value: value)
                }
                
            } else if(_isNumberOperator) {
                _calculateVal1(value: value)
            }
            
            
        }else if(state == CalculateState.secondInputState) {
            _calculateVal2(value: value)

        } else {
            
        }
    }
}
