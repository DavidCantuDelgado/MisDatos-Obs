//
//  User.swift
//  MisDatosObs
//
//  Created by David A Cantú Delgado on 19/02/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var nombre: String
    @Published var correo: String
    @Published var telefono: String
    @Published var fechaNacimiento: Date
    @Published var estatura: Double
    @Published var peso: Int
    @Published var salud: Int
    
    init(nombre: String, correo: String, telefono: String, fechaNacimiento: Date, estatura: Double, peso: Int, salud: Int) {
        self.nombre = nombre
        self.correo = correo
        self.telefono = telefono
        self.fechaNacimiento = fechaNacimiento
        self.estatura = estatura
        self.peso = peso
        self.salud = salud
    }
}

extension User {
    static let usuarioInicial = User(nombre: "Ejemplo", correo: "Ejemplo@tec.mx", telefono: "0000000000", fechaNacimiento: Date(), estatura: 1.80, peso: 80, salud: 0)
}
