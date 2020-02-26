//
//  InfoView.swift
//  MisDatos
//
//  Created by David A Cantú Delgado on 19/02/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    //    init(){
    //        UITableView.appearance().backgroundColor = .clear
    //    }

    @ObservedObject var usuario: User
//    @Binding var nombre: String
//    @Binding var telefono: String
//    @Binding var correo: String
//    @Binding var estatura: Double
//    @Binding var peso: Int
//    @Binding var fechaNacimiento: Date
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }
    
    var estadoSalud = ["Buena","Regular","Mala"]
    
    
    
    var body: some View {
        ZStack {
            Color.principal
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                EditTextView(imagen: "person.fill", texto: "Nombre:", tamaño: 20)
                    TextField("Teléfono", text: $usuario.nombre)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(Color.fondo)
                    .font(.Galada(size: 20))
                }
                    .padding([.trailing, .leading],10)
                HStack {
                    EditTextView(imagen: "phone.fill", texto: "Teléfono", tamaño: 20)
                    TextField("Teléfono", text: $usuario.telefono)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.fondo)
                        .font(.Galada(size: 20))
                }
                    .padding([.trailing, .leading],10)
                HStack {
                    EditTextView(imagen: "envelope.fill", texto: "Correo", tamaño: 20)
                    TextField("Correo", text: $usuario.correo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.fondo)
                        .font(.Galada(size: 20))
                }
                    .padding([.trailing, .leading],10)
                EditTextView(imagen: "heart.fill", texto: "Salud", tamaño: 20)
                Picker(selection: $usuario.salud, label: Text("¿Cual es el estado de tu salud?")) {
                    ForEach(0..<estadoSalud.count) { index in
                        Text(self.estadoSalud[index])
                            .font(.Galada(size: 20))
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                Slider(value: $usuario.estatura, in: (1.50...2.10))
                    .padding([.trailing, .leading],40)
                Text("Estatura: \(usuario.estatura, specifier: "%.2f") mts")
                    .foregroundColor(Color.fondo)
                    .font(.Galada(size: 20))
                    .padding(4)
                Stepper(value: $usuario.peso, in: 45...120) {
                    Text("Peso: \(usuario.peso)")
                        .foregroundColor(Color.fondo)
                        .font(.Galada(size: 20))
                }
                .padding([.trailing, .leading],40)
                EditTextView(imagen: "calendar", texto: "Fecha de Nacimiento", tamaño: 20)
                DatePicker(selection: $usuario.fechaNacimiento, in: ...Date(), displayedComponents: .date) {
                    Text("\(dateFormatter.string(from: usuario.fechaNacimiento))")
                }
                .foregroundColor(Color.fondo)
                .padding(6)
              
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(usuario: User.usuarioInicial)
    }
}


