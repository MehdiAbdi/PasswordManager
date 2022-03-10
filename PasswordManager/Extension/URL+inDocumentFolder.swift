//
//  URL+inDocumentFolder.swift
//  PasswordManager
//
//  Created by Mehdi on 2/4/22.
//

import Foundation


extension URL {
    static func inDocumentFolder(fileName: String) -> URL {
        return URL(fileURLWithPath:
                    NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                        .userDomainMask, true)[0], isDirectory: true)
            .appendingPathComponent(fileName)
    }
}
