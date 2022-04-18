//
//  AddPasswordBtn.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI

struct AddPasswordBtn: View {
    var action: () -> ()
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(lineWidth: 4)
                .frame(width: 73, height: 50)
            
            Button {
                action()
                
            } label: {
                Image(systemName: "plus.square.fill")
                    .font(.system(size: 33, weight: .heavy, design: .rounded))
                    .foregroundColor(.black)
            }
        }
    }
}

struct AddPasswordBtn_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordBtn { }
    }
}
