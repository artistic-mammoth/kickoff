// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

protocol Readable {
    var readable: String { get }
}

extension Readable {
    func dispay() {
        print(readable)
    }
}
