//
//  EncryptionKey+String.swift
//  PasswordManager
//
//  Created by Mehdi on 2/25/22.
//

import Foundation
import UIKit
import CommonCrypto

extension String {
    var sha512: Data? {
        let stringData = data(using: String.Encoding.utf8)!
        var result = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
        
        _ = result.withUnsafeMutableBytes({ resultByte in
            stringData.withUnsafeBytes { stringBytes in
                CC_SHA512(stringBytes, CC_LONG(stringData.count), resultByte)
            }
        })
        
        return result
    }
}
