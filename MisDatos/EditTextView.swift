//
//  EditTextView.swift
//  MisDatos
//
//  Created by David A Cantú Delgado on 19/02/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import SwiftUI

struct EditTextView: View {
    
    var imagen: String
    var texto: String
    var tamaño: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: imagen)
                .foregroundColor(Color.fondo)
                .imageScale(.large)
            Text(texto)
                .foregroundColor(Color.fondo)
                .font(.Galada(size: tamaño))
        }
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditTextView(imagen: "person.fill", texto: "Nombre", tamaño: 20)
    }
}
