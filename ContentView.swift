//
//  ContentView.swift
//  stateAndBinding
//
//  Created by Marcelo Dominguez on 03/10/2022.
//

import SwiftUI



struct ContentView: View {
    
    //Binding: es la conexión entre una propiedad que almacena datos(variable) y una vista que cambia el valor(Textfield)
    
    
    
    @State private var x = "Titulo"
    var x1 = 2
    @State private var show = true
    @State private var numero = 0
    @State private var numeroMoneda = 123
    @State private var numeroMoneda2 = "0"
    

    func suma() -> Int {
        x = "Cambiando su valor" // variable viene de fuera se usa el State
        var x2 = 2 // se crea dentro de la funcion no se usa el state
        x2 = 4
        return x2
    }
    
    
    var body: some View {
        VStack{
            Text(x).font(.largeTitle)
            HStack {
                Button(action: {
                    show.toggle()
                    if show {
                        numero -= 1
                    } else {
                        numero += 1
                    }
                }) {
                    if show {
                        Image(systemName: "heart").foregroundColor(.red).font(.largeTitle)
                    } else {
                        Image(systemName: "heart.fill").foregroundColor(.red).font(.largeTitle)
                    }
                    Text(String(numero)).bold()
                }
                Button(action: {
                    numeroMoneda = numeroMoneda + Int(numeroMoneda2)!
                }) {
                    Image(systemName: "dollarsign.circle.fill").foregroundColor(.yellow).font(.largeTitle)
                }
                Text(String(numeroMoneda)).bold()
            }
            TextField("Donación", text: $numeroMoneda2)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Titulo", text: $x)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            vista2(x: $x)
            vista3(x: $x)
        }.padding(.all)
    }
}

struct vista2: View {
    @Binding var x: String
    var body: some View {
        Text(x).font(.largeTitle).foregroundColor(.red)
    }
}

struct vista3: View {
    @Binding var x: String
    var body: some View {
        Button(action: {
            x = "Nuevo titulo desde vista 3"
        }) {
            Text("Cambiar Titulo")
        }
    }
}



struct vista: View {
    
    var body: some View {
        Text("Nueva vista")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
