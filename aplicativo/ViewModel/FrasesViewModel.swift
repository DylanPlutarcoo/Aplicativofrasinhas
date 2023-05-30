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
    // static é pra acessar sem instanciar ("acesso global") n muda com instancia
    static  var documentsDirectory: URL {
        return ViewModel.fileManager.urls(for: .documentDirectory, in: .allDomainsMask).first!
    }
    static var jsonURL: URL {
        return ViewModel.documentsDirectory.appendingPathComponent("strings.json")
    }
    
    var frases: [String] = ["d", "y", "l", "a", "n" ]
    //struct frases: Identifiable{
    // let id = UUID()
    //
    //
//}
    @Published var isVisible: Bool = f
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
    //encode
    var fraseescrita = ""

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
    //func:
    var option = ""
    var frasesNovas: [String] = [""]
    func adicionarFrase(fraseparasalvar: String){
        // private func so existe dentro da func
        // public so oq view precisa ver
        while option != "c" {
            print("Digite 'a' para adicionar uma frase 'b' para salvar e 'c' para sair")
            if let carat = readLine() {
                option = carat
            }
            switch option.lowercased() {
            case "a":
                print("Escreva:")
                   if let frasesNova = readLine(), !frasesNova.isEmpty {
                    if frasesNova != ""{
                        frasesNovas.append(frasesNova)

                    }
                    else {
                        print( "Nenhuma frase foi digitada")
                        break
                    }
                }
            case "b":
                frases.append(contentsOf: frasesNovas)
                salvar(frases: Phrase(frases: frases))
                print("A frases salvas")
            case "c":
                break
            default:
                print("opção incorreta")
            }
        }
    }
    
    func gerarFrase () -> String {
        guard let fraseAleatorio = frases.randomElement() else { return ""}
        return fraseAleatorio
    }

    var fraseRetirar: String = ""
    
    func removerFrase(frasepararetirar: String){
            let frasetirar = frasepararetirar
        
            if frases.contains(frasetirar) {
                fraseRetirar = frasetirar
                guard let index = frases.firstIndex(of: "\(fraseRetirar)")
                else { return }
                // thorw trata erros de maneira "sofisticada" tipo com enumns
               var indexRetirar = index
                frases.remove(at: indexRetirar)

            }
            
        salvar(frases: Phrase(frases: frases))

    }


    
//    func listarFrase() -> some View{
//      //  scrollview, lazyvgrid, identiable
//        let columns = [
//            GridItem()
//        ]
//       return ScrollView{
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(frases,id:\.self){frase in
//                    Text(frase)
//                }
//
//
//            }
//
        
    }

       

    
}
