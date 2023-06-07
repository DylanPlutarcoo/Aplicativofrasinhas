//
//  FrasesLista.swift
//  Aplicativofrase
//
//  Created by userext on 07/06/23.
//

import SwiftUI

struct VerFrases: View {
    @StateObject var verfrasesmodel = ViewModel()
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
           
        if verfrasesmodel.isVisible {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.verfrasesmodel.frases,id:\.self){frase in
                        Text(frase)
                    }
                    }
                }
            }
        }
    }
}
                struct VerFrases_Previews: PreviewProvider {
                    static var previews: some View {
                        VerFrases()
                    }
                }
            
        
   


