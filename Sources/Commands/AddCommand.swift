// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Factory
import ArgumentParser

struct AddCommand: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "add",
            abstract: "Add new task"
        )
    }
    
    @Option(name: .shortAndLong, help: "Kind of task")
    public var kind: WheelTask.Kind?
    
    @Option(name: .shortAndLong, help: "Name of task")
    public var named: String?
    
    @Option(name: .shortAndLong, help: "Priority of task")
    public var priority: WheelTask.Priority?
    
    public func run() async throws {
        @Injected(\.wheelRepository) var wheelRepository
        @Injected(\.userInputTool) var userInputTool
        
        let name = try userInputTool.read(
            quote: "What task to add?",
            default: named
        )
        
        try await wheelRepository.add(
            with: name,
            of: kind ?? .basic,
            priority: priority ?? .medium
        )
        
        print("Successfully added")
    }
}
