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

}
