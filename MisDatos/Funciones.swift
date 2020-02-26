//
//  Funciones.swift
//  MisDatos
//
//  Created by David A Cantú Delgado on 25/02/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import Foundation
import SwiftUI

func FormatoEstatura(estatura: Double) -> String {
    return String(format: "%.2f", estatura)
}

func ColorSalud(indSalud: Int) -> Color {
    switch indSalud {
    case 0:
        return Color.green
    case 1:
        return Color.yellow
    case 2:
        return Color.red
    default:
        return Color.green
    }
    
}
