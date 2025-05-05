//
//  UserCommandParserError.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Foundation

@available(*, deprecated, message: "Redo in tools")
enum UserCommandParserError: Error {
    case any
    case typed(Error)
    case noCommand
}

@available(*, deprecated, message: "Redo in tools")
extension UserCommandParserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .any: "ANY"
        case .typed(let error): "TYPED: \(error)"
        case .noCommand: "No command"
        }
    }
}
