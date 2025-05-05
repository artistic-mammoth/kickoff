//
//  UserCommandParser.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ANSITerminal

@available(*, deprecated, message: "Redo in tools")
protocol IUserCommandParser {
    func parse(_ input: String) async throws(UserCommandParserError)
}

@available(*, deprecated, message: "Redo in tools")
final class UserCommandParser {
    
    @Injected(\.wheelEngine) private var wheelEngine
}

@available(*, deprecated, message: "Redo in tools")
extension UserCommandParser: IUserCommandParser {
    func parse(_ input: String) async throws(UserCommandParserError) {
        let clearInput = input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
            .replacingOccurrences(of: " ", with: "")
        
        for command in UserCommand.allCases {
            if clearInput.hasPrefix(command.rawValue.lowercased()) {
                do {
                    try await handle(command)
                } catch {
                    throw .typed(error)
                }
                return
            }
        }
        
        throw .noCommand
    }
}

@available(*, deprecated, message: "Redo in tools")
private extension UserCommandParser {
    func handle(_ command: UserCommand) async throws {
        switch command {
        case .add:
            print("Available:")
            WheelType.allCases.forEach {
                print("- ", $0.readable)
            }
            
            let type = ask("what type?\n")
            let arguments = ask("What to add?\n")
            try await wheelEngine.addOption(of: type, arguments)
            print("Successfully added")
        case .wheel:
            let choosedOption = try await wheelEngine.runWheel()
            choosedOption.readableColored()
        case .printAll:
            await wheelEngine.printAll()
        }
    }
}
