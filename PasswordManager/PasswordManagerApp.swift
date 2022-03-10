//
//  PasswordManagerApp.swift
//  PasswordManager
//
//  Created by Mehdi on 1/20/22.
//

import SwiftUI

@main
struct PasswordManagerApp: App {
    @ObservedObject var safeRealmVM = SafeRealmViewModel()
    @State var showPasswordManagerView = false
    
    var body: some Scene {
        WindowGroup {
            PasswordManagerView()
        }
    }
}
