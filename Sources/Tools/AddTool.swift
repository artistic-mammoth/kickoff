//
//  AddTool.swift
//  wheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser
import ANSITerminal

struct AddTool: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "add"
        )
    }
    
    @Argument(help: "type")
    public var type: String
    
    public func run() async throws {
        @Injected(\.wheelEngine) var wheelEngine
        let task = ask("What to add?\n")
        try await wheelEngine.addOption(of: type, task)
        print("Successfully added")
    }
}
