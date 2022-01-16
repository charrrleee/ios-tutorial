//
//  ContentView.swift
//  calculator
//
//  Created by yan on 15/1/2022.
//

import SwiftUI

enum CalcatorButten: String {
    case clear, sign, percentage, divide, multiply, subtract, adding, one, two, three, four, five, six, seven, eight, nine, zero, dot, equal
    
    var name: String {
        switch self {
        case .clear: return "A/C"
        case .sign: return "+/-"
        case .percentage: return "%"
        case .divide: return "/"
        case .multiply: return "x"
        case .subtract: return "-"
        case .adding: return "+"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .dot: return "."
        case .zero: return "0"
        case .equal: return "="
        }
    }
}


struct ContentView: View {
    var buttonWidth = (UIScreen.main.bounds.width - 5 * 16) / 4
    let buttons: [[CalcatorButten]] = [
        [.clear, .sign, .percentage, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .adding],
        [.zero, .dot, .equal]
    ]
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
            Text("12936")

            ZStack (alignment: .bottom) {
//                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack  {
                    Text("aaaa")
                    
                    ForEach(buttons, id: \.self) { row in
                        HStack  {
                            ForEach(row, id: \.self) { button in
//                                print(row)
                                Button(button.name) {
                                    button
//                                    print(row)
                                    print(button)
                                }
                            }
                        }
                    }
                }.padding(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
