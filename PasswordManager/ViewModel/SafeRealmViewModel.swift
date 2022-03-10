//
//  SafeRealmViewModel.swift
//  PasswordManager
//
//  Created by Mehdi on 3/3/22.
//
import Foundation
import RealmSwift

class SafeRealmViewModel: ObservableObject {
    @Published var passwords: Results<PasswordModel>?
    private var safeRealm: Realm?
    
    func loadSafeRealmWith(password: String) -> Result<Void ,Error> {
        let realmConfig = RealmConfiguration.safeRealm(key: password).configRealm
        
        do {
            safeRealm = try Realm(configuration: realmConfig)
            passwords = safeRealm?.objects(PasswordModel.self)
            return .success(())
            // Define a closure to 
        } catch {
            return .failure(error)
        }
    }
}
