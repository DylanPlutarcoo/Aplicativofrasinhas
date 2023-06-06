//
//  CustomTextFieldStyle.swift
//  TestFix
//
//  Created by userext on 05/06/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(Color(.blue))
            .cornerRadius(10)
    }
}
