//
//  UserTool.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser

@available(*, deprecated, message: "Redo as separate tools")
struct UserTool: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "user"
        )
    }
    
    @Argument(help: .init(stringLiteral: inputArgumentHelp))
    public var commad: String
    
    public func run() async throws {
        @Injected(\.userCommandParser) var userCommandParser
        try await userCommandParser.parse(commad)
    }
}

@available(*, deprecated, message: "Redo as separate tools")
fileprivate var inputArgumentHelp: String {
        """
        Based command:
        \(UserCommand.allCases.map {
            "- " + $0.rawValue + "\n"
        }.joined())
        """
}
