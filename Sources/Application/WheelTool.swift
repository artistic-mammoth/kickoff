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
    
    @Argument(help: .init(stringLiteral: inputArgumentHelp))
    public var commad: String
    
    public func run() async throws {
        @Injected(\.userCommandParser) var userCommandParser
        try await userCommandParser.parse(commad)
    }
}

fileprivate var inputArgumentHelp: String {
        """
        Based command:
        \(UserCommand.allCases.map {
            "- " + $0.rawValue + "\n"
        }.joined())
        """
}
