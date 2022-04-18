//
//  BlackBorderTextfield+View.swift
//  PasswordManager
//
//  Created by Mehdi on 3/18/22.
//

import SwiftUI

struct BlackBorderTextfieldView: ViewModifier {
    //    @State var placeholder: String
    //    @Binding var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content
                .padding(.leading, 10)
            
            Rectangle()
                .stroke(lineWidth: 3)
                .frame(height: 40)
        }
    }
}

extension View {
    func blackBorderTextfield() -> some View {
        return modifier(BlackBorderTextfieldView())
    }
}
