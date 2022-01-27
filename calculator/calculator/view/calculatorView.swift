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
    
    var buttonWidth = (UIScreen.main.bounds.width - 4 * 16) / 4
    var buttonHeight = (UIScreen.main.bounds.height - 6 * 16) / 6
    
    var body: some View {
        VStack{
            Text(manager.getDisplay())
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                .foregroundColor(.white)
                .multilineTextAlignment(.trailing)
                .background(Color(red: 40/255, green: 36/255, blue: 37/255))
                .font(.system(size: 30))

            
            VStack  {

                ForEach(manager.buttons, id: \.self) { row in
                    HStack  {
                        ForEach(row, id: \.self) { button in
                            Button(button.name) {
                                manager.calculate(value: button.name)
                                print("state \(manager.state) | \(manager._val1) | \(manager._val2) | \(manager.operateSymbol) | \(manager.display) |\(button.name) ")

                            }
                            .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Container@*/VStack/*@END_MENU_TOKEN@*/ {
                                manager.getBgColor(value: button.name)
                            })
                            .font(.system(size: 25))
                            
                            .foregroundColor(.white)
                            .border(.black)
                            //                                Spacer()
                        }
                    }
                }
            }
        }
    }
}
