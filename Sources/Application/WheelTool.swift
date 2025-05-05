//
//  WheelTool.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser

struct WheelTool: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "wheelTool"
    )
    
    @Argument(help: "")
    public var commad: String
    
    public func run() async throws {
        @Injected(\.userCommandParser) var userCommandParser
        do {
            try await userCommandParser.parse(commad)
        } catch .noCommand {
            writeError("No command")
        } catch {
            writeError("ERROR", error.localizedDescription)
        }
    }
}
