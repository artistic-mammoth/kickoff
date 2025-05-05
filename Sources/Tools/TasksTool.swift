//
//  TasksTool.swift
//  kickoff
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser

struct TasksTool: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "tasks"
        )
    }
    
    public func run() async throws {
        @Injected(\.wheelEngine) var wheelEngine
        await wheelEngine.printAll()
    }
}
