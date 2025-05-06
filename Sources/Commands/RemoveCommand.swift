// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Factory
import ArgumentParser

struct RemoveCommand: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "remove",
            abstract: "Remove specific task"
        )
    }
    
    @Option(name: .shortAndLong, help: "Name of task")
    public var named: String?
    
    public func run() async throws {
        @Injected(\.wheelRepository) var wheelRepository
        @Injected(\.userInputTool) var userInputTool
        
        let name = try userInputTool.read(
            quote: "What task to remove?",
            default: named
        )
        
        try await wheelRepository.remove(named: name)
        
        print("Successfully removed")
    }
}
