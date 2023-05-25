//
//  buttonstyle.swift
//  aplicativo
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct buttonblu: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(.blue))
            .cornerRadius(10)
    }
}
