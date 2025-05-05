//
//  WheelTool.swift
//  wheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser
import ANSITerminal

struct WheelTool: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "wheel"
        )
    }
    
    public func run() async throws {
        @Injected(\.wheelEngine) var wheelEngine
        let choosedOption = try await wheelEngine.runWheel()
        choosedOption.readableColored()
    }
}
