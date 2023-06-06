//
//  FrasesViewModel.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI

// state do observebleobject é published

class ViewModel: ObservableObject {
    // protocolo é conjunto de regras que indica que quem assina o protocolo tem que implementar as regras
    static let fileManager = FileManager.default

    @Published var isOk: Bool = false
    @Published var isUnused: Bool = false
    @Published var isAparece: Bool = false
    @Published var isVisible: Bool = false

    var fraseescrita = ""
    var fraseRetirar: String = ""

    var option = ""
    var frasesNovas: [String] = [""]

    var frases: [String] = ["d", "y", "l", "a", "n" ]

    // static é pra acessar sem instanciar ("acesso global") n muda com instancia
    static  var documentsDirectory: URL {
        return ViewModel.fileManager.urls(for: .documentDirectory, in: .allDomainsMask).first!
    }

    static var jsonURL: URL {
        return ViewModel.documentsDirectory.appendingPathComponent("strings.json")
    }

    func decodar () {
        let decoder = JSONDecoder()
        do {
            
            let dado = try Data(contentsOf: ViewModel.jsonURL)
            let objectDecode = try decoder.decode(Phrase.self, from: dado)
            frases = objectDecode.frases
        } catch{
            print("Não deu")
        }
    }
    
    //var frasenew = Phrase(frase: [frasesNovas])
    func salvar(frases: Phrase) {
        
        let encoder = JSONEncoder()
        do {
            let frasenewJSONData = try encoder.encode(frases)
            try frasenewJSONData.write(to: ViewModel.jsonURL)
        }  catch{
            print("erro")
        }
    }

    func adicionarFrase(fraseparasalvar: String){
        // private func so existe dentro da func
        // public so oq view precisa ver
        isAparece = true
        salvar(frases: Phrase(frases: frases))
    }

    func gerarFrase () -> String {
        guard let fraseAleatorio = frases.randomElement() else { return ""}
        return fraseAleatorio
    }

    func removerFrase(frasepararetirar: String) {
        let frasetirar = frasepararetirar
        if frases.contains(frasetirar) {
            fraseRetirar = frasetirar
            guard let index = frases.firstIndex(of: "\(fraseRetirar)")
            else { return }
            // thorw trata erros de maneira "sofisticada" tipo com enumns
            var indexRetirar = index
            frases.remove(at: indexRetirar)
            
            salvar(frases: Phrase(frases: frases))
            isOk = true
            isUnused = false
        } else {
           isOk = false
            isUnused = true
        }
    }
}
