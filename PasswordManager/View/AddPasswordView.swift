//
//  AddPasswordView.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI

struct AddPasswordView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 360)
                .foregroundColor(.white)
            
        }
    }
}

struct AddPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordView()
            .previewLayout(.fixed(width: 350, height: 360))
    }
}
