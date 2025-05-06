// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

extension WheelTask {
    enum Kind: String, CaseIterable, Codable {
        case basic
        case job
        case rest
    }
}

extension WheelTask.Kind: Readable {
    var readable: String {
        switch self {
        case .basic: "Basic".lightBlack
        case .job: "Job".lightCyan
        case .rest: "Rest".lightGreen
        }
    }
}
