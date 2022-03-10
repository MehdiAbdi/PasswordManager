//
//  DismissViewBtn+View.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI

struct DismissViewBtn: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Button {
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                Image(systemName: "xmark.square.fill")
                    .font(.system(size: 33, weight: .heavy, design: .rounded))
                    .foregroundColor(.black)
            }
        }
    }
}

struct DismissViewBtn_View_Previews: PreviewProvider {
    static var previews: some View {
        DismissViewBtn()
    }
}
