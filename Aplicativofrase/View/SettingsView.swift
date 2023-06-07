//
//  SettingsVie.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI

// published é state do observebleobject
// state object é quando instancia um observeblaobject

struct SettingsView: View {
    @State var stringremove: String = ""
    @State var stringadicionar: String = ""
    @StateObject private var setmodel = ViewModel()
    
//    let columns = [
//        GridItem(.flexible())
//    ]
//    
    var body: some View {
        VStack(alignment: .leading ,spacing: 10) {
            //            ScrollView{
            //                Spacer()
            Text("Digite frase para adicionar:")
            TextField("Adicionar frase", text: $stringadicionar, prompt: Text("Digite"))
                .padding()
                .frame(width: 200,height: 40,alignment: .center)
                .background(Color.black.opacity(0.10))
                .cornerRadius(10)
            
            Button("Salvar"){
                setmodel.adicionarFrase(fraseparasalvar: stringadicionar)
                
            }
            .buttonStyle(ButtonBlue())
            .frame(width: 200,height: 40, alignment: .center)
            .alert("Frase foi adicionada", isPresented: $setmodel.isAparece, actions: {
                Text("Frase adicionada")
            })
            
            Text("Digite a frase para remover:")
            TextField("Remover frase", text: $stringremove, prompt: Text("Digite"))
                .padding()
                .frame(width: 200,height:50,alignment: .center)
                .background(Color.black.opacity(0.10))
                .cornerRadius(10)
            
            Button("Remover"){
                setmodel.removerFrase(frasepararetirar: stringremove)
            }
            .buttonStyle(ButtonBlue())
            .frame(width: 200,height: 32 ,alignment: .center)
            .alert("Deu errado",isPresented: $setmodel.isUnused, actions: {}) {}
            .alert("Deu certo", isPresented: $setmodel.isOk, actions: {}) {}
            
            Button("Listar Frases") {
                setmodel.sheetview.toggle()
                    
            }
            .buttonStyle(ButtonBlue())
//            Spacer()
                .frame(width: 200,height: 50)
            
                .sheet(isPresented: $setmodel.sheetview) {
                    VerFrases()
                }
//            if setmodel.isVisible {
//                ScrollView{
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(self.setmodel.frases,id:\.self){frase in
//                            Text(frase)
//                        }
                    }
                    
                }
            }
//        }
//    }
//}
//}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
