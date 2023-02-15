//
//  ContentView.swift
//  CalculadoraIOSJz
//
//  Created by Usuario invitado on 15/2/23.
//

import SwiftUI

enum CalcButton: String{
    case uno
    case dos
    case tres
    case cuatro
    case cinco
    case seis
    case siete
    case ocho
    case nueve
    case cero
    case suma
    case resta
    case division
    case multiplicacion
    case limpiar
    case decimal
    case negativo
    case porcentaje
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
    [.siete, .ocho, .nueve]
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
