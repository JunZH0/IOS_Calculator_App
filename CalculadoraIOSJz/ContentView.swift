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
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
    [.limpiar, .negativo, .porcentaje ,.division],
    [.siete, .ocho, .nueve, .multiplicacion],
    [.cuatro, .cinco, .seis, .resta],
    [.uno, .dos, .tres],
    [.cero, .decimal, .igual]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Spacer()
                    Text("0")
                        .bold()
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                        
    
                }
                .padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            })
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
