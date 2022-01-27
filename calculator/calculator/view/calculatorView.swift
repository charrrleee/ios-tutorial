//
//  calculatorView.swift
//  calculator
//
//  Created by Charlene Cheung on 18/1/2022.
//

import Foundation

import SwiftUI

struct CalculatorView: View {
    @ObservedObject
    var manager: CalculatorViewMode = CalculatorViewMode()
    
    var buttonWidth = (UIScreen.main.bounds.width - 5 * 16) / 4
    var buttonHeight = (UIScreen.main.bounds.height - 5 * 16) / 6
    
    var body: some View {
        VStack{
            Text(manager.display)
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
                .background(.gray)
            
            VStack  {

                ForEach(manager.buttons, id: \.self) { row in
                    HStack  {
                        ForEach(row, id: \.self) { button in
                            Button(button.name) {
                                manager.calculate(value: button.name)
                                print("state \(manager.state) | \(manager._val1) | \(manager._val2) | \(manager.operateSymbol) | \(button.name)")

                            }
                            .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                            //                                .padding(.horizontal, 10.0)
                            //                                .padding(.vertical, 5.0)
                            .background(.gray)
                            
                            .foregroundColor(.white)
                            .border(.red)
                            //                                Spacer()
                        }
                    }
                }
            }
        }
    }
}
