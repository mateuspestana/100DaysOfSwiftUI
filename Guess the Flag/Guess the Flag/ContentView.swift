//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Mateus Pestana on 30/05/20.
//  Copyright © 2020 Mateus Pestana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State var paises = ["Estônia", "França", "Alemanha", "Irlanda", "Itália", "Nigéria", "Polônia", "Rússia", "Espanha", "Reino Unido", "Estados Unidos", "Mônaco"].shuffled()
	
	@State var  respostaCerta = Int.random(in: 0...2)
	@State private var mostraPonto = false
	@State private var pontoTitle = ""
	@State private var score = 0
	
	func bandeiraPressed(_ número: Int) {
		if número == respostaCerta {
			pontoTitle  =  "Correto"
			score += 1
			
		} else {
			pontoTitle =  "Errado"
		}
		mostraPonto = true
	}
	
	func fazPergunta() {
		paises.shuffle()
		respostaCerta = Int.random(in: 0...2)
	}
	
	var body: some View {
		ZStack{
			LinearGradient(gradient: Gradient(colors: [.blue, .black]),startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
			
			VStack(spacing: 30){
				
				VStack {
					Text("Clique na bandeira do país...").foregroundColor(.white)
					
					Text(paises[respostaCerta])
						.foregroundColor(.white)
						.font(.largeTitle)
						.fontWeight(.black)
					
				}
				ForEach(0..<3) { número in
					Button(action: {
						self.bandeiraPressed(número)
					}) {
						Image(self.paises[número])
							.renderingMode(.original)
							.clipShape(Capsule())
							.overlay(Capsule().stroke(Color.black, lineWidth: 1))
							.shadow(color: .black, radius: 1.8)
					}
				}
				VStack {
					Text("Pontuação:")
						.foregroundColor(.white)
						.fontWeight(.bold)
					Text("\(score)")
						.foregroundColor(.white)
						.font(.largeTitle)
				}
			}
		}.alert(isPresented: $mostraPonto) {
			Alert(title: Text(pontoTitle), message: Text("Essa é a bandeira de \(paises[respostaCerta])!"), dismissButton: .default(Text("Continuar")) {
				self.fazPergunta()
				})
		}
	}
	
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
		}
	}
}
