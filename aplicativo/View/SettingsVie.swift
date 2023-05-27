//
//  SettingsVie.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI

// published é state do observebleobject
// state object é quando instancia um observeblaobject


struct settingsView: View {
    @State var stringremove: String = ""
    @StateObject private var setmodel = ViewModel()
    
    let columns = [
        GridItem(.flexible())
    ]
    
    @State var stringadicionar: String = ""
    var body: some View{
        VStack{
            Text("Digite frase para adiciona:")
            TextField("Adicionar frase", text: $stringadicionar, prompt: Text("Digite"))
                .frame(width: 100,height: 40,alignment: .center)
                .textFieldStyle(textfieldstyle())
            Button("Clique para salva"){
                setmodel.salvar(frases: Phrase(frases: [stringadicionar]))
                }
                .buttonStyle(buttonblu())
                .frame(width: 70,height: 32, alignment: .center)
            Text("Digite a frase para remove")
            TextField("Remover frase", text: $stringremove, prompt: Text("Digite"))
                .frame(width: 100,height:40,alignment: .center)
                .textFieldStyle(textfieldstyle())
            Button("Clique para salva"){
                setmodel.salvar(frases: Phrase(frases: [stringremove]))
            }

                .buttonStyle(buttonblu())
                .frame(width: .infinity,height: 32 ,alignment: .center)
            Button("Clique para listar as frases:"){
                setmodel.isVisible.toggle()
            }
            if setmodel.isVisible {
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(self.setmodel.frases,id:\.self){frase in
                            Text(frase)
                        }
                        
                        
                    }
                    
                }
            }
        }
    }
}
