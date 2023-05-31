//
//  FileManager.swift
//  meuspensamentos
//
//  Created by Suh on 18/05/23.
//

import Foundation

public extension FileManager {
    static var documentDirectoryURL: URL {
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
