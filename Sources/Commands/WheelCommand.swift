// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Factory
import ArgumentParser

struct WheelCommand: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "wheel",
            abstract: "Run wheel to decide"
        )
    }
    
    public func run() async throws {
        @Injected(\.wheelEngine) var wheelEngine
        let choosed = try await wheelEngine.spin()
        choosed.dispay()
    }
}
