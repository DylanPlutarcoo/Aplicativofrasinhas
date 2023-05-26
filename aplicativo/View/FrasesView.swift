//
//  FrasesView.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct FraseView: View {
    let viewmodel = ViewModel()
    @State var text: String = ""
    
    var body: some View{
        NavigationView {
            VStack{
                Text("Bem vindo ao seu gerador de frases: ")
               //     .textstyle(
                    
                Button("Gerar frase:") {
                    
                        text = viewmodel.gerarFrase()
                }
                .background(.yellow)
                .cornerRadius(10)
               // .foregroundColor(.blue)
                
                Text("\(text)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.pink)
                
                
                NavigationLink(destination: settingsView()){
                    Image(systemName: "folder.badge.gearshape")
                        .foregroundColor(.pink)
                        
                        
                }.buttonStyle(buttonblu())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    .padding(.top)
                    
                }
                    
            }
        }
    }

