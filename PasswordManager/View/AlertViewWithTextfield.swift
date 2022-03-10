//
//  CustomTextfieldAlertView.swift
//  PasswordManager
//
//  Created by Mehdi on 2/28/22.
//

import SwiftUI

struct AlertViewWithTextfield: View {

    //MARK: - Properties
    @Environment(\.presentationMode) private var presentationMode
    @State private var alertPassword = String()
    var action: (_ text: String) -> ()
    
    //MARK: - body
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(lineWidth: 5)

            VStack {
                Text("Enter Your Password")
                    .padding()
                
                passwordTextField()
                
                Spacer()
                
                doneBtn()
                    .padding()
            }
        }.frame(width: 270, height: 190)
    }
    
    //MARK: - View Component
    func passwordTextField() -> some View {
        return ZStack {
            Rectangle()
                .stroke(lineWidth: 3)
                .frame(width: 240, height: 40)
            TextField("Password", text: $alertPassword)
                .padding(.leading, 30)
        }
    }
    
    func doneBtn() -> some View {
        return ZStack {
            Rectangle()
                .stroke(lineWidth: 3)
            
            Button {
                action(alertPassword)

            } label: {
                Text("Done")
                    .foregroundColor(.black)
            }
            
        }.frame(width: 90, height: 40)
    }
}


struct AlertViewWithTextfield_Previews: PreviewProvider {
    static var previews: some View {
        AlertViewWithTextfield { text in }
    }
}
