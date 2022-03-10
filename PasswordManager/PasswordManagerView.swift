//
//  PasswordManagerView.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI

struct PasswordManagerView: View {
    @ObservedObject var safeRealmVM = SafeRealmViewModel()
    @State var test = String()
    @State var dismissAlert = false
    
    var body: some View {
        ZStack {
            
            if dismissAlert == false {
                AlertViewWithTextfield { text in
                    
                    if !text.isEmpty {
                        let result = safeRealmVM.loadSafeRealmWith(password: text)
                        
                        switch result {
                        case .success(()):
                            withAnimation(.spring()) {
                                dismissAlert.toggle()
                            }
                        case .failure( _ ):
                            print("err")
                        }
                        
                    } else {
                        print("Textfield is empty")
                    }
                }
                
            } else {
                VStack {
                    Spacer()
                    AddPasswordBtn()
                        .padding()
                }
            }
        }
    }
}

struct PasswordManagerView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordManagerView()
    }
}

#warning("Import WaitForIt kit for error handling")
