//
//  ContentView.swift
//  MisDatos
//
//  Created by David A Cantú Delgado on 19/02/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var infoSheet = false
    @State private var esFormal = true
    @State private var menuIzq = "Informal"
    @State private var mifoto = "mifoto"

    @EnvironmentObject private var usuario: User
    
//    @State var telefono = "1111111111"
//    @State var correo = "david@tec.mx"
//    @State var nombre = "David Alonso Cantú Delgado"
//    @State var estatura = 1.80
//    @State var peso = 80
//    @State var fechaNacimiento = Date()

    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.fondo
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(usuario.nombre)
                        .foregroundColor(Color.principal)
                        .font(.Galada(size: 24))
                        .padding([.leading,.trailing],20)
                    Image(mifoto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(ColorSalud(indSalud: usuario.salud), lineWidth: 4)
                            
                        )
                    
                        .shadow(radius: 10)
                        .padding([.bottom],40)
                    DisplayView(texto: usuario.telefono, imagen: "phone.fill", tamaño: 20)
                    DisplayView(texto: usuario.correo, imagen: "envelope.fill", tamaño: 20)
                    DisplayView(texto: "\(dateFormatter.string(from: usuario.fechaNacimiento))", imagen: "calendar", tamaño: 20)
                    DisplayView(texto: "\(usuario.peso)kg - \(FormatoEstatura(estatura: usuario.estatura))mts", imagen: "heart.fill", tamaño: 20)
                    

                }
                
            }
            .navigationBarItems(
            leading: Button(
              action: {
                self.esFormal.toggle()
                if self.esFormal {
                    self.mifoto = "mifoto"
                    self.menuIzq = "Informal"
                } else {
                    self.mifoto = "mifoto_informal"
                    self.menuIzq = "Formal"
                }
            },
              label: {
                Text(self.esFormal ? "Informal" : "Formal")
                .foregroundColor(Color.principal)
                    .font(.Galada(size: 24))
                
            }
            ),
            trailing:
            Button(action: {
                self.infoSheet.toggle()
            }, label: {
                Image(systemName: "person.fill")
                    .foregroundColor(Color.principal)
                    .imageScale(.large)
            }))
                
            .sheet(isPresented: $infoSheet, content: {
//                InfoView(nombre: self.$nombre, telefono: self.$telefono, correo: self.$correo, estatura: self.$estatura, peso: self.$peso, fechaNacimiento: self.$fechaNacimiento)
                InfoView(usuario: self.usuario)
            })
            
        }
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

