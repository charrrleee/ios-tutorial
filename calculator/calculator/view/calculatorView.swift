//
//  calculatorView.swift
//  calculator
//
//  Created by Charlene Cheung on 18/1/2022.
//

import Foundation

import SwiftUI

struct CalculatorView: View {
    var buttonWidth = (UIScreen.main.bounds.width - 5 * 16) / 4

    var body: some View {
        VStack{
            // light/dark mode
            // formula
//            HStack {
//                Text("308")
//                Text("x")
//                Text("42")
//            }
//            // answer
                VStack  {
                    Text("aaaa")
                    
                    ForEach(buttons, id: \.self) { row in
                        HStack  {
                            ForEach(row, id: \.self) { button in
//                                print(row)
                                Button(button.name) {
//                                    button
//                                    print(row)
                                    print(button)
                                }.padding()
                            }
                        }
                    }
                }.padding(.bottom)
        }
    }
}
