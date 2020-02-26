//
//  DisplayView.swift
//  MisDatos
//
//  Created by David A Cantú Delgado on 19/02/20.
//  Copyright © 2020 Tec de Monterrey. All rights reserved.
//

import SwiftUI

struct DisplayView: View {
    
    var texto: String
    var imagen: String
    var tamaño: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25   )
        .fill(Color.principal)
        .frame(height:40)
        .overlay(
            HStack {
                Image(systemName: imagen)
                    .foregroundColor(Color.fondo)
                    .imageScale(.large)
                Text(texto)
                    .foregroundColor(Color.fondo)
                    .font(.Galada(size: tamaño))
                    .padding()
            })
            .padding([.leading,.trailing],20)
    }
}


struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(texto: "19 de Julio de 1968", imagen: "calendar", tamaño: 24)
    }
}
