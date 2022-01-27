//
//  calculateState.swift
//  calculator
//
//  Created by Charlene Cheung on 19/1/2022.
//

enum CalculateState {
    case initState // all the value and operator should be reset to zero or empty string
    case firstInputState // first input
    case operationState // input operator
    case secondInputState  //second input
    case finishState  // calculated
}
