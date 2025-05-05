//
//  WheelType.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

enum WheelType: String, Codable, CaseIterable {
    case basic
    case job
    case rest
}

extension WheelType {
    var weight: Int {
        switch self {
        case .basic: 1
        case .job: 2
        case .rest: 1
        }
    }
    
    var readable: String {
        switch self {
        case .basic: "Basic"
        case .job: "Job"
        case .rest: "Rest"
        }
    }
}
