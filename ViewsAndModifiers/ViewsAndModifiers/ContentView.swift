//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mateus Pestana on 30/05/20.
//  Copyright © 2020 Mateus Pestana. All rights reserved.
//

import SwiftUI

//MARK: - Estrutura Watermark
struct Watermark: ViewModifier {
	var text: String
	
	func body(content: Content) -> some View {
		ZStack(alignment: .bottomTrailing) {
			content
			Text(text)
				.font(.caption)
				.foregroundColor(.white)
				.padding(5)
				.background(Color.black)
		}
	}
}
//MARK: - Extensão Watermark
// Aqui eu crio uma função que se utiliza da estrutura Watermark
// pelo self.modifier
extension View {
	func watermarked(with text: String) -> some View {
		self.modifier(Watermark(text: text))
	}
}

//MARK: - Extensão tituloEstilo
// Aqui eu crio a função que utiliza a estrutura Title() que criei
// abaixo
extension View {
	func tituloEstilo() -> some View {
		self.modifier(Title())
	}
}
//MARK: - Estrutura Title
// Aqui eu crio a estrutura Title pra usar acima
struct Title: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
			.padding()
			.background(Color.blue)
			.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}
//MARK: - ViewModifier Challenge
struct ViewMod: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(Color.blue)
			.padding(100)
	}
}
extension View {
	func viewMod () -> some View {
		self.modifier(ViewMod())
	}
}
//MARK: - ContentView

struct ContentView: View {
	
	var body: some View {
		ZStack {
			Color.white
			VStack {
				Spacer()
				Text("Olá, mundo").viewMod()
				Text("Teste de título 2").tituloEstilo()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.edgesIgnoringSafeArea([.bottom, .top])
					.watermarked(with: "Mateus Pestana")
				// Acima eu uso a função da extensão (reparar no with:)
			}
		}
	}
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
		}
	}
}
