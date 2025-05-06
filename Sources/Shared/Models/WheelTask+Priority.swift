// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

extension WheelTask {
    enum Priority: String, Codable {
        case low
        case medium
        case high
    }
}

extension WheelTask.Priority {
    var weight: Int {
        switch self {
        case .low: 1
        case .medium: 2
        case .high: 4
        }
    }
}

extension WheelTask.Priority: Readable {
    var readable: String {
        switch self {
        case .low: "!".lightBlack
        case .medium: "!!".yellow
        case .high: "!!!".red
        }
    }
}
