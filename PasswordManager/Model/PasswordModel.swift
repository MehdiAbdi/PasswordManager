//
//  PasswordModel.swift
//  PasswordManager
//
//  Created by Mehdi on 2/4/22.
//

import Foundation
import RealmSwift


class PasswordModel: Object {
    convenience init(website: String, email: String, password: String) {
        self.init()
        self.website = website
        self.email = email
        self.password = password
    }
    
    @Persisted var website: String = ""
    @Persisted var email: String = ""
    @Persisted var password: String = ""
}
