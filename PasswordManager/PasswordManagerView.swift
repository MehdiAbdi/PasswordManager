//
//  PasswordManagerView.swift
//  PasswordManager
//
//  Created by Mehdi on 1/30/22.
//

import SwiftUI
import Combine

struct PasswordManagerView: View {
    @AppStorage("com.passwordmanager.alerttitle", store: UserDefaults(suiteName: "com.passwordmanager.alerttitle"))
    private var alertTitleSwitch = false
    private let deviceW = UIScreen.main.bounds.width / 1.1
    private let deviceH = UIScreen.main.bounds.height / 1.27
    
    @StateObject private var safeRealmVM = SafeRealmViewModel()
    @State private var subscription = Set<AnyCancellable>()
    @State private var dismissAlert = false
    @State private var showAddBtnView = false
    
    var body: some View {
        ZStack {
            if dismissAlert == false {
                alertView()
                
            } else {
                ZStack {
                    VStack {
                        Spacer()
                        if safeRealmVM.isPasswordsEmpty {
                            Text("No Password Found")
                                .fontWeight(.bold)
                            
                        } else { passwordList() }
                        
                        Spacer()
                        AddPasswordBtn(action: {
                            showAddBtnView.toggle()
                        })
                            .padding()
                    }
                    
                    if showAddBtnView {
                        Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.7)
                            .onTapGesture {
                                showAddBtnView.toggle()
                            }
                    }
                    
                    VStack {
                        Spacer()
                        if showAddBtnView {
                            doneBtn()
                        }
                    }
                }
            }
        }
    }
    
    private func alertView() -> some View {
        return AlertViewWithTextfield(title: alertTitleSwitch ? "Enter Your Password" : "Set Your Password")
        { text in
            if !text.isEmpty {
                let result = safeRealmVM.loadSafeRealmWith(password: text)
                
                switch result {
                case .success(()):
                    dismissAlert.toggle()
                    alertTitleSwitch = true
                case .failure( _ ):
                    print("err")
                }
                
            } else {
                print("Textfield is empty")
            }
        }
    }
    
    func passwordList() -> some View {
        Rectangle()
            .stroke(lineWidth: 4.5)
            .frame(width: deviceW, height: deviceH)
            .overlay {
                List {
                    ForEach(safeRealmVM.passwords!, id: \.self) { item in
                        PasswordCellView(passwords: item)
                            .frame(height: 80)
                            .listRowSeparator(.hidden)
                            .padding(.top, 5)
                            .buttonStyle(.plain)
                    }
                }
                .listStyle(.plain)
            }
    }
    
    func doneBtn() -> some View {
        AddPasswordView {
            showAddBtnView.toggle()
            
        } doneAction: { form in
            if !form.email.isEmpty && !form.website.isEmpty && !form.password.isEmpty {
                safeRealmVM.save(password: form)
                    .sink { completion in
                        switch completion {
                        case .finished:
                            showAddBtnView.toggle()
                            
                        case .failure(let err):
                            print("---- Error \(err)")
                        }
                    } receiveValue: { _ in }
                    .store(in: &subscription)
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct PasswordManagerView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordManagerView()
    }
}


