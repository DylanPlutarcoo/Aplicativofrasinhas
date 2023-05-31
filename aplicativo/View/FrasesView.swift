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
            VStack {
                HStack() {
                    
                    NavigationLink(destination: settingsView()){
                        Image(systemName: "folder.badge.gearshape")
                            .foregroundColor(.pink)
                        
                        
                    }.buttonStyle(buttonblu())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                        .padding(.top)
                    //     .textstyle(
                }
                
                Text("Bem vindo ao seu gerador de frases: ")
                    .padding()
                    .font(.system(size: 20, design: .default))
                    .bold()
                    .foregroundColor(.pink)
                Spacer()
                
                Text("\(text)")
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundColor(.pink)
                
                Button("Gerar frase:") {
                    
                    text = viewmodel.gerarFrase()
                }
                .frame(width: 170,height: 40)
                .background(.yellow)
                .cornerRadius(10)
                
                Spacer()
            }
        }.frame(height: .infinity)
        
    }
}


