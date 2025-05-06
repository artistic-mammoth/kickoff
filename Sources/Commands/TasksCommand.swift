// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Factory
import ArgumentParser

struct TasksCommand: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "tasks",
            abstract: "Prints all tasks",
            subcommands: [
                AddCommand.self
            ]
        )
    }
    
    public func run() async throws {
        @Injected(\.wheelRepository) var wheelRepository
        let tasks = await wheelRepository.get()
        tasks.forEach {
            $0.dispay()
        }
    }
}
