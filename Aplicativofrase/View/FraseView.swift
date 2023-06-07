//
//  FrasesView.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct FraseView: View {
    var body: some View{
        NavigationView {
            VStack {
                TabView{
                    FraseViewMenu()
                        .tabItem {
                            Label("Home",systemImage: "house")
                        }
                    SettingsView()
                        .tabItem{
                            Label("Settings",systemImage: "gearshape")
                                    
                                        
                                }
                        }
                }
            }
        }
    }

    struct FraseViewMenu: View {
        let viewmodel = ViewModel()
        @State var text: String = ""
        var body: some View{
            VStack{
                Text("Bem vindo ao seu gerador de frases")
                    .padding()
                    .font(.system(size: 20, design: .default))
                    .bold()
                    .foregroundColor(.pink)
                Spacer()
                
                Button("Gerar frase:") {
                    
                    text = viewmodel.gerarFrase()
                }
                .frame(width: 170,height: 40)
                .background(.yellow)
                .cornerRadius(10)
                Text("\(text)")
                    .font(.system(size: 35, weight: .semibold))
                    .foregroundColor(.pink)
                Spacer()
                
            }
        }
    }


    struct FraseView_Previews: PreviewProvider{
        static var previews: some View {
            FraseView()
        }
    }
    

