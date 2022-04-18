//
//  PasswordCellView.swift
//  PasswordManager
//
//  Created by Mehdi on 1/20/22.
//

import SwiftUI

struct PasswordCellView: View {
    @State var passwords: PasswordModel
    var cellWidth: CGFloat? = 320
    var clipboard = UIPasteboard.general
    
    init(passwords: PasswordModel, cellWidth: CGFloat) {
        self.passwords = passwords
        self.cellWidth = cellWidth
    }
    
    init(passwords: PasswordModel) {
        self.passwords = passwords
    }
    
    var body: some View {
        Rectangle()
            .stroke(lineWidth: 3)
//            .frame(width: cellWidth, height: 80)
            .overlay {
                HStack {
                    
                    VStack (alignment: .leading){
                        Text(passwords.website)
                            .font(.system(size: 22, weight: .bold, design: .monospaced))
                            .padding(.bottom, 10)
                        
                        Text(verbatim: passwords.email)
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                    }.frame(width: 170, alignment: .leading)
                    Spacer()
                    
                    copyPassword()
                        .padding(.trailing, 5)
                    copyEmail()
                }.padding()
                    .foregroundColor(.black)
            }
    }
    
    func copyEmail() -> some View {
        return Button {
            clipboard.string = passwords.email
            print("Copied")
        } label: {
            Image("at_Image")
                .resizable()
                .frame(width: 40, height: 30)
        }
    }
    
    func copyPassword() -> some View {
        return Button {
            clipboard.string = passwords.password
            print("Copied")
        } label: {
            Image("lock_image")
                .resizable()
                .frame(width: 40, height: 30)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordCellView(passwords: PasswordModel(website: "Google.com", email: "appleseed.john@iCloud.com", password: "123456"))
    }
}
