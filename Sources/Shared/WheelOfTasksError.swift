//
//  WheelOfTasksError.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Foundation

enum WheelOfTasksError: Error {
    case any
}

extension WheelOfTasksError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .any: "ANY"
        }
    }
}
