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
        
        VStack(spacing: 10){
            Text("Digite frase para adiciona:")
            TextField("Adicionar frase", text: $stringadicionar, prompt: Text("Digite"))
                .padding()
                .frame(width: 300,height: 40,alignment: .center)
                .cornerRadius(10)
                .background(Color.black.opacity(0.10))
             
            Button("Clique para salvar"){
                setmodel.adicionarFrase(fraseparasalvar: stringadicionar)
                
            }   .buttonStyle(buttonblu())
                .frame(width: 200,height: 32, alignment: .center)
                .alert("Frase foi adicionada", isPresented: $setmodel.isAparece, actions: {}) {
                    
                }
            Text("Digite a frase para remove:")
            TextField("Remover frase", text: $stringremove, prompt: Text("Digite"))
                .padding()
                .frame(width: 300,height:40,alignment: .center)
                .background(Color.black.opacity(0.10))
                .cornerRadius(10)
              
            Button("Clique para remover:"){
                setmodel.removerFrase(frasepararetirar: stringremove)
            }   .buttonStyle(buttonblu())
                .frame(width: 200,height: 32 ,alignment: .center)
                .alert("Deu errado",isPresented: $setmodel.isUnused,actions: {}){
                }
                .alert("Deu certo", isPresented: $setmodel.isOk, actions: {}){
                    
                }
            
            
            }
            
            Button("Clique para listar as frases:"){
                setmodel.isVisible.toggle()
            }.buttonStyle(buttonblu())
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

