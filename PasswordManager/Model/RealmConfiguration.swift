//
//  RealmConfiguration.swift
//  PasswordManager
//
//  Created by Mehdi on 2/4/22.
//

import Foundation
import RealmSwift


enum RealmConfiguration {
    case safeRealm(key: String)
    
    var configRealm: Realm.Configuration {
        switch self {
        case .safeRealm(let key):
            var config = RealmConfiguration.encryptedRealm
            config.encryptionKey = key.sha512
            return config
        }
    }
    
    static let encryptedRealm = Realm.Configuration(fileURL: URL.inDocumentFolder(fileName: "safe.realm"), objectTypes: [PasswordModel.self])
}
