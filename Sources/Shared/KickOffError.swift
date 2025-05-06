// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Foundation

enum KickOffError: Error {
    case any
}

extension KickOffError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .any: "Something went wrong"
        }
    }
}
