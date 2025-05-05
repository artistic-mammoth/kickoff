// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser

@main
struct KickOff: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "kickoff",
        subcommands: [
            WheelTool.self,
            AddTool.self
        ],
        defaultSubcommand: WheelTool.self
    )
}
