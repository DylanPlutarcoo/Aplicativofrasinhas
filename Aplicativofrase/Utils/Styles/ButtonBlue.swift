//
//  ButtonBlue.swift
//  TestFix
//
//  Created by userext on 05/06/23.
//

import SwiftUI

struct ButtonBlue: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(.blue).opacity(0.5))
            .cornerRadius(10)
    }
}

