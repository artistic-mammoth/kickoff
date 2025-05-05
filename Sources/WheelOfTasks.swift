// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser

@main
struct WheelOfTasks: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "wheelOfTasks",
        subcommands: [WheelTool.self, LoopedWheelTool.self],
        defaultSubcommand: WheelTool.self
    )
}
