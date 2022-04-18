//
//  SafeRealmViewModel.swift
//  PasswordManager
//
//  Created by Mehdi on 3/3/22.
//
import Foundation
import Combine
import RealmSwift

enum SafeRealmError: Error {
    case failedToSavePassword
    case realmObjectIsEmpty
    case failedToDeletePassword
}

class SafeRealmViewModel: ObservableObject {
    @Published var passwords: Results<PasswordModel>?
    private var safeRealm: Realm?

    func loadSafeRealmWith(password: String) -> Result<Void ,Error> {
        let realmConfig = RealmConfiguration.safeRealm(key: password).configRealm
        
        do {
            safeRealm = try Realm(configuration: realmConfig)
            passwords = safeRealm?.objects(PasswordModel.self)
            
            return .success(())
        } catch {
            return .failure(error)
        }
    }
    
    func save(password: PasswordModel) -> AnyPublisher<Void,SafeRealmError> {
        Future { [unowned self] promise in
            guard let safeRealm = safeRealm else {
                return promise(.failure(SafeRealmError.realmObjectIsEmpty))
            }
            
            do {
                try safeRealm.write({
                    safeRealm.add(password)
                    promise(.success(()))
                })
                
            } catch { promise(.failure(SafeRealmError.failedToSavePassword)) }
        }.eraseToAnyPublisher()
    }
    
    var isPasswordsEmpty: Bool {
        guard let safeRealm = safeRealm else { return false }
        return safeRealm.isEmpty
    }
}
