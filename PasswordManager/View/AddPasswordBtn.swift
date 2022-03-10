//
//  AddPasswordBtn.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI

struct AddPasswordBtn: View {
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Rectangle()
                    .stroke(lineWidth: 4)
                    .frame(width: 73, height: 50)
                
                Button {
                    
                } label: {
                    Image(systemName: "plus.square.fill")
                        .font(.system(size: 33, weight: .heavy, design: .rounded))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct AddPasswordBtn_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordBtn()
    }
}
