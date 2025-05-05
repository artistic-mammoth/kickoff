//
//  LoopTool.swift
//  wheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser
import ANSITerminal

@available(*, deprecated, message: "Redo as separate tools")
struct LoopTool: AsyncParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "loop"
        )
    }
    
    public func run() async throws {
        await loop()
    }
}

@available(*, deprecated, message: "Redo as separate tools")
private extension LoopTool {
    func loop() async {
        @Injected(\.userCommandParser) var userCommandParser
        while true {
            do {
                let input = waitForInput()
                try await userCommandParser.parse(input)
            } catch {
                writeError("ERROR", error.localizedDescription)
            }
        }
    }
    
    func waitForInput() -> String {
        moveLineDown()
        write("input".bold.lightMagenta)
        moveRight()
        write(">".bold.magenta)
        moveRight()
        return ask("")
    }
}
