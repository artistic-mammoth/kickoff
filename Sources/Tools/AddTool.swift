//
//  AddTool.swift
//  wheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser

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
        print("What to add?")
        let task = readLine()
        
        guard let task else {
            throw KickOffError.any
        }
        
        try await wheelEngine.addOption(of: type, task)
        print("Successfully added")
    }
}
