//
//  LoopedWheelTool.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory
import ArgumentParser
import ANSITerminal

struct LoopedWheelTool: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "loopedWheelTool"
    )
    
    public func run() async throws {
        await loop()
    }
}

private extension LoopedWheelTool {
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
