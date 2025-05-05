//
//  WheelOfTasksError.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

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
