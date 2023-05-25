//
//  SettingsVie.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI


struct settingsView: View {
    @State var stringremove: String = ""
    
    @State var stringadicionar: String = ""
    var body: some View{
        VStack{
            TextField("Adicionar frase", text: $stringadicionar, prompt: Text("Digite"))
            TextField("Remover frase", text: $stringremove, prompt: Text("Digite"))
            
        }
    }
}
