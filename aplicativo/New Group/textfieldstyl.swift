//
//  textfieldstyl.swift
//  aplicativo
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct textfieldstyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(Color(.blue))
            .cornerRadius(10)
        
        
        
        
    }
}
