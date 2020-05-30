//
//  ContentView.swift
//  TempConverter
//
//  Created by Mateus Pestana on 30/05/20.
//  Copyright © 2020 Mateus Pestana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Variáveis
    
    @State private var userInput = ""
    @State private var unitInputI = 0
    @State private var unitOutputI = 1
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    let unitSymbols = ["ºC", "ºF", "K"]
    
    var appOutput: Double {
        let inputValor = Double(userInput) ??  0
        let unitInput = units[unitInputI]
        let unitOutput = units[unitOutputI]
        if unitInput == unitOutput {
            return inputValor
        }  else {
            switch unitInput {
            case "Celsius":
                if unitOutput == "Fahrenheit" {
                    return CpF(valor: inputValor)
                } else {
                    return CpK(valor: inputValor)
                }
            case "Fahrenheit":
                if unitOutput == "Celsius" {
                    return FpC(valor: inputValor)
                } else {
                    return FpK(valor: inputValor)
                }
            case "Kelvin":
                if unitOutput == "Celsius" {
                    return KpC(valor: inputValor)
                } else {
                    return KpF(valor: inputValor)
                }
            default:
                return 0
            }
        }
    }
    
    //MARK: -  Funções
    
    private func CpK(valor: Double) -> Double {
        return valor + 273.15
    }
    
    private func FpK(valor: Double) -> Double {
        return CpK(valor: FpC(valor: valor))
    }
    
    private func CpF(valor: Double) -> Double {
        return valor * 9 / 5 + 32
    }
    
    private func KpF(valor: Double) -> Double {
        return CpF(valor: KpC(valor: valor))
    }
    
    private func FpC(valor: Double) -> Double {
        return (valor - 32) * 5 / 9
    }
    
    private func KpC(valor: Double) -> Double {
        return valor - 273.15
    }
    
    
    
    //MARK: - Body
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Qual a temperatura e em qual unidade?")) {
                    TextField("Temperatura", text: $userInput)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unidade de origem" , selection: $unitInputI) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0]) (\(self.unitSymbols[$0]))")
                        }
                    }
                    Picker("Unidade de destino", selection: $unitOutputI) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0]) (\(self.unitSymbols[$0]))")
                        }
                    }
                }
                Section (header: Text("Resultado")){
                    Text("\(appOutput, specifier: "%.1f")")
                }
            } .navigationBarTitle("TempConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
