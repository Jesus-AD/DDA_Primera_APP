//
//  ContentView.swift
//  Segundo_programa
//
//  Created by alumno on 20/9/24.
//

import SwiftUI

struct ContentView: View {
    // Variables de estado para manejar la imagen y el texto
    @State private var imageIndex = 0
    @State private var textIndex = 0

    // Listas de imágenes y textos para cambiar
    let images = ["imagen1", "imagen2", "imagen3"]
    let texts = ["La noche estrellada remix!", "Desierto", "Animales de ensueño"]

    var body: some View {
        ZStack {
            // Fondo de gradiente que cubre toda la pantalla
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Imagen que cambiará cuando se presiona el botón
                Image(images[imageIndex])
                    .resizable()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.accentColor)
                    .clipShape(Circle())

                // Texto que cambiará cuando se presiona el botón
                Text(texts[textIndex])
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)

                // Botón que redirige a la web
                Link(destination: URL(string: "https://pixabay.com/es/")!) {
                    Text("Visita la página")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)

                // Botón para cambiar la imagen y el texto
                Button(action: {
                    // Cambiar imagen y texto al presionar el botón
                    imageIndex = (imageIndex + 1) % images.count
                    textIndex = (textIndex + 1) % texts.count
                }) {
                    Text("Cambiar imagen y texto")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)  // Espaciado adicional arriba
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
