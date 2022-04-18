//
//  AddPasswordView.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI

struct AddPasswordView: View {
    var dismissAction: () -> ()
    var doneAction: (_ form: PasswordModel) -> ()
    
    @State var form: PasswordModel = PasswordModel()
    @State var text = String()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 340, height: 360)
                .foregroundColor(.white)
            
                .overlay {
                    VStack {
                        HStack {
                            Spacer()
                            dismissBtn()
                                .padding(.trailing, 20)
                                .padding(.top, 10)
                        }
                        
                        textfieldForm()
                        Spacer()
                        doneBtn()
                    }
                }
        }
    }
    
    func textfieldForm() -> some View {
        VStack(alignment:. leading) {
            Text("Website")
            TextField("Google.com", text: $form.website)
                .blackBorderTextfield()
            
            Text("Email")
            TextField("Appleseed.john@gmail.com", text: $form.email)
                .blackBorderTextfield()
            
            Text("Password")
            SecureField("Your Secure Password", text: $form.password)
                .blackBorderTextfield()
            
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
    
    func doneBtn() -> some View {
        Button {
            doneAction(form)
        } label: {
            Rectangle()
                .stroke(lineWidth: 3)
                .frame(width: 100, height: 40)
                .foregroundColor(.black)
                .overlay {
                    Text("Done")
                        .foregroundColor(.black)
                }
        }.padding()
    }
    
    func dismissBtn() -> some View {
        Button {
            dismissAction()
        } label: {
            Image(systemName: "x.square.fill")
                .font(.system(size: 30, weight: .heavy, design: .default))
                .foregroundColor(.black)
        }
    }
}

struct AddPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordView {
            
        } doneAction: { form in
            
        }
        
        
        //                    .previewLayout(.fixed(width: 350, height: 360))
    }
}
