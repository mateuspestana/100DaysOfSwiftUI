//
//  ContentView.swift
//  WeSplit
//
//  Created by Mateus Pestana on 29/05/20.
//  Copyright © 2020 Mateus Pestana. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    
    @State private var valorConta = ""
    @State private var numeroDePessoas = 2
    @State private var pctGorjeta = 2
    
    let pctGorjetas = [10, 15, 20, 25, 0]
    
    var totalPorPessoa: Double {
        let contagemPessoas = Double(numeroDePessoas + 2)
        let selecaoGorjeta = Double(pctGorjetas[pctGorjeta])
        let ordemValor = Double(valorConta) ?? 0
        
        let valorGorjeta = ordemValor / 100  * selecaoGorjeta
        let grandTotal = ordemValor + valorGorjeta
        let totalPorPessoa = grandTotal / contagemPessoas
        
        return totalPorPessoa
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Valor", text: $valorConta)
                        .keyboardType(.decimalPad)
                    
                    Picker("Número de pessoas", selection: $numeroDePessoas) {
                        ForEach(2..<100) {
                            Text("\($0) pessoas")
                        }
                    }
                    
                }
                
                Section(header: Text("Quanto de gorjeta vocês querem deixar?")) {
                    Picker("Gorjeta", selection: $pctGorjeta) {
                        ForEach(0 ..< pctGorjetas.count) {
                            Text("\(self.pctGorjetas[$0])%")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section  {
                    
                    Text("R$ \(totalPorPessoa, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
        
        
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
