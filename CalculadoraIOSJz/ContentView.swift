//
//  ContentView.swift
//  CalculadoraIOSJz
//
//  Created by Usuario invitado on 15/2/23.
//

import SwiftUI

enum CalcButton: String{
    case uno = "1"
    case dos = "2"
    case tres = "3"
    case cuatro = "4"
    case cinco = "5"
    case seis = "6"
    case siete = "7"
    case ocho = "8"
    case nueve = "9"
    case cero = "0"
    case suma = "+"
    case resta = "-"
    case division = "/"
    case multiplicacion = "x"
    case igual = "="
    case limpiar = "C"
    case decimal = "."
    case negativo = "%"
    case porcentaje = "-/+"
    
    
    // Para evitar el hardcodeo de los colores
    
    var buttonColor: Color {
        switch self {
            case .suma, .resta, .multiplicacion, .division, .igual:
            return .orange
        case .limpiar, .negativo, .porcentaje:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue:
                                    55/255.0, alpha: 1))
        
        }
    }
}

enum Operation {
    case suma, resta, multiplicacion, division, none
}


struct ContentView: View {

    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
    [.limpiar, .negativo, .porcentaje ,.division],
    [.siete, .ocho, .nueve, .multiplicacion],
    [.cuatro, .cinco, .seis, .resta],
    [.uno, .dos, .tres, .suma],
    [.cero, .decimal, .igual]
    ]
    
    
    // Texto
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        
    
                }
                .padding()
                
                // Botones
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.dipTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item),
                                           height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                    }
                }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func dipTap(button: CalcButton) {
        switch button {
        case .suma, .resta, .multiplicacion, .division, .igual:
            if button == .suma {
                self.currentOperation = .suma
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .resta {
                self.currentOperation = .resta
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiplicacion {
                self.currentOperation = .multiplicacion
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .division {
                self.currentOperation = .division
                self.runningNumber = Int(self.value) ?? 0
            }
            
            // Al pulsar el boton igual realiza la operacion seleccionada con los numeros guardados
            else if button == .igual {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                
                switch self.currentOperation {
                case .suma: self.value = "\(runningValue + currentValue)"
                case .resta: self.value = "\(runningValue - currentValue)"
                case .multiplicacion: self.value = "\(runningValue * currentValue)"
                case .division: self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
           
            }
            
            if button != .igual {
                self.value = "0"
            }
            
            
        case .limpiar:
            self.value = "0"
        case .decimal, .negativo, .porcentaje:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    // Funcion para al ancho de los botones
    
        func buttonWidth(item: CalcButton) -> CGFloat {
            if item == .cero {
                return (UIScreen.main.bounds.width - (4*12)) / 4 * 2
            }
            return (UIScreen.main.bounds.width - (5*12)) / 4
        }
    
    // Funcion para el alto de los botones
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
