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
    
    @Argument(help: "Kind of task")
    public var kind: WheelTask.Kind
    
    @Option(name: .shortAndLong, help: "Priority of task")
    public var priority: WheelTask.Priority?
    
    public func run() async throws {
        @Injected(\.wheelRepository) var wheelRepository
        
        print("What to add?")
        
        let taskName = try readTaskNameFromUser()
        try await wheelRepository.add(
            with: taskName,
            of: kind,
            priority: priority ?? .medium
        )
        
        print("Successfully added")
    }
}

private extension AddCommand {
    func readTaskNameFromUser() throws -> String {
        let name = readLine()
        
        guard let name else {
            throw KickOffError.any
        }
        
        return name
    }
}

extension WheelTask.Kind: ExpressibleByArgument { }
extension WheelTask.Priority: ExpressibleByArgument { }
