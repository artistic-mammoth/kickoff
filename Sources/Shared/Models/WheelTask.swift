// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Rainbow

struct WheelTask: Codable {
    let name: String
    let kind: Kind
    let priority: Priority
}

extension WheelTask: Readable {
    var readable: String {
        "(".lightWhite +
        priority.readable +
        ")".lightWhite +
        kind.readable +
        ": ".lightWhite +
        name.bold.white
    }
}
